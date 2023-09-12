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

#define MAX_SIZE 250000+1

void example(volatile int *a, int size){
  
#pragma HLS INTERFACE m_axi port=a depth=MAX_SIZE offset=slave
#pragma HLS INTERFACE mode=s_axilite port=a bundle=BUS_A
#pragma HLS INTERFACE mode=s_axilite port=return bundle=BUS_A
#pragma HLS INTERFACE mode=s_axilite port=size bundle=BUS_A


  int i;
  int buff[MAX_SIZE];
  //memcpy creates a burst access to memory
   //multiple calls of memcpy cannot be pipelined and will be scheduled sequentially
   //memcpy requires a local buffer to store the results of the memory transaction
   memcpy(buff,(const int*)a,size*sizeof(int));

   for(i=0; i < size; i++){
     buff[i] = buff[i] + 100;
   }

   memcpy((int *)a,buff,size*sizeof(int));
}

  


