//______________________________________________________________________________
// ap_lib.h
// - collection of utility functions
//
//
// a. paek jan 2014
//______________________________________________________________________________
//#include <fstream>
#include <iostream>
#include <iomanip>
#include <complex>
#include <stdlib.h>
#include <time.h>
#include </opt/Xilinx/Vivado_HLS/2016.4/include/hls_linear_algebra.h>

using namespace std;

typedef float T_MAT;

struct T_CMPX {
    T_MAT r, i;
};

typedef std::complex<T_MAT> TC_std;

typedef hls::x_complex<float> TC_hls;

template <int ROW, int COL, typename T>
void print_mat(T X[ROW][COL]);

template <int ROW, typename T>
void print_mat(T X[ROW]);

template <int ROW, int COL, typename T>
void print_cmat(T X[ROW][COL]);

template <int ROW, typename T>
void print_cmat(T X[ROW]);

template <int ROW, int COL, typename Tc, typename T>
void init_cmat(Tc A[ROW][COL]);

template <int ROW, typename Tc, typename T>
void init_cmat(Tc A[ROW]);

template <int ROW, int COL, typename T>
void rand_mat(T A[ROW][COL] );

template <int ROW, int COL, typename T>
void copy_mat(T DST[ROW][COL], T SRC[ROW][COL] );

// c = a' * a, assume complex matrix
template <int ROW, int COL, typename T_MAT, typename T>
void mm_ata(T_MAT c[COL][COL], T_MAT a[ROW][COL]);

template <int ROW, int COL, typename Tc>
void mm_ata(Tc c[COL][COL], Tc a[ROW][COL]);

// c = a' * b, assume complex matrix, b is a col vector
template <int ROW, int COL, typename Tc, typename T>
void mm_atb(Tc c[COL], Tc a[ROW][COL], Tc b[ROW]);

template <int ROW, int COL, typename Tc>
void mm_atb(Tc c[COL], Tc a[ROW][COL], Tc b[ROW]);

// complex divider
template <typename T>
int div_cmpx(T& c, T a, T b);

// L*Z = P, solve for Z, L is lower tri matrix, P is a row vector, all complex
template <int ROW, typename Tc>
void bs_low(Tc Z[ROW], Tc L[ROW][ROW], Tc P[ROW]);

// L'*Z = P, solve for Z, L is lower tri matrix, P is a row vector, all complex
template <int ROW, typename Tc>
void bs_low_t(Tc Z[ROW], Tc L[ROW][ROW], Tc P[ROW]);


//______________________________________________________________________________
// print matrix

template <int ROW, int COL, typename T>
void print_mat(T X[ROW][COL]) {

    cout << endl;
    for (int j = 0; j < ROW; j++) {
        cout << endl;
        for (int k = 0; k < COL; k++) 
             cout << setw(10) << X[j][k] << ",  ";
    }
}

template <int ROW, typename T>
void print_mat(T X[ROW]) {

    cout << endl;
    cout << endl;
    for (int j = 0; j < ROW; j++) {
         cout << setw(10) << X[j]<< ",  ";
    }
}

#ifdef NONEED
template <int ROW, int COL, typename T>
void print_cmat(T X[ROW][COL]) {

    cout << endl;
    for (int j = 0; j < ROW; j++) {
        cout << endl;
        for (int k = 0; k < COL; k++) 
             cout << setw(10) << X[j][k].r << " + j*" << X[j][k].i << ",   ";
    }
}

template <int ROW, typename T>
void print_cmat(T X[ROW]) {

    cout << endl;
    cout << endl;
    for (int j = 0; j < ROW; j++) {
            cout << setw(10) << X[j].r << " + j*" << X[j].i << ",   ";
    }
}

#endif

//______________________________________________________________________________
// matrix multiplication


// c = a' * a, assume complex matrix, utilizing <complex> 
// pragma set for one output per clk cycle
// typedef float T;
// struct Tc { T r, i; };

template <int ROW, int COL, typename Tc>
void mm_ata(Tc c[COL][COL], Tc a[ROW][COL]) {

#pragma HLS array_partition variable=a complete dim=1

	int  i,j,k;
    Tc   tmp; 
    Tc   aa, bb, cc;

loop_i: for (i=0;i<COL;i++) {

loop_j: for (j=0;j<COL;j++) {
            tmp = Tc(0,0);

loop_k: for (k=0;k<ROW;k++) {

                #pragma HLS PIPELINE
				aa = a[k][i];
				bb = a[k][j];
				//cc = std::conj(aa) * bb;
				cc = hls::x_conj(aa) * bb;
				//cc = aa * bb;
				tmp += cc;
			}
		    c[i][j] = tmp;
		}
	}
}


// c = a' * a, assume complex matrix
// pragma set for one output per clk cycle
// typedef float T;
// struct Tc { T r, i; };

template <int ROW, int COL, typename Tc, typename T>
void mm_ata(Tc c[COL][COL], Tc a[ROW][COL]) {

#pragma HLS array_partition variable=a complete dim=1

	int  i,j,k;
    Tc   tmp; 
    T    ar,ai, br,bi, cr, ci;

loop_i: for (i=0;i<COL;i++) {

loop_j: for (j=0;j<COL;j++) {
            tmp.r = 0;
            tmp.i = 0;

loop_k: for (k=0;k<ROW;k++) {

                #pragma HLS PIPELINE
				ar = a[k][i].r;
				ai = a[k][i].i;
				br = a[k][j].r;
				bi = a[k][j].i;

                // conjugation needs to happen!
				cr = ar*br + ai*bi;
				ci = ar*bi - ai*br;

				tmp.r += cr;
				tmp.i += ci;
			}
		    c[i][j].r = tmp.r;
		    c[i][j].i = tmp.i;
		}
	}
}


// c = a' * b, assume complex matrix, b is a col vector, utilizing <complex>
// pragma set for one output per clk cycle
// typedef float T;
// struct Tc { T r, i; };

template <int ROW, int COL, typename Tc>
void mm_atb(Tc c[COL], Tc a[ROW][COL], Tc b[ROW]) {

#pragma HLS array_partition variable=a complete dim=2
#pragma HLS array_partition variable=b complete dim=1

	int i,k;
    Tc  tmp;
    Tc  aa, bb, cc;

loop_i: for (i=0;i<COL;i++) {

            tmp = Tc(0,0);

loop_k: for (k=0;k<ROW;k++) {

#pragma HLS PIPELINE
				//aa = std::conj(a[k][i]);
				aa = hls::x_conj(a[k][i]);
				bb = b[k];
				cc = aa * bb;
				tmp += cc;
			}
		    c[i] = tmp;
		}
}

// c = a' * b, assume complex matrix, b is a col vector
// pragma set for one output per clk cycle
// typedef float T;
// struct Tc { T r, i; };

template <int ROW, int COL, typename Tc, typename T>
void mm_atb(Tc c[COL], Tc a[ROW][COL], Tc b[ROW]) {

#pragma HLS array_partition variable=a complete dim=2
#pragma HLS array_partition variable=b complete dim=1

	int i,k;
    Tc  tmp;
    T   ar,ai, br,bi, cr, ci;

loop_i: for (i=0;i<COL;i++) {

            tmp.r = 0;
            tmp.i = 0;

loop_k: for (k=0;k<ROW;k++) {

#pragma HLS PIPELINE
				ar = a[k][i].r;
				ai = a[k][i].i;
				br = b[k].r;
				bi = b[k].i;

                // conjugation needs to happen!
				cr = ar*br + ai*bi;
				ci = ar*bi - ai*br;

				tmp.r += cr;
				tmp.i += ci;
			}
		    c[i].r = tmp.r;
		    c[i].i = tmp.i;
		}
}


//______________________________________________________________________________
// initialize a complex matrix

// typedef float T;
// struct Tc { T r, i; };

template <int ROW, int COL, typename Tc, typename T>
void init_cmat(Tc A[ROW][COL]) {

T init_r = 0.1;
T init_i = 2.1;

    for (int j = 0; j < COL; j++) 
        for (int i = 0; i < ROW; i++) {
          A[i][j].r = init_r;
          A[i][j].i = init_i;
          init_r += 0.1;
          init_i += 0.1;
        }
}

template <int ROW, typename Tc, typename T>
void init_cmat(Tc A[ROW]) {

T init_r = 0.1;
T init_i = 2.1;

        for (int i = 0; i < ROW; i++) {
          A[i].r = init_r;
          A[i].i = init_i;
          init_r += 0.1;
          init_i += 0.1;
        }
}


//______________________________________________________________________________
// back substitution

// divide
// returns 1 if divide by 0

template <typename T>
int div_cmpx(T& c, T a, T b) {

float bot;  // revisit later
T prod;

      bot = b.real()*b.real() + b.imag()*b.imag();

      if (bot==0) return 1;
      else {
          prod = a * hls::x_conj(b);
          c    = prod / bot;
          return 0;
      }
}

// L*Z = P, solve for Z, L is lower tri matrix, P is a row vector, all complex
// need more numerically robust BS
template <int ROW, typename Tc>
void bs_low(Tc Z[ROW], Tc L[ROW][ROW], Tc P[ROW]) {

Tc sum;
int error_nan;
       
//Z[0] = P[0] / L[0][0];
error_nan = div_cmpx<Tc> (Z[0], P[0], L[0][0]);

L_i: for (int i = 1; i < ROW; i++) {
        sum = Tc(0,0);
L_j:    for (int j = 0; j < i; j++) {
            sum += Z[j] * L[i][j];
        }
        //Z[i] = (P[i] - sum) / L[i][i];
        error_nan = div_cmpx<Tc> (Z[i], (P[i] - sum), L[i][i]);
    }
}




// L'*Z = P, solve for Z, L is lower tri matrix, P is a row vector, all complex
template <int ROW, typename Tc>
void bs_low_t(Tc Z[ROW], Tc L[ROW][ROW], Tc P[ROW]) {

Tc sum;
int error_nan;
       
//Z[ROW-1] = P[ROW-1] / L[ROW-1][ROW-1];
error_nan = div_cmpx<Tc> (Z[ROW-1], P[ROW-1], hls::x_conj(L[ROW-1][ROW-1]));

L_i: for (int i = ROW-2; i >= 0; i--) {
        sum = Tc(0,0);
L_j:    for (int j = ROW-1; j > i; j--)  {
            sum += Z[j] * hls::x_conj(L[j][i]);
        }
        //Z[i] = (P[i] - sum) / L[i][i];
        error_nan = div_cmpx<Tc> (Z[i], (P[i] - sum), hls::x_conj(L[i][i]));
    }
}



//______________________________________________________________________________

#ifdef RAND
template <int ROW, int COL, typename T>
void rand_mat(T A[ROW][COL] ) {

    srand(time(NULL));
    //srand(1);

    for (int i = 0; i < ROW; i++) 
        for (int j = 0; j < COL; j++)
          A[i][j] = T(rand(), rand());
}

template <int ROW, int COL, typename T>
void copy_mat(T DST[ROW][COL], T SRC[ROW][COL] ) {

    for (int i = 0; i < ROW; i++) 
        for (int j = 0; j < COL; j++)
          DST[i][j] = SRC[i][j];
}
#endif

