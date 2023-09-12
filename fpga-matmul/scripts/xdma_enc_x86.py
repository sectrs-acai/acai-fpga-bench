#Works for xdma_enc with encryption and decryption
#Vitis HLS : ../xdma_enc with IP at /home/ubuntu/vitis-hls-ip-2022/xdma_enc.zip
#The corresponding vivado project is /home/ubuntu/Xilinx/V2022/xdma_enc/
#The bitstream that works is /home/ubuntu/Xilinx/V2022/xdma_enc/example_memory_kinda_works.runs/impl_1/design_1_wrapper.bit


import os
import pyaes


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

crypto_addr = 0x40000000
arr_size = 1000
int_size = 4

print("Writing 1s to crypto area")
write_data(crypto_addr,bytearray([0x01, 0x00, 0x00, 0x00] * arr_size))
read_data(crypto_addr, int_size*arr_size)

print("Writing address")
buff_0 = bytearray([0x00, 0x00, 0x00, 0x00])

ip_addr_1 = 0x10
buff_addr = bytearray([0x00, 0x00, 0x00, 0x40])
write_data(ip_addr_1,buff_addr)
ip_addr_2 = 0x14
write_data(ip_addr_2,buff_0)

print("Starting execution")
control_addr = 0x00
write_data(control_addr,bytearray([int('0b00000001',2)]))

print("Wait for done")
while int.from_bytes(read_data(control_addr, 1),'big') & int('0b00000010',2) == 0:
    print("Waiting")

print("Done")
print("Reading results")
res = read_data(crypto_addr, int_size*arr_size)

print("done write/read ", int_size*arr_size , "bytes")