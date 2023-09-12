/*****************************************************************************
 *
 *     Author: Xilinx, Inc.
 *
 *     This text contains proprietary, confidential information of
 *     Xilinx, Inc. , is distributed by under license from Xilinx,
 *     Inc., and may be used, copied and/or disclosed only pursuant to
 *     the terms of a valid license agreement with Xilinx, Inc.
 *
 *     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"
 *     AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND
 *     SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,
 *     OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
 *     APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION
 *     THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,
 *     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE
 *     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY
 *     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE
 *     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
 *     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF
 *     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *     FOR A PARTICULAR PURPOSE.
 *
 *     Xilinx products are not intended for use in life support appliances,
 *     devices, or systems. Use in such applications is expressly prohibited.
 *
 *     (c) Copyright 2013 Xilinx Inc.
 *     All rights reserved.
 *
 *****************************************************************************/

#include "hls_linear_algebra.h"

#ifndef TB_UTILS_H
#define TB_UTILS_H

//______________________________________________________________________________
void init_mat(MATRIX_IN_T A[M][M] ) {

    for (int i = 0; i < M; i++) 
        for (int j = 0; j < M; j++)
          A[i][j] = 0;

}

void rand_mat(MATRIX_IN_T A[M][M] ) {

    for (int i = 0; i < M; i++) 
        for (int j = 0; j < M; j++)
          A[i][j] = rand();

}

void copy_mat(MATRIX_IN_T SRC[M][M], MATRIX_IN_T DST[M][M] ) {

    for (int i = 0; i < M; i++) 
        for (int j = 0; j < M; j++)
          DST[i][j] = SRC[i][j];

}




// ======================================================================
// Matrix Display
// ======================================================================
template <typename T> struct printer {
  static std::string to_s(T x, unsigned prec=60){
    std::stringstream ss;
    ss << setiosflags(ios::fixed) << setprecision(prec) << x;

    return ss.str();
  }
};

// Complex data
// ----------------
// This is used by complex data of any type.  A printer is called to print the real and imaginary
// parts, so this just handles the formating of x+jy
template <typename T> struct printer<hls::x_complex <T> > {
  static std::string to_s(hls::x_complex<T> x, unsigned prec=60){

    // Use the basic type printer to print the real and imaginary parts
    //
    typedef printer<T> printer;

    std::stringstream ss;
    // Remember to deal with -0
    bool neg_imag = x.imag() <= -0 ? true : false;
    T imag        = neg_imag ? 0-x.imag() : x.imag();

    ss << printer::to_s(x.real(), prec) << (neg_imag ? " - j":" + j") << printer::to_s(imag, prec);
    return ss.str();
  }
};

template <unsigned ROWS, unsigned COLS, typename T, typename hls::matrix_transpose_type<T>::transpose_t TRANS> void print_matrix(T *a, std::string prefix = "", unsigned prec=60){
  typedef printer<T> printer;
  typedef hls::matrix_transpose_operation<ROWS, COLS, T> lookup;

  std::string res[ROWS][COLS];
  unsigned widest_entry = 0;

  // Pass 1: Get the individual fields
  for(int r = 0; r < ROWS; r++){
    for(int c = 0; c < COLS; c++){
      T tmp;

      tmp = lookup::getElement(a, r, c, TRANS);

      res[r][c] = printer::to_s(tmp, prec);
      if(res[r][c].length() > widest_entry){
        widest_entry = res[r][c].length();
      }
    }
  }

  // Stage 2.  Print it out.  Each colum should be "widest_entry" chars wide
  char col_gap_str[5] = "    ";
  unsigned col_width = widest_entry;

  for(int r = 0; r < ROWS; r++){
    printf("%s|", prefix.c_str());
    for(int c = 0; c < COLS; c++){

      unsigned num_spaces_needed = col_width - res[r][c].length();
      for(int x = 0; x< num_spaces_needed; x++){
        printf(" ");
      }
      printf( "(%s)", res[r][c].c_str());

      if(c!=COLS-1){
        printf("%s", col_gap_str);
      }
    }
    printf(" |\n");
  }
}

template<unsigned ROWS, unsigned COLS, typename T, typename hls::matrix_transpose_type<T>::transpose_t TRANS>void print_matrix(T a[ROWS][COLS], std::string prefix = "", unsigned prec=60){
  print_matrix<ROWS, COLS, T, TRANS>((T *)a, prefix, prec);
}

#endif
