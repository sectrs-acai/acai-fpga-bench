#Works for xdma_enc with encryption and decryption
#Vitis HLS : ../xdma_enc with IP at /home/ubuntu/vitis-hls-ip-2022/xdma_enc.zip
#The corresponding vivado project is /home/ubuntu/Xilinx/V2022/xdma_enc/
#The bitstream that works is /home/ubuntu/Xilinx/V2022/xdma_enc/example_memory_kinda_works.runs/impl_1/design_1_wrapper.bit



import os
import numpy as np
from ctypes import *
import pyaes
#
# XXX: set to 1 to show stdout prints
#      set warmup and bench iters accordingly
#
print_output = 1
warmup_iter = 5
bench_iter = 20


def do_print(vargs):
    if print_output:
        print(vargs)


so_file = "/mnt/host/bench.so"
benchmark = CDLL(so_file)

c2h_dma_device='/dev/xdma0_c2h_1'
c2h_fd = os.open(c2h_dma_device, os.O_RDWR)

h2c_dma_device='/dev/xdma0_h2c_1'
h2c_fd = os.open(h2c_dma_device, os.O_RDWR)

def write_data(inst_buffer_addr,data):
    enc(inst_buffer_addr)
    os.lseek(h2c_fd, inst_buffer_addr , 0)
    os.write(h2c_fd,data)

def read_data(inst_buffer_addr,length):
    dec(inst_buffer_addr)
    os.lseek(c2h_fd, inst_buffer_addr, 0)
    res = os.read(c2h_fd, length)
    return res

def enc(buff):
    aes = pyaes.AESModeOfOperationCTR(os.urandom(32))
    ciphertext = aes.encrypt(str(buff))
    # do_print('Encrypted:', binascii.hexlify(ciphertext))
    return ciphertext

def dec(buff):
    aes = pyaes.AESModeOfOperationCTR(os.urandom(32))
    plaintext = aes.decrypt(str(buff))
    # do_print('Encrypted:', binascii.hexlify(ciphertext))
    return plaintext

def do_benchmark(verify_res=False):
    crypto_addr = 0x40000000
    arr_size = 1000
    int_size = 4
    tot_size = arr_size * int_size
    data = bytearray([0x01, 0x00, 0x00, 0x00] * arr_size)

    do_print("tot_size:")
    do_print(tot_size)


    benchmark.CCA_H_TO_D_START()
    do_print("Writing 1s to crypto area")
    write_data(crypto_addr, data)
    benchmark.CCA_H_TO_D_STOP()

    benchmark.CCA_EXEC_START()
    do_print("Writing address")
    buff_0 = bytearray([0x00, 0x00, 0x00, 0x00])

    ip_addr_1 = 0x10
    buff_addr = bytearray([0x00, 0x00, 0x00, 0x40])
    write_data(ip_addr_1,buff_addr)
    ip_addr_2 = 0x14
    write_data(ip_addr_2,buff_0)

    do_print("Starting execution")
    control_addr = 0x00
    write_data(control_addr,bytearray([int('0b00000001',2)]))

    do_print("Wait for done")
    while int.from_bytes(read_data(control_addr, 1),'big') & int('0b00000010',2) == 0:
        do_print("Waiting")
    benchmark.CCA_EXEC_STOP()

    do_print("Done")
    do_print("Reading results")

    benchmark.CCA_D_TO_H_START()
    res = read_data(crypto_addr, int_size*arr_size)
    benchmark.CCA_D_TO_H_STOP()


    do_print("done write/read ")
    do_print(int_size*arr_size)
    do_print("bytes")

    if verify_res:
        success = True
        for i in range(tot_size):
            if res[i] != data[i]:
                print(f"error at byte {i}: data={data[i]}, res={res[i]}")
                success = False
        print(f"Success={success}")



if __name__ == '__main__':
    benchmark.CCA_FPGA_INIT()

    print_output = 1
    print("warmup iterations: ", warmup_iter)
    print("bench iterations: ", bench_iter)

    for i in range(warmup_iter):
        do_benchmark(verify_res=True)

    print("starting benchmark...")
    print_output = 0
    benchmark.CCA_FPGA_START()

    for i in range(warmup_iter):
        benchmark.CCA_FPGA_WARMUP_ITER()

    for i in range(bench_iter):
        benchmark.CCA_FPGA_BENCH_ITER()
        do_benchmark(verify_res=False)

    benchmark.CCA_FPGA_END()

    print("exit")
