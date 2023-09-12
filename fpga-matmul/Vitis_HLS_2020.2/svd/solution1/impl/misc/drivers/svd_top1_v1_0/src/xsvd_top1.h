// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XSVD_TOP1_H
#define XSVD_TOP1_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xsvd_top1_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XSvd_top1_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u64 IsReady;
} XSvd_top1;

typedef u64 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSvd_top1_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out64((BaseAddress) + (RegOffset), (u64)(Data))
#define XSvd_top1_ReadReg(BaseAddress, RegOffset) \
    Xil_In64((BaseAddress) + (RegOffset))
#else
#define XSvd_top1_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u64*)((BaseAddress) + (RegOffset)) = (u64)(Data)
#define XSvd_top1_ReadReg(BaseAddress, RegOffset) \
    *(volatile u64*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XSvd_top1_Initialize(XSvd_top1 *InstancePtr, u16 DeviceId);
XSvd_top1_Config* XSvd_top1_LookupConfig(u16 DeviceId);
int XSvd_top1_CfgInitialize(XSvd_top1 *InstancePtr, XSvd_top1_Config *ConfigPtr);
#else
int XSvd_top1_Initialize(XSvd_top1 *InstancePtr, const char* InstanceName);
int XSvd_top1_Release(XSvd_top1 *InstancePtr);
#endif

void XSvd_top1_Start(XSvd_top1 *InstancePtr);
u64 XSvd_top1_IsDone(XSvd_top1 *InstancePtr);
u64 XSvd_top1_IsIdle(XSvd_top1 *InstancePtr);
u64 XSvd_top1_IsReady(XSvd_top1 *InstancePtr);
void XSvd_top1_Continue(XSvd_top1 *InstancePtr);
void XSvd_top1_EnableAutoRestart(XSvd_top1 *InstancePtr);
void XSvd_top1_DisableAutoRestart(XSvd_top1 *InstancePtr);
u32 XSvd_top1_Get_return(XSvd_top1 *InstancePtr);

void XSvd_top1_Set_A(XSvd_top1 *InstancePtr, u64 Data);
u64 XSvd_top1_Get_A(XSvd_top1 *InstancePtr);
void XSvd_top1_Set_S(XSvd_top1 *InstancePtr, u64 Data);
u64 XSvd_top1_Get_S(XSvd_top1 *InstancePtr);
void XSvd_top1_Set_U(XSvd_top1 *InstancePtr, u64 Data);
u64 XSvd_top1_Get_U(XSvd_top1 *InstancePtr);
void XSvd_top1_Set_V(XSvd_top1 *InstancePtr, u64 Data);
u64 XSvd_top1_Get_V(XSvd_top1 *InstancePtr);

void XSvd_top1_InterruptGlobalEnable(XSvd_top1 *InstancePtr);
void XSvd_top1_InterruptGlobalDisable(XSvd_top1 *InstancePtr);
void XSvd_top1_InterruptEnable(XSvd_top1 *InstancePtr, u64 Mask);
void XSvd_top1_InterruptDisable(XSvd_top1 *InstancePtr, u64 Mask);
void XSvd_top1_InterruptClear(XSvd_top1 *InstancePtr, u64 Mask);
u64 XSvd_top1_InterruptGetEnabled(XSvd_top1 *InstancePtr);
u64 XSvd_top1_InterruptGetStatus(XSvd_top1 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
