############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project LS
set_top ls_chol
add_files ap_lib.h
add_files ls_chol.cpp -cflags "-I/opt/Xilinx/Vivado_HLS/2016.4/include/hls/linear_algebra -I/opt/Xilinx/Vivado_HLS/2016.4/include/hls_linear_algebra.h" -csimflags "-I/opt/Xilinx/Vivado_HLS/2016.4/include/hls/linear_algebra -I/opt/Xilinx/Vivado_HLS/2016.4/include/hls_linear_algebra.h"
add_files ls_chol.h
add_files -tb ls_chol_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xcvu9p-flga2104-2L-e}
create_clock -period 10 -name default
#source "./LS/solution1/directives.tcl"
csim_design -compiler gcc
csynth_design
cosim_design
export_design -format ip_catalog
