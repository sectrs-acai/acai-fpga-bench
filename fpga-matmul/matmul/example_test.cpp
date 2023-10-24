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

 #include <stdio.h>

#define SIZE_R 100
#define SIZE_C 100
void example(volatile int *a, volatile int *b, volatile int *c);

int main()
{
  int i,j,k;
  int A[SIZE_R][SIZE_C];
  int RES[SIZE_R][SIZE_C];
  int B[SIZE_R][SIZE_C];

  printf("HLS AXI-Stream no side-channel data example\n");
  //Put data into A
  for(i=0; i < SIZE_R; i++){
    for(j = 0; j < SIZE_C; j++){
      A[i][j] = 2;
    }
  }

  for(i=0; i < SIZE_R; i++){
      for(j = 0; j < SIZE_C; j++){
        RES[i][j] = 0;
      }
  }

  //Call the hardware function
  example(*A, *A, *RES);

  //Run a software version of the hardware function to validate results
  for(i=0; i < SIZE_R; i++){
    for(j = 0; j < SIZE_C; j++){
    	B[i][j] = 0;
    	for(k = 0; k < SIZE_C; k++){
    	       B[i][j] += A[i][j] * A[k][j];
    	}
    }
  }

  //Compare results
   for(i=0; i < SIZE_R; i++){
    for(j = 0; j < SIZE_C; j++){
      if(B[i][j] != RES[i][j]){
        printf("i = %d j = %d RES = %d B= %d\n",i,j,RES[i][j],B[i][j]);
        printf("ERROR HW and SW results mismatch\n");
        return 1;
      }
    }
  }

  printf("Success HW and SW results match\n");
  return 0;
}
