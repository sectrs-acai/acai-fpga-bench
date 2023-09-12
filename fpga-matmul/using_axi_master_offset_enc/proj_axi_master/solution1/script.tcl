############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project proj_axi_master
set_top example
add_files example.cpp -cflags "-I/home/ubuntu/git/Vitis_Libraries/security/L1/include" -csimflags "-I/home/ubuntu/git/Vitis_Libraries/security/L1/include"
add_files enc_dec.hpp
add_files -tb example_test.cpp -cflags "-Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xcvu9p-flga2104-2L-e}
create_clock -period 200MHz -name default
config_export -description {memory ip without self restart enabled and 200Mhz clock and offset and size saxi with enc large} -display_name add_100 -format ip_catalog -output /home/ubuntu/vitis-hls-ip-2022/using_axi_master_offset_enc_large.zip -rtl verilog -version 2.0
source "./proj_axi_master/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design -trace_level all
export_design -rtl verilog -format ip_catalog -output /home/ubuntu/vitis-hls-ip-2022/using_axi_master_offset_enc_large.zip
