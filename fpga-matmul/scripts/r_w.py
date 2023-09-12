#Works for proj_axi_master in Vitis HLS Introductory example
#The corresponding vivado project is /home/ubuntu/Xilinx/Vivado2022/example_memory
#The bitstream that works is in /home/ubuntu/Xilinx/Vivado2022/example_memory/example_memory.runs_works_32bit_100mhz.runs

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

print("Writing 1s")
data_addr = 0x80000000
read_data(data_addr, 4*50)
write_data(data_addr,bytearray([0x01, 0x00, 0x00, 0x00] * 50))
read_data(data_addr, 4*50)

print("Starting execution")
control_addr = 0x00
read_data(control_addr, 1)
write_data(control_addr,bytearray([int('0b00000001',2)]))

print("Wait for done")
while int.from_bytes(read_data(control_addr, 1),'big') & int('0b00000010',2) == 0:
    print("Waiting")

print("Done")
print("Reading results")
data_addr = 0x80000000
res = read_data(data_addr, 4*50)

arr = [1]*50
expected_val = [x+100 if i %2==0 else x for i,x in enumerate(arr)]

print(res[0], res[4], res[8])
correct = 1
print("Checking results")
for i in range(0,50):
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