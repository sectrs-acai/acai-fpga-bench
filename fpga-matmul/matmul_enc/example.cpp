#include <stdio.h>
#include <string.h>
#include "enc_dec.hpp"
#include "ap_int.h"
#include "ap_utils.h"

#define MAX_SIZE 250000
#define MAX_ROW_SIZE 100
#define MAX_COL_SIZE 100

#define ARR_SIZE 128
#define NUM_BLOCKS 2500
void enc(ap_uint<8*BLK_SIZE> buff[ARR_SIZE], ap_uint<8*BLK_SIZE> ct[ARR_SIZE]){

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


template <bool transA,
          bool transB,
          int AROWS,
          int ACOLS,
          int BROWS,
          int BCOLS,
          int CROWS,
          int CCOLS,
          class T_IN,
          class T_OUT>
void matmul(const T_IN A[AROWS][ACOLS], const T_IN B[BROWS][BCOLS], T_OUT C[CROWS][CCOLS]) {
    const int AROWS_INT = (transA ? ACOLS : AROWS);
    const int ACOLS_INT = (transA ? AROWS : ACOLS);
    const int BROWS_INT = (transB ? BCOLS : BROWS);
    const int BCOLS_INT = (transB ? BROWS : BCOLS);

    T_IN a_tmp, b_tmp;
    T_OUT sum;
    for (int a_row = 0; a_row < AROWS_INT; a_row++) {
        for (int b_col = 0; b_col < BCOLS_INT; b_col++) {
            sum = 0;
            for (int i = 0; i < ACOLS_INT; i++) {
                    a_tmp = A[a_row][i];
                    b_tmp = B[i][b_col];

                sum = sum + (a_tmp * b_tmp);
            }
            C[a_row][b_col] = sum;
        }
    }
}


void example(volatile int *a, volatile int *b, volatile int *c, volatile int *crypto){
  
#pragma HLS INTERFACE m_axi port=a depth=MAX_SIZE offset=slave
#pragma HLS INTERFACE m_axi port=b depth=MAX_SIZE offset=slave
#pragma HLS INTERFACE m_axi port=c depth=MAX_SIZE offset=slave
#pragma HLS INTERFACE m_axi port=crypto depth=ARR_SIZE offset=slave
#pragma HLS INTERFACE mode=s_axilite port=a bundle=BUS_A
#pragma HLS INTERFACE mode=s_axilite port=b bundle=BUS_A
#pragma HLS INTERFACE mode=s_axilite port=c bundle=BUS_A
#pragma HLS INTERFACE mode=s_axilite port=crypto bundle=BUS_A
#pragma HLS INTERFACE mode=s_axilite port=return bundle=BUS_A

  int A[MAX_ROW_SIZE][MAX_COL_SIZE];
  int B[MAX_ROW_SIZE][MAX_COL_SIZE];
  int res[MAX_ROW_SIZE][MAX_COL_SIZE];
  ap_uint<8*BLK_SIZE> crypto_buff[ARR_SIZE];
  ap_uint<8*BLK_SIZE> ct[ARR_SIZE];
  ap_uint<8*BLK_SIZE> pt[ARR_SIZE];
  //memcpy creates a burst access to memory
  //multiple calls of memcpy cannot be pipelined and will be scheduled sequentially
  //memcpy requires a local buffer to store the results of the memory transaction
  memcpy(A,(const int*)a,(MAX_ROW_SIZE * MAX_COL_SIZE)*sizeof(int));
  memcpy(B,(const int*)b,(MAX_ROW_SIZE * MAX_COL_SIZE)*sizeof(int));
  memcpy(res,(const int*)c,(MAX_ROW_SIZE * MAX_COL_SIZE)*sizeof(int));

  //decrypt
  memcpy(crypto_buff,(const int*)crypto,ARR_SIZE*sizeof(int));
  dec(crypto_buff, pt);
  memcpy((int *)crypto,pt,ARR_SIZE*sizeof(int));

  matmul<false, false, MAX_ROW_SIZE, MAX_COL_SIZE, MAX_ROW_SIZE, MAX_COL_SIZE, MAX_ROW_SIZE, MAX_COL_SIZE, int, int>(A, B, res);

  enc(crypto_buff, ct);
  memcpy((int *)crypto,ct,ARR_SIZE*sizeof(int));

  memcpy((int *)c,res,(MAX_ROW_SIZE * MAX_COL_SIZE)*sizeof(int));
}

  


