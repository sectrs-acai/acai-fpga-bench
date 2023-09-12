// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xsvd_top1.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSvd_top1_CfgInitialize(XSvd_top1 *InstancePtr, XSvd_top1_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSvd_top1_Start(XSvd_top1 *InstancePtr) {
    u64 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSvd_top1_WriteReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u64 XSvd_top1_IsDone(XSvd_top1 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u64 XSvd_top1_IsIdle(XSvd_top1 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u64 XSvd_top1_IsReady(XSvd_top1 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSvd_top1_Continue(XSvd_top1 *InstancePtr) {
    u64 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSvd_top1_WriteReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XSvd_top1_EnableAutoRestart(XSvd_top1 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSvd_top1_WriteReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XSvd_top1_DisableAutoRestart(XSvd_top1 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSvd_top1_WriteReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XSvd_top1_Get_return(XSvd_top1 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_AP_RETURN);
    return Data;
}
void XSvd_top1_Set_A(XSvd_top1 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSvd_top1_WriteReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_A_DATA, Data);
}

u64 XSvd_top1_Get_A(XSvd_top1 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_A_DATA);
    return Data;
}

void XSvd_top1_Set_S(XSvd_top1 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSvd_top1_WriteReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_S_DATA, Data);
}

u64 XSvd_top1_Get_S(XSvd_top1 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_S_DATA);
    return Data;
}

void XSvd_top1_Set_U(XSvd_top1 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSvd_top1_WriteReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_U_DATA, Data);
}

u64 XSvd_top1_Get_U(XSvd_top1 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_U_DATA);
    return Data;
}

void XSvd_top1_Set_V(XSvd_top1 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSvd_top1_WriteReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_V_DATA, Data);
}

u64 XSvd_top1_Get_V(XSvd_top1 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_V_DATA);
    return Data;
}

void XSvd_top1_InterruptGlobalEnable(XSvd_top1 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSvd_top1_WriteReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_GIE, 1);
}

void XSvd_top1_InterruptGlobalDisable(XSvd_top1 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSvd_top1_WriteReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_GIE, 0);
}

void XSvd_top1_InterruptEnable(XSvd_top1 *InstancePtr, u64 Mask) {
    u64 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_IER);
    XSvd_top1_WriteReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_IER, Register | Mask);
}

void XSvd_top1_InterruptDisable(XSvd_top1 *InstancePtr, u64 Mask) {
    u64 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_IER);
    XSvd_top1_WriteReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_IER, Register & (~Mask));
}

void XSvd_top1_InterruptClear(XSvd_top1 *InstancePtr, u64 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSvd_top1_WriteReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_ISR, Mask);
}

u64 XSvd_top1_InterruptGetEnabled(XSvd_top1 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_IER);
}

u64 XSvd_top1_InterruptGetStatus(XSvd_top1 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSvd_top1_ReadReg(InstancePtr->Control_BaseAddress, XSVD_TOP1_CONTROL_ADDR_ISR);
}

