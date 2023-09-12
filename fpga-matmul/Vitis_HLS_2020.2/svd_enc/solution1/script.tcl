############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project svd_enc
set_top svd_top1
add_files svd_enc/svd.cpp -cflags "-I/home/ubuntu/git/Vitis_Libraries/security/L1/include" -csimflags "-I/home/ubuntu/git/Vitis_Libraries/security/L1/include"
add_files svd_enc/svd.h
add_files -tb svd_enc/svd_tb.cpp -cflags "-I../../../../git/Vitis_Libraries/security/L1/include" -csimflags "-I../../../../git/Vitis_Libraries/security/L1/include"
open_solution "solution1" -flow_target vivado
set_part {xcvu9p-flga2104-2L-e}
create_clock -period 10 -name default
config_interface -s_axilite_data64
config_export -description {SVD with 32x32 large depth} -format ip_catalog -output /home/ubuntu/arm-cca/gitlab/fpga/Vitis_HLS_2020.2/ip/svd_top1_32_large_depth.zip -rtl verilog -version 1.0
source "./svd_enc/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -description "SVD with 32x32 with enc large depth" -output /home/ubuntu/arm-cca/gitlab/fpga/Vitis_HLS_2020.2/ip/svd_top1_32_large_depth_enc.zip
