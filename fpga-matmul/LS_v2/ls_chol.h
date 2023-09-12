
#ifndef LS_CHOL_H
#define LS_CHOL_H

#include "ap_lib.h"

// lower triangle
const unsigned L_T = true;
const int M = 5;
const int N = 4;
void ls_chol(TC_hls X[N], TC_hls A[M][N], TC_hls Y[M]);


// solve for X, where A * X = Y, using cholesky decomposition
template <int ROW, int COL, typename T>
void ls_chol_template(T X[COL], T A[ROW][COL], T Y[ROW]);

//______________________________________________________________________________
// solve for X, where A * X = Y, using cholesky decomposition

template <int ROW, int COL, typename T>
void ls_chol_template(T X[COL], T A[ROW][COL], T Y[COL]) {

T C[COL][COL];
T P[COL];
T L[COL][COL];
T x_int[COL];

    // compute C = A' * A
    mm_ata<ROW,COL,T>(C,A);
 
    // compute P = A' * Y
    mm_atb<ROW,COL,T>( P, A, Y ); 
  
    // compute L, lower triangle mat, C = L*L'
    hls::cholesky<COL, L_T, T, T>(C, L);
    // backward subsitution to compute Z, L*Z = P
    T Z[COL];
    bs_low<COL,T>( Z, L, P );
    bs_low_t<COL,T>( x_int, L, Z );

    // copy output to local memory
    for (int i=0;i<ROW;i++) 
        X[i] = x_int[i];
}


#endif
