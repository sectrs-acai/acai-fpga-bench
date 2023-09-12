#Works for proj_axi_master in /home/ubuntu/arm-cca/gitlab/fpga/using_axi_master_offset
#The corresponding vivado project is /home/ubuntu/Xilinx/Vivado2022/example_memory
#The bitstream that works is in /home/ubuntu/Xilinx/Vivado2022/example_memory/example_memory_working_32bit_saxi.runs
#The saxi offsets are in ./axi_offsets/axi_offsets.png

import os
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
    return res

size = 65500
print("Writing 1s")
data_addr = 0x90000000
read_data(data_addr, 4*size)
write_data(data_addr,bytearray([0x01, 0x00, 0x00, 0x00] * size))
read_data(data_addr, 4*size)

print("Writing address")
ip_addr_1 = 0x10
read_data(ip_addr_1, 4)
write_data(ip_addr_1,bytearray([0x00, 0x00, 0x00, 0x90]))
ip_addr_2 = 0x14
read_data(ip_addr_2, 4)
write_data(ip_addr_2,bytearray([0x00, 0x00, 0x00, 0x00]))
read_data(ip_addr_1, 8)

print("Writing size")
size_addr = 0x1c
read_data(size_addr, 4)
write_data(size_addr, size.to_bytes(4, 'little'))
read_data(size_addr, 4)

print("Starting execution")
control_addr = 0x00
read_data(control_addr, 1)
write_data(control_addr,bytearray([int('0b00000001',2)]))

print("Wait for done")
while int.from_bytes(read_data(control_addr, 1),'big') & int('0b00000010',2) == 0:
    print("Waiting")

print("Done")
print("Reading results")
res = read_data(data_addr, 4*size)

arr = [1]*size
expected_val = [x+100 if i %2==0 else x for i,x in enumerate(arr)]

print(res[0], res[4], res[8])
correct = 1
print("Checking results")
for i in range(0,size):
    if res[i*4] == expected_val[i]:
        None
    else:
        correct = 0
        print("Did not match ", i, res[i*4], expected_val[i])
        break

if correct == 0:
    print("Test failed")
else:
    print("Test passed")