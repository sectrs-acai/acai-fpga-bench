#include "cca_benchmark.h"

void CCA_FPGA_INIT() {
    CCA_BENCHMARK_INIT;
}

void CCA_FPGA_WARMUP_ITER() {
    CCA_FPGA_WARMUP_ITERATION;
}

void CCA_FPGA_BENCH_ITER() {
    CCA_FPGA_BENCH_ITERATION;
}

void CCA_FPGA_START() {
    CCA_BENCHMARK_START;
}

void CCA_FPGA_END() {
    CCA_BENCHMARK_STOP;
}

void CCA_INIT_START(){
    CCA_FPGA_INIT_START;
}
void CCA_INIT_STOP(){
    CCA_FPGA_INIT_STOP;
}

void CCA_H_TO_D_START(){
    CCA_FPGA_H_TO_D_START;
}
void CCA_H_TO_D_STOP(){
    CCA_FPGA_H_TO_D_STOP;
}

void CCA_D_TO_H_START(){
    CCA_FPGA_D_TO_H_START;
}
void CCA_D_TO_H_STOP(){
    CCA_FPGA_D_TO_H_STOP;
}

void CCA_EXEC_START(){
    CCA_FPGA_EXEC_START;
}
void CCA_EXEC_STOP(){
    CCA_FPGA_EXEC_STOP;
}
