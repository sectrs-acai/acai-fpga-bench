open_project -reset HLS_proj
add_files ls_chol.cpp
add_files -tb ls_chol_tb.cpp
set_top ls_chol

open_solution -reset sol1
set_part  {xc7k160tfbg484-1}
create_clock -period "300MHz"

csim_design
# csynth_design
# cosim_design -rtl verilog -tool modelsim -trace_level all

#set hls_exec 3
#if {$hls_exec == 1} {
	## Run Synthesis and Exit
	#csynth_design
	
#} elseif {$hls_exec == 2} {
	## Run Synthesis, RTL Simulation and Exit
	#csynth_design
	#cosim_design
#} elseif {$hls_exec == 3} { 
	# Run Synthesis, RTL Simulation, RTL implementation and Exit
	
	# Generate pcore
	#export_design -format sysgen -evaluate verilog
#} else {
	# Default is to exit after setup
	#csynth_design
#}

exit

