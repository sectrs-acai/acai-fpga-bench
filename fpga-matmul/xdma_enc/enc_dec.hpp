#include "ap_int.h"
#include "hls_stream.h"
#include "xf_security/ctr.hpp"
#include <iostream>

// cipherkey size in byte
#define KEY_SIZE 16
// cipher block size in byte
#define BLK_SIZE 16

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
