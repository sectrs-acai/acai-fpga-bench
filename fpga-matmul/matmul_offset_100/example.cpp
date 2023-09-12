#include <stdio.h>
#include <string.h>

#define MAX_SIZE 250000
#define MAX_ROW_SIZE 100
#define MAX_COL_SIZE 100


void matmul(const int A[MAX_ROW_SIZE][MAX_COL_SIZE], const int B[MAX_ROW_SIZE][MAX_COL_SIZE], int C[MAX_ROW_SIZE][MAX_COL_SIZE], int size_r, int size_c) {
//    const int AROWS_INT = AROWS;
//    const int ACOLS_INT = (transA ? AROWS : ACOLS);
//    const int BROWS_INT = (transB ? BCOLS : BROWS);
//    const int BCOLS_INT = (transB ? BROWS : BCOLS);
    int AROWS = size_r;
    int BCOLS = size_c;
    int ACOLS = size_c;

    int a_tmp, b_tmp;
    int sum;
    for (int a_row = 0; a_row < AROWS; a_row++) {
        for (int b_col = 0; b_col < BCOLS; b_col++) {
            sum = 0;
            for (int i = 0; i < ACOLS; i++) {
                    a_tmp = A[a_row][i];
                    b_tmp = B[i][b_col];

                sum = sum + (a_tmp * b_tmp);
            }
            C[a_row][b_col] = sum;
        }
    }
}


void example(volatile int *a, volatile int *b, volatile int *c, int size_r, int size_c){
  
#pragma HLS INTERFACE m_axi port=a depth=MAX_SIZE offset=slave
#pragma HLS INTERFACE m_axi port=b depth=MAX_SIZE offset=slave
#pragma HLS INTERFACE m_axi port=c depth=MAX_SIZE offset=slave
#pragma HLS INTERFACE mode=s_axilite port=a bundle=BUS_A
#pragma HLS INTERFACE mode=s_axilite port=b bundle=BUS_A
#pragma HLS INTERFACE mode=s_axilite port=c bundle=BUS_A
#pragma HLS INTERFACE mode=s_axilite port=size_r bundle=BUS_A
#pragma HLS INTERFACE mode=s_axilite port=size_c bundle=BUS_A
#pragma HLS INTERFACE mode=s_axilite port=return bundle=BUS_A


  int A[MAX_ROW_SIZE][MAX_COL_SIZE];
  int B[MAX_ROW_SIZE][MAX_COL_SIZE];
  int res[MAX_ROW_SIZE][MAX_COL_SIZE];
  //memcpy creates a burst access to memory
  //multiple calls of memcpy cannot be pipelined and will be scheduled sequentially
  //memcpy requires a local buffer to store the results of the memory transaction
  memcpy(A,(const int*)a,(MAX_ROW_SIZE * MAX_COL_SIZE)*sizeof(int));
  memcpy(B,(const int*)b,(MAX_ROW_SIZE * MAX_COL_SIZE)*sizeof(int));
  memcpy(res,(const int*)c,(MAX_ROW_SIZE * MAX_COL_SIZE)*sizeof(int));

  matmul(A, B, res, size_r, size_c);

  memcpy((int *)c,res,(MAX_ROW_SIZE * MAX_COL_SIZE)*sizeof(int));
}

  


