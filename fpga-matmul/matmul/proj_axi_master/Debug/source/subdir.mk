################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/ubuntu/arm-cca/gitlab/fpga/matmul/example.cpp 

OBJS += \
./source/example.o 

CPP_DEPS += \
./source/example.d 


# Each subdirectory must supply rules for building sources it contributes
source/example.o: /home/ubuntu/arm-cca/gitlab/fpga/matmul/example.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/home/ubuntu/git/Vitis_Libraries/solver -I/home/ubuntu/git/Vitis_Libraries/solver/L1/tests/ -I/home/ubuntu/arm-cca/gitlab/fpga/matmul -I/home/ubuntu/xilinx_install/Vitis_HLS/2022.2/lnx64/tools/systemc/include -I/home/ubuntu/xilinx_install/Vitis_HLS/2022.2/include/ap_sysc -I/home/ubuntu/xilinx_install/Vitis_HLS/2022.2/include/etc -I/home/ubuntu/xilinx_install/Vitis_HLS/2022.2/lnx64/tools/auto_cc/include -I/home/ubuntu/xilinx_install/Vitis_HLS/2022.2/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"source/example.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


