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

#include "svd.h"

const int ARR_SIZE = 128;
#define NUM_BLOCKS_1 1024 //(32*32*4*4*8)/128

void enc(ap_uint<8*BLK_SIZE> buff[ARR_SIZE], ap_uint<8*BLK_SIZE> ct[ARR_SIZE]){

    const unsigned char key[] =
    	        "abcdefghijklmnopqrstuvwxyz"
    	        "abcdefghijklmnopqrstuvwxyz";

    const unsigned char ivec[] = "abcdefghijklmnopqrstuvwxyz";
	hls::stream<ap_uint<BLK_SIZE*8> > ciphertextStrm("ciphertextStrm");
	#pragma HLS stream variable=ciphertextStrm depth=1024+10
	hls::stream<bool> endCiphertextStrm("endCiphertextStrm");
	#pragma HLS stream variable=endCiphertextStrm depth=NUM_BLOCKS+10
	hls::stream<ap_uint<8 * KEY_SIZE>> cipherkeyStrm("cipherkeyStrm");
	#pragma HLS stream variable=cipherkeyStrm depth=2
	hls::stream<ap_uint<BLK_SIZE*8> > IVStrm("IVStrm");
	#pragma HLS stream variable=IVStrm depth=2
	hls::stream<ap_uint<BLK_SIZE*8>> plaintextStrm("plaintextStrm");
	#pragma HLS stream variable=plaintextStrm depth=NUM_BLOCKS+10
	hls::stream<bool> endPlaintextStrm("endPlaintextStrm");
	#pragma HLS stream variable=endPlaintextStrm depth=NUM_BLOCKS+10

	// generate cipherkey
	ap_uint<8 * KEY_SIZE> keyReg;
	for (unsigned int i = 0; i < KEY_SIZE; i++) {
		keyReg.range(i * 8 + 7, i * 8) = key[i];
	}

	cipherkeyStrm.write(keyReg);

	// generate initialization vector
	ap_uint<128> IVReg;
	for (unsigned int i = 0; i < 16; i++) {
		IVReg.range(i * 8 + 7, i * 8) = ivec[i];
	}
	IVStrm.write(IVReg);

	for(unsigned int i=0; i < NUM_BLOCKS; i++){
		plaintextStrm.write(buff[0]);
		endPlaintextStrm.write(false);
	}
	endPlaintextStrm.write(true);

	encrypt(plaintextStrm, endPlaintextStrm, cipherkeyStrm,
	        		IVStrm, ciphertextStrm, endCiphertextStrm);

    bool end = endCiphertextStrm.read();
    int index = 0;
	while (!end) {
			ct[0] = ciphertextStrm.read();
			index = index + 1;
			end = endCiphertextStrm.read();
	}

}

void dec(ap_uint<8*BLK_SIZE> buff[ARR_SIZE], ap_uint<8*BLK_SIZE> pt[ARR_SIZE]){

    const unsigned char key[] =
    	        "abcdefghijklmnopqrstuvwxyz"
    	        "abcdefghijklmnopqrstuvwxyz";

    const unsigned char ivec[] = "abcdefghijklmnopqrstuvwxyz";
	hls::stream<ap_uint<BLK_SIZE*8> > ciphertextStrm("ciphertextStrm");
	#pragma HLS stream variable=ciphertextStrm depth=NUM_BLOCKS+10
	hls::stream<bool> endCiphertextStrm("endCiphertextStrm");
	#pragma HLS stream variable=endCiphertextStrm depth=NUM_BLOCKS+10
	hls::stream<ap_uint<8 * KEY_SIZE>> cipherkeyStrm("cipherkeyStrm");
	#pragma HLS stream variable=cipherkeyStrm depth=2
	hls::stream<ap_uint<BLK_SIZE*8> > IVStrm("IVStrm");
	#pragma HLS stream variable=IVStrm depth=2
	hls::stream<ap_uint<BLK_SIZE*8>> plaintextStrm("plaintextStrm");
	#pragma HLS stream variable=plaintextStrm depth=NUM_BLOCKS+10
	hls::stream<bool> endPlaintextStrm("endPlaintextStrm");
	#pragma HLS stream variable=endPlaintextStrm depth=NUM_BLOCKS+10

	// generate cipherkey
	ap_uint<8 * KEY_SIZE> keyReg;
	for (unsigned int i = 0; i < KEY_SIZE; i++) {
		keyReg.range(i * 8 + 7, i * 8) = key[i];
	}

	cipherkeyStrm.write(keyReg);

	// generate initialization vector
	ap_uint<128> IVReg;
	for (unsigned int i = 0; i < 16; i++) {
		IVReg.range(i * 8 + 7, i * 8) = ivec[i];
	}
	IVStrm.write(IVReg);

	for(unsigned int i=0; i < NUM_BLOCKS; i++){
		ciphertextStrm.write(buff[0]);
		endCiphertextStrm.write(false);
	}
	endCiphertextStrm.write(true);

	decrypt(ciphertextStrm, endCiphertextStrm, cipherkeyStrm,
	        		IVStrm, plaintextStrm, endPlaintextStrm);

    bool end = endPlaintextStrm.read();
    int index = 0;
	while (!end) {
			pt[0] = plaintextStrm.read();
			index = index + 1;
			end = endPlaintextStrm.read();
	}
}

void decrypt(hls::stream<ap_uint<BLK_SIZE*8> >& ciphertext,
          hls::stream<bool>& ciphertext_e,
          hls::stream<ap_uint<KEY_SIZE*8> >& cipherkey,
          hls::stream<ap_uint<BLK_SIZE*8> >& IV_strm,
          hls::stream<ap_uint<BLK_SIZE*8> >& plaintext,
          hls::stream<bool>& plaintext_e) {
    xf::security::aes128CtrDecrypt(ciphertext, ciphertext_e, cipherkey, IV_strm, plaintext, plaintext_e);
}

void encrypt(hls::stream<ap_uint<BLK_SIZE*8> >& plaintext,
          hls::stream<bool>& plaintext_e,
          hls::stream<ap_uint<KEY_SIZE*8> >& cipherkey,
          hls::stream<ap_uint<BLK_SIZE*8> >& IV_strm,
          hls::stream<ap_uint<BLK_SIZE*8> >& ciphertext,
          hls::stream<bool>& ciphertext_e) {
    xf::security::aes128CtrEncrypt(plaintext, plaintext_e, cipherkey, IV_strm, ciphertext, ciphertext_e);
}

// The top-level function to synthesize
//
int svd_top1(const MATRIX_IN_T  A[A_ROWS][A_COLS],
             MATRIX_OUT_T S[A_ROWS][A_ROWS],
             MATRIX_OUT_T U[A_ROWS][A_ROWS],
             MATRIX_OUT_T V[A_ROWS][A_COLS], volatile int *crypto){
#pragma HLS INTERFACE ap_ctrl_chain port=return
#pragma HLS INTERFACE s_axilite port=return
	#pragma HLS INTERFACE m_axi port=S depth=A_ROWS*A_COLS offset=slave
	#pragma HLS INTERFACE m_axi port=U depth=A_ROWS*A_COLS offset=slave
	#pragma HLS INTERFACE m_axi port=V depth=A_ROWS*A_COLS offset=slave
	#pragma HLS INTERFACE m_axi port=A depth=A_ROWS*A_COLS offset=slave
  #pragma HLS INTERFACE m_axi port=crypto depth=A_ROWS*A_COLS offset=slave
  #pragma HLS INTERFACE mode=s_axilite port=crypto
	#pragma HLS INTERFACE s_axilite port=A
	#pragma HLS INTERFACE s_axilite port=S
	#pragma HLS INTERFACE s_axilite port=U
	#pragma HLS INTERFACE s_axilite port=V

  MATRIX_IN_T  a_i[A_ROWS][A_COLS];
  MATRIX_OUT_T s_i[A_ROWS][A_COLS];
  MATRIX_OUT_T u_i[A_ROWS][A_ROWS];
  MATRIX_OUT_T v_i[A_COLS][A_COLS];

  ap_uint<8*BLK_SIZE> crypto_buff[ARR_SIZE];
  ap_uint<8*BLK_SIZE> ct[ARR_SIZE];
  ap_uint<8*BLK_SIZE> pt[ARR_SIZE];

  // Copy input data to local memory
  a_row_loop : for (int r=0;r<A_ROWS;r++) {

    a_col_loop : for (int c=0;c<A_COLS;c++) {
      a_i[r][c] = A[r][c];
    }
  }
    //decrypt

  crypto_buff_loop: for(int i = 0; i < ARR_SIZE; i++){
	crypto_buff[i] = (ap_uint<8*BLK_SIZE>) crypto[i];
  }
	//   memcpy(crypto_buff,(const int*)crypto,ARR_SIZE*sizeof(int));
	dec(crypto_buff, pt);
  //encrypt
	enc(crypto_buff, ct);
  crypto_buff_write_loop: for(int i = 0; i < ARR_SIZE; i++){
	crypto[i] = (int) ct[i];
  }

  // Call SVD
  hls::svd<A_ROWS, A_COLS, MATRIX_IN_T, MATRIX_OUT_T>(a_i, s_i, u_i, v_i);


  // Copy local memory contents to outputs
  s_row_loop : for (int r=0;r<A_ROWS;r++) {

    s_col_loop : for (int c=0;c<A_COLS;c++) {
      S[r][c] = s_i[r][c];
    }
  }
  u_row_loop : for (int r=0;r<A_ROWS;r++) {

    u_col_loop : for (int c=0;c<A_ROWS;c++) {
      U[r][c] = u_i[r][c];
    }
  }
  v_row_loop : for (int r=0;r<A_COLS;r++) {

	v_col_loop : for (int c=0;c<A_COLS;c++) {
      V[r][c] = v_i[r][c];
    }
  }

  return 0;
}


