// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
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
 *     (c) Copyright 2014-2019 Xilinx Inc.
 *     All rights reserved.
 *
 *****************************************************************************/

//#ifndef SVD_H
//#define SVD_H
#include <iostream>
 #include </tools/Xilinx/Vitis_HLS/2020.2/include/gmp.h>
#include "hls_linear_algebra.h"
#include "ap_int.h"
#include "hls_stream.h"
#include "xf_security/ctr.hpp"


// cipherkey size in byte
#define KEY_SIZE 16
// cipher block size in byte
#define BLK_SIZE 16


const int A_ROWS = 32;
const int A_COLS = 32;

const int NUM_BLOCKS = 1024;

typedef float MATRIX_IN_T;
typedef float MATRIX_OUT_T;


void decrypt(hls::stream<ap_uint<BLK_SIZE*8> >& ciphertext,
          hls::stream<bool>& ciphertext_e,
          hls::stream<ap_uint<KEY_SIZE*8> >& cipherkey,
          hls::stream<ap_uint<BLK_SIZE*8> >& IV_strm,
          hls::stream<ap_uint<BLK_SIZE*8> >& plaintext,
          hls::stream<bool>& plaintext_e);

void encrypt(hls::stream<ap_uint<BLK_SIZE*8> >& ciphertext,
          hls::stream<bool>& ciphertext_e,
          hls::stream<ap_uint<KEY_SIZE*8> >& cipherkey,
          hls::stream<ap_uint<BLK_SIZE*8> >& IV_strm,
          hls::stream<ap_uint<BLK_SIZE*8> >& plaintext,
          hls::stream<bool>& plaintext_e);

int svd_top1(const MATRIX_IN_T A[A_ROWS][A_COLS],
             MATRIX_OUT_T S[A_ROWS][A_ROWS],
             MATRIX_OUT_T U[A_ROWS][A_ROWS],
             MATRIX_OUT_T V[A_COLS][A_COLS],
             volatile int *crypto
    );

//#endif

