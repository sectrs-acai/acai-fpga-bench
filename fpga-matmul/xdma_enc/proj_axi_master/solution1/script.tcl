############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project proj_axi_master
set_top example
add_files enc_dec.hpp
add_files example.cpp -cflags "-I/home/ubuntu/git/Vitis_Libraries/security/L1/include" -csimflags "-I/home/ubuntu/git/Vitis_Libraries/security/L1/include"
add_files -tb example_test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xcvu9p-flga2104-2-i}
create_clock -period 100MHz -name default
config_export -description {encrypt xdma with 2500 blocks} -display_name add_100 -format ip_catalog -output /home/ubuntu/vitis-hls-ip-2022/xdma_enc.zip -rtl verilog -version 2.0
source "./proj_axi_master/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output /home/ubuntu/vitis-hls-ip-2022/xdma_enc.zip
