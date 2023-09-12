// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xsvd_top1.h"

extern XSvd_top1_Config XSvd_top1_ConfigTable[];

XSvd_top1_Config *XSvd_top1_LookupConfig(u16 DeviceId) {
	XSvd_top1_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSVD_TOP1_NUM_INSTANCES; Index++) {
		if (XSvd_top1_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSvd_top1_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSvd_top1_Initialize(XSvd_top1 *InstancePtr, u16 DeviceId) {
	XSvd_top1_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSvd_top1_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSvd_top1_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

