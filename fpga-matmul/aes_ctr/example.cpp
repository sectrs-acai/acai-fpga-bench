/*
 * Copyright 2022 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * This file contains an example for creating an AXI4-master interface in Vivado HLS
 */
				      
#include <stdio.h>
#include <string.h>
#include "enc_dec.hpp"
#include "ap_int.h"
#include "ap_utils.h"

#define ARR_SIZE 128

void enc(ap_uint<8*BLK_SIZE> buff[ARR_SIZE], ap_uint<8*BLK_SIZE> ct[ARR_SIZE]){

    const unsigned char key[] =
    	        "abcdefghijklmnopqrstuvwxyz"
    	        "abcdefghijklmnopqrstuvwxyz";

    const unsigned char ivec[] = "abcdefghijklmnopqrstuvwxyz";
	hls::stream<ap_uint<BLK_SIZE*8> > ciphertextStrm("ciphertextStrm");
	#pragma HLS stream variable=ciphertextStrm depth=256
	hls::stream<bool> endCiphertextStrm("endCiphertextStrm");
	#pragma HLS stream variable=endCiphertextStrm depth=256
	hls::stream<ap_uint<8 * KEY_SIZE>> cipherkeyStrm("cipherkeyStrm");
	#pragma HLS stream variable=cipherkeyStrm depth=2
	hls::stream<ap_uint<BLK_SIZE*8> > IVStrm("IVStrm");
	#pragma HLS stream variable=IVStrm depth=2
	hls::stream<ap_uint<BLK_SIZE*8>> plaintextStrm("plaintextStrm");
	#pragma HLS stream variable=plaintextStrm depth=256
	hls::stream<bool> endPlaintextStrm("endPlaintextStrm");
	#pragma HLS stream variable=endPlaintextStrm depth=256

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

	for(unsigned int i=0; i < BLK_SIZE*8; i++){
		plaintextStrm.write(buff[i]);
		endPlaintextStrm.write(false);
	}
	endPlaintextStrm.write(true);

	encrypt(plaintextStrm, endPlaintextStrm, cipherkeyStrm,
	        		IVStrm, ciphertextStrm, endCiphertextStrm);

    bool end = endCiphertextStrm.read();
    int index = 0;
	while (!end) {
			ct[index] = ciphertextStrm.read();
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
	#pragma HLS stream variable=ciphertextStrm depth=256
	hls::stream<bool> endCiphertextStrm("endCiphertextStrm");
	#pragma HLS stream variable=endCiphertextStrm depth=256
	hls::stream<ap_uint<8 * KEY_SIZE>> cipherkeyStrm("cipherkeyStrm");
	#pragma HLS stream variable=cipherkeyStrm depth=2
	hls::stream<ap_uint<BLK_SIZE*8> > IVStrm("IVStrm");
	#pragma HLS stream variable=IVStrm depth=2
	hls::stream<ap_uint<BLK_SIZE*8>> plaintextStrm("plaintextStrm");
	#pragma HLS stream variable=plaintextStrm depth=256
	hls::stream<bool> endPlaintextStrm("endPlaintextStrm");
	#pragma HLS stream variable=endPlaintextStrm depth=256

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

	for(unsigned int i=0; i < BLK_SIZE*8; i++){
		ciphertextStrm.write(buff[i]);
		endCiphertextStrm.write(false);
	}
	endCiphertextStrm.write(true);

	decrypt(ciphertextStrm, endCiphertextStrm, cipherkeyStrm,
	        		IVStrm, plaintextStrm, endPlaintextStrm);

    bool end = endPlaintextStrm.read();
    int index = 0;
	while (!end) {
			pt[index] = plaintextStrm.read();
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

void example(volatile int *a, volatile int *crypto){

#pragma HLS INTERFACE m_axi port=a depth=ARR_SIZE offset=direct
#pragma HLS INTERFACE m_axi port=crypto depth=ARR_SIZE offset=direct
#pragma HLS INTERFACE mode=s_axilite port=return bundle=BUS_A
#pragma HLS INTERFACE mode=ap_ctrl_hs port=return bundle=BUS_A

  int i;
  int buff[ARR_SIZE];
  ap_uint<8*BLK_SIZE> crypto_buff[ARR_SIZE];
  ap_uint<8*BLK_SIZE> ct[ARR_SIZE];
  ap_uint<8*BLK_SIZE> pt[ARR_SIZE];

  //memcpy creates a burst access to memory
  //multiple calls of memcpy cannot be pipelined and will be scheduled sequentially
  //memcpy requires a local buffer to store the results of the memory transaction
  memcpy(buff,(const int*)a,ARR_SIZE*sizeof(int));

  //decrypt
  memcpy(crypto_buff,(const int*)crypto,ARR_SIZE*sizeof(int));
  dec(crypto_buff, pt);
  memcpy((int *)crypto,pt,ARR_SIZE*sizeof(int));

  for(i=0; i < ARR_SIZE; i++){
    buff[i] = buff[i] + 100;
  }

//  //encrypt
  enc(crypto_buff, ct);
  memcpy((int *)crypto,ct,ARR_SIZE*sizeof(int));

  memcpy((int *)a,buff,ARR_SIZE*sizeof(int));
}



  

