// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 4  - ap_continue (Read/Write/SC)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x08 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x10 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x18 : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x20 : Data signal of ap_return
//        bit 31~0 - ap_return[31:0] (Read)
//        others   - reserved
// 0x30 : Data signal of A
//        bit 63~0 - A[63:0] (Read/Write)
// 0x38 : reserved
// 0x40 : Data signal of S
//        bit 63~0 - S[63:0] (Read/Write)
// 0x48 : reserved
// 0x50 : Data signal of U
//        bit 63~0 - U[63:0] (Read/Write)
// 0x58 : reserved
// 0x60 : Data signal of V
//        bit 63~0 - V[63:0] (Read/Write)
// 0x68 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XSVD_TOP1_CONTROL_ADDR_AP_CTRL   0x00
#define XSVD_TOP1_CONTROL_ADDR_GIE       0x08
#define XSVD_TOP1_CONTROL_ADDR_IER       0x10
#define XSVD_TOP1_CONTROL_ADDR_ISR       0x18
#define XSVD_TOP1_CONTROL_ADDR_AP_RETURN 0x20
#define XSVD_TOP1_CONTROL_BITS_AP_RETURN 32
#define XSVD_TOP1_CONTROL_ADDR_A_DATA    0x30
#define XSVD_TOP1_CONTROL_BITS_A_DATA    64
#define XSVD_TOP1_CONTROL_ADDR_S_DATA    0x40
#define XSVD_TOP1_CONTROL_BITS_S_DATA    64
#define XSVD_TOP1_CONTROL_ADDR_U_DATA    0x50
#define XSVD_TOP1_CONTROL_BITS_U_DATA    64
#define XSVD_TOP1_CONTROL_ADDR_V_DATA    0x60
#define XSVD_TOP1_CONTROL_BITS_V_DATA    64

