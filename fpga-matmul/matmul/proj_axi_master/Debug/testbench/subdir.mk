################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/ubuntu/arm-cca/gitlab/fpga/matmul/example_test.cpp 

OBJS += \
./testbench/example_test.o 

CPP_DEPS += \
./testbench/example_test.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/example_test.o: /home/ubuntu/arm-cca/gitlab/fpga/matmul/example_test.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/home/ubuntu/arm-cca/gitlab/fpga/matmul -I/home/ubuntu/xilinx_install/Vitis_HLS/2022.2/lnx64/tools/systemc/include -I/home/ubuntu/xilinx_install/Vitis_HLS/2022.2/include/ap_sysc -I/home/ubuntu/xilinx_install/Vitis_HLS/2022.2/include/etc -I/home/ubuntu/xilinx_install/Vitis_HLS/2022.2/lnx64/tools/auto_cc/include -I/home/ubuntu/xilinx_install/Vitis_HLS/2022.2/include -O0 -g3 -Wall -Wno-unknown-pragmas -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"testbench/example_test.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


