############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project proj_axi_master
set_top example
add_files example.cpp -cflags "-I/home/ubuntu/git/Vitis_Libraries/solver -I/home/ubuntu/git/Vitis_Libraries/solver/L1/tests/." -csimflags "-I/home/ubuntu/git/Vitis_Libraries/solver -I/home/ubuntu/git/Vitis_Libraries/solver/L1/tests/."
add_files -tb example_test.cpp -cflags "-Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas -Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xcvu9p-flga2104-2-i}
create_clock -period 200MHz -name default
config_export -description {matmul with saxi offset 100 by 100} -display_name add_100 -format ip_catalog -output /home/ubuntu/vitis-hls-ip-2022/matmul_100.zip -rtl verilog -version 2.0
source "./proj_axi_master/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output /home/ubuntu/vitis-hls-ip-2022/matmul_100.zip
