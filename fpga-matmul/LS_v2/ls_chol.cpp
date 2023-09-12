//______________________________________________________________________________
// ls_chol.cpp
// - solve for X, where A * X = Y, using cholesky decomposition
//
// a. paek jan 2014
//______________________________________________________________________________


#include "ls_chol.h"

void ls_chol(TC_hls X[N], TC_hls A[M][N], TC_hls Y[M]) {

TC_hls x_int[N];
TC_hls a_int[M][N];
TC_hls y_int[M];

  // copy to internal storage
  for (int i=0;i<M;i++)
    for (int j=0;j<N;j++)
      a_int[i][j] = A[i][j];

  for (int i=0;i<M;i++)
      y_int[i] = Y[i];

  ls_chol_template<M,N,TC_hls>(x_int, a_int, y_int);

  for (int i=0;i<N;i++)
      X[i] = x_int[i];

}

