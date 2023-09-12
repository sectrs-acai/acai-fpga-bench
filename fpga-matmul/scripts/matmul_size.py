#Works for matmul in /home/ubuntu/arm-cca/gitlab/fpga/matmul
#The corresponding vivado project is /home/ubuntu/Xilinx/Vivado2022/matmul
#The bitstream that works is in /home/ubuntu/Xilinx/Vivado2022/matmul/example_memory_working_matmul.runs
#The saxi offsets are in ./axi_offsets/matmul.png

import os
import numpy as np 
import time
c2h_dma_device='/dev/xdma0_c2h_1'
c2h_fd = os.open(c2h_dma_device, os.O_RDWR)

h2c_dma_device='/dev/xdma0_h2c_1'
h2c_fd = os.open(h2c_dma_device, os.O_RDWR)

def write_data(inst_buffer_addr,data):
    os.lseek(h2c_fd, inst_buffer_addr , 0)
    os.write(h2c_fd,data)

def read_data(inst_buffer_addr,length):
    os.lseek(c2h_fd, inst_buffer_addr, 0)
    res = os.read(c2h_fd, length)
    print(res)
    return res

size_r = 10
size_c = 10
size = size_r * size_c
print("Writing 1s")

data_addr_1 = 0x80000000
read_data(data_addr_1, 4*size)
write_data(data_addr_1,bytearray([0x01, 0x00, 0x00, 0x00] * size))
read_data(data_addr_1, 4*size)
data_addr_2 = 0x90000000
read_data(data_addr_2, 4*size)
write_data(data_addr_2,bytearray([0x01, 0x00, 0x00, 0x00] * size))
read_data(data_addr_2, 4*size)
data_addr_3 = 0xA0000000
read_data(data_addr_3, 4*size)
write_data(data_addr_3,bytearray([0x01, 0x00, 0x00, 0x00] * size))
read_data(data_addr_3, 4*size)

print("Writing address")
ip_addr_1 = 0x10
read_data(ip_addr_1, 4)
write_data(ip_addr_1,bytearray([0x00, 0x00, 0x00, 0x80]))
ip_addr_2 = 0x14
read_data(ip_addr_2, 4)
write_data(ip_addr_2,bytearray([0x00, 0x00, 0x00, 0x00]))
read_data(ip_addr_1, 8)

ip_addr_1 = 0x1c
read_data(ip_addr_1, 4)
write_data(ip_addr_1,bytearray([0x00, 0x00, 0x00, 0x90]))
ip_addr_2 = 0x20
read_data(ip_addr_2, 4)
write_data(ip_addr_2,bytearray([0x00, 0x00, 0x00, 0x00]))
read_data(ip_addr_1, 8)

ip_addr_1 = 0x28
read_data(ip_addr_1, 4)
write_data(ip_addr_1,bytearray([0x00, 0x00, 0x00, 0xA0]))
ip_addr_2 = 0x2c
read_data(ip_addr_2, 4)
write_data(ip_addr_2,bytearray([0x00, 0x00, 0x00, 0x00]))
read_data(ip_addr_1, 8)

print("Writing size")
size_addr = 0x34
read_data(size_addr, 4)
write_data(size_addr, size_r.to_bytes(4, 'little'))
read_data(size_addr, 4)

size_addr = 0x3c
read_data(size_addr, 4)
write_data(size_addr, size_c.to_bytes(4, 'little'))
read_data(size_addr, 4)

# print("Starting execution")
# control_addr = 0x00
# read_data(control_addr, 1)
# write_data(control_addr,bytearray([int('0b00000001',2)]))

# print("Wait for done")
# while int.from_bytes(read_data(control_addr, 1),'big') & int('0b00000010',2) == 0:
#     print("Waiting")

time.sleep(1)
data_addr_3 = 0xA0000000

print("Done")
print("Reading results")
res = read_data(data_addr_3, 4*size)

expected_val = np.matmul(np.ones((size_r,size_c)), np.ones((size_r,size_c)))

correct = 1
print("Checking results")
for i in range(0,size_r):
    for j in range(0,size_c):
        fr = ((i*size_c)+j)*4
        to = fr+4
        val = int.from_bytes(res[fr : to], 'little')
        if j%2 == 1:
            continue
        if val == expected_val[i][j]:
            None 
        else:
            correct = 0
            print("Did not match ", i, j, val, expected_val[i][j])
            break


if correct == 0:
    print("Test failed")
else:
    print("Test passed")