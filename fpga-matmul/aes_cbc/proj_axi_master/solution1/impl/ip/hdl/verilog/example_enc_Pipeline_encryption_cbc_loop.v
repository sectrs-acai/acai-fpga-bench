// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module example_enc_Pipeline_encryption_cbc_loop (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        plaintextStrm_dout,
        plaintextStrm_empty_n,
        plaintextStrm_read,
        endPlaintextStrm_dout,
        endPlaintextStrm_empty_n,
        endPlaintextStrm_read,
        ciphertextStrm_din,
        ciphertextStrm_full_n,
        ciphertextStrm_write,
        endCiphertextStrm_din,
        endCiphertextStrm_full_n,
        endCiphertextStrm_write,
        e,
        IV_V,
        cipher_key_list_V_load,
        cipher_key_list_V_1_load,
        cipher_key_list_V_2_load,
        cipher_key_list_V_3_load,
        cipher_key_list_V_4_load,
        cipher_key_list_V_5_load,
        cipher_key_list_V_6_load,
        cipher_key_list_V_7_load,
        cipher_key_list_V_8_load,
        cipher_key_list_V_9_load,
        cipher_key_list_V_10_load
);

parameter    ap_ST_fsm_pp0_stage0 = 19'd1;
parameter    ap_ST_fsm_pp0_stage1 = 19'd2;
parameter    ap_ST_fsm_pp0_stage2 = 19'd4;
parameter    ap_ST_fsm_pp0_stage3 = 19'd8;
parameter    ap_ST_fsm_pp0_stage4 = 19'd16;
parameter    ap_ST_fsm_pp0_stage5 = 19'd32;
parameter    ap_ST_fsm_pp0_stage6 = 19'd64;
parameter    ap_ST_fsm_pp0_stage7 = 19'd128;
parameter    ap_ST_fsm_pp0_stage8 = 19'd256;
parameter    ap_ST_fsm_pp0_stage9 = 19'd512;
parameter    ap_ST_fsm_pp0_stage10 = 19'd1024;
parameter    ap_ST_fsm_pp0_stage11 = 19'd2048;
parameter    ap_ST_fsm_pp0_stage12 = 19'd4096;
parameter    ap_ST_fsm_pp0_stage13 = 19'd8192;
parameter    ap_ST_fsm_pp0_stage14 = 19'd16384;
parameter    ap_ST_fsm_pp0_stage15 = 19'd32768;
parameter    ap_ST_fsm_pp0_stage16 = 19'd65536;
parameter    ap_ST_fsm_pp0_stage17 = 19'd131072;
parameter    ap_ST_fsm_pp0_stage18 = 19'd262144;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [127:0] plaintextStrm_dout;
input   plaintextStrm_empty_n;
output   plaintextStrm_read;
input  [0:0] endPlaintextStrm_dout;
input   endPlaintextStrm_empty_n;
output   endPlaintextStrm_read;
output  [127:0] ciphertextStrm_din;
input   ciphertextStrm_full_n;
output   ciphertextStrm_write;
output  [0:0] endCiphertextStrm_din;
input   endCiphertextStrm_full_n;
output   endCiphertextStrm_write;
input  [0:0] e;
input  [127:0] IV_V;
input  [127:0] cipher_key_list_V_load;
input  [127:0] cipher_key_list_V_1_load;
input  [127:0] cipher_key_list_V_2_load;
input  [127:0] cipher_key_list_V_3_load;
input  [127:0] cipher_key_list_V_4_load;
input  [127:0] cipher_key_list_V_5_load;
input  [127:0] cipher_key_list_V_6_load;
input  [127:0] cipher_key_list_V_7_load;
input  [127:0] cipher_key_list_V_8_load;
input  [127:0] cipher_key_list_V_9_load;
input  [127:0] cipher_key_list_V_10_load;

reg ap_idle;
reg plaintextStrm_read;
reg endPlaintextStrm_read;
reg ciphertextStrm_write;
reg endCiphertextStrm_write;

(* fsm_encoding = "none" *) reg   [18:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_CS_fsm_pp0_stage1;
reg   [0:0] e_1_reg_185;
reg    ap_block_state2_pp0_stage1_iter0;
reg   [0:0] e_1_reg_185_pp0_iter1_reg;
reg    ap_block_state21_pp0_stage1_iter1;
reg    ap_block_pp0_stage1_subdone;
reg    ap_condition_exit_pp0_iter0_stage1;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_CS_fsm_pp0_stage18;
wire    ap_block_state19_pp0_stage18_iter0;
wire    ap_block_pp0_stage18_subdone;
reg    plaintextStrm_blk_n;
wire    ap_block_pp0_stage1;
reg    ciphertextStrm_blk_n;
reg    endCiphertextStrm_blk_n;
reg    endPlaintextStrm_blk_n;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state20_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] initialization_reg_196;
reg   [0:0] e_2_reg_323;
reg    ap_block_pp0_stage1_11001;
reg    ap_enable_reg_pp0_iter0_reg;
wire    grp_process_r_fu_208_ap_start;
wire    grp_process_r_fu_208_ap_done;
wire    grp_process_r_fu_208_ap_idle;
wire    grp_process_r_fu_208_ap_ready;
reg    grp_process_r_fu_208_ap_ce;
wire   [127:0] grp_process_r_fu_208_plaintext;
wire   [127:0] grp_process_r_fu_208_ap_return;
reg    ap_block_state2_pp0_stage1_iter0_ignore_call6;
reg    ap_block_state21_pp0_stage1_iter1_ignore_call6;
reg    ap_block_pp0_stage1_11001_ignoreCallOp51;
wire    ap_block_state3_pp0_stage2_iter0_ignore_call6;
wire    ap_block_pp0_stage2_11001_ignoreCallOp54;
wire    ap_CS_fsm_pp0_stage2;
wire    ap_block_state4_pp0_stage3_iter0_ignore_call6;
wire    ap_block_pp0_stage3_11001_ignoreCallOp55;
wire    ap_CS_fsm_pp0_stage3;
wire    ap_block_state5_pp0_stage4_iter0_ignore_call6;
wire    ap_block_pp0_stage4_11001_ignoreCallOp56;
wire    ap_CS_fsm_pp0_stage4;
wire    ap_block_state6_pp0_stage5_iter0_ignore_call6;
wire    ap_block_pp0_stage5_11001_ignoreCallOp57;
wire    ap_CS_fsm_pp0_stage5;
wire    ap_block_state7_pp0_stage6_iter0_ignore_call6;
wire    ap_block_pp0_stage6_11001_ignoreCallOp58;
wire    ap_CS_fsm_pp0_stage6;
wire    ap_block_state8_pp0_stage7_iter0_ignore_call6;
wire    ap_block_pp0_stage7_11001_ignoreCallOp59;
wire    ap_CS_fsm_pp0_stage7;
wire    ap_block_state9_pp0_stage8_iter0_ignore_call6;
wire    ap_block_pp0_stage8_11001_ignoreCallOp60;
wire    ap_CS_fsm_pp0_stage8;
wire    ap_block_state10_pp0_stage9_iter0_ignore_call6;
wire    ap_block_pp0_stage9_11001_ignoreCallOp61;
wire    ap_CS_fsm_pp0_stage9;
wire    ap_block_state11_pp0_stage10_iter0_ignore_call6;
wire    ap_block_pp0_stage10_11001_ignoreCallOp62;
wire    ap_CS_fsm_pp0_stage10;
wire    ap_block_state12_pp0_stage11_iter0_ignore_call6;
wire    ap_block_pp0_stage11_11001_ignoreCallOp63;
wire    ap_CS_fsm_pp0_stage11;
wire    ap_block_state13_pp0_stage12_iter0_ignore_call6;
wire    ap_block_pp0_stage12_11001_ignoreCallOp64;
wire    ap_CS_fsm_pp0_stage12;
wire    ap_block_state14_pp0_stage13_iter0_ignore_call6;
wire    ap_block_pp0_stage13_11001_ignoreCallOp65;
wire    ap_CS_fsm_pp0_stage13;
wire    ap_block_state15_pp0_stage14_iter0_ignore_call6;
wire    ap_block_pp0_stage14_11001_ignoreCallOp66;
wire    ap_CS_fsm_pp0_stage14;
wire    ap_block_state16_pp0_stage15_iter0_ignore_call6;
wire    ap_block_pp0_stage15_11001_ignoreCallOp67;
wire    ap_CS_fsm_pp0_stage15;
wire    ap_block_state17_pp0_stage16_iter0_ignore_call6;
wire    ap_block_pp0_stage16_11001_ignoreCallOp68;
wire    ap_CS_fsm_pp0_stage16;
wire    ap_block_state18_pp0_stage17_iter0_ignore_call6;
wire    ap_block_pp0_stage17_11001_ignoreCallOp69;
wire    ap_CS_fsm_pp0_stage17;
wire    ap_block_state19_pp0_stage18_iter0_ignore_call6;
wire    ap_block_pp0_stage18_11001_ignoreCallOp70;
wire    ap_block_state1_pp0_stage0_iter0_ignore_call6;
wire    ap_block_state20_pp0_stage0_iter1_ignore_call6;
wire    ap_block_pp0_stage0_11001_ignoreCallOp71;
reg   [0:0] ap_phi_mux_e_1_phi_fu_188_p4;
wire    ap_loop_init;
wire    ap_block_pp0_stage0_subdone;
wire    ap_block_pp0_stage0;
reg   [0:0] ap_phi_mux_initialization_phi_fu_200_p4;
reg    grp_process_r_fu_208_ap_start_reg;
wire    ap_block_pp0_stage2;
wire    ap_block_pp0_stage3;
wire    ap_block_pp0_stage4;
wire    ap_block_pp0_stage5;
wire    ap_block_pp0_stage6;
wire    ap_block_pp0_stage7;
wire    ap_block_pp0_stage8;
wire    ap_block_pp0_stage9;
wire    ap_block_pp0_stage10;
wire    ap_block_pp0_stage11;
wire    ap_block_pp0_stage12;
wire    ap_block_pp0_stage13;
wire    ap_block_pp0_stage14;
wire    ap_block_pp0_stage15;
wire    ap_block_pp0_stage16;
wire    ap_block_pp0_stage17;
wire    ap_block_pp0_stage18;
reg   [127:0] lhs_V_fu_76;
reg   [127:0] ap_sig_allocacmp_lhs_V_load;
reg    ap_block_pp0_stage1_01001;
wire   [127:0] select_ln112_fu_237_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [18:0] ap_NS_fsm;
reg    ap_idle_pp0_1to1;
wire    ap_block_state3_pp0_stage2_iter0;
wire    ap_block_pp0_stage2_subdone;
wire    ap_block_state4_pp0_stage3_iter0;
wire    ap_block_pp0_stage3_subdone;
wire    ap_block_state5_pp0_stage4_iter0;
wire    ap_block_pp0_stage4_subdone;
wire    ap_block_state6_pp0_stage5_iter0;
wire    ap_block_pp0_stage5_subdone;
wire    ap_block_state7_pp0_stage6_iter0;
wire    ap_block_pp0_stage6_subdone;
wire    ap_block_state8_pp0_stage7_iter0;
wire    ap_block_pp0_stage7_subdone;
wire    ap_block_state9_pp0_stage8_iter0;
wire    ap_block_pp0_stage8_subdone;
wire    ap_block_state10_pp0_stage9_iter0;
wire    ap_block_pp0_stage9_subdone;
wire    ap_block_state11_pp0_stage10_iter0;
wire    ap_block_pp0_stage10_subdone;
wire    ap_block_state12_pp0_stage11_iter0;
wire    ap_block_pp0_stage11_subdone;
wire    ap_block_state13_pp0_stage12_iter0;
wire    ap_block_pp0_stage12_subdone;
wire    ap_block_state14_pp0_stage13_iter0;
wire    ap_block_pp0_stage13_subdone;
wire    ap_block_state15_pp0_stage14_iter0;
wire    ap_block_pp0_stage14_subdone;
wire    ap_block_state16_pp0_stage15_iter0;
wire    ap_block_pp0_stage15_subdone;
wire    ap_block_state17_pp0_stage16_iter0;
wire    ap_block_pp0_stage16_subdone;
wire    ap_block_state18_pp0_stage17_iter0;
wire    ap_block_pp0_stage17_subdone;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_2838;
reg    ap_condition_2843;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 19'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0_reg = 1'b0;
#0 grp_process_r_fu_208_ap_start_reg = 1'b0;
#0 ap_done_reg = 1'b0;
end

example_process_r grp_process_r_fu_208(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_process_r_fu_208_ap_start),
    .ap_done(grp_process_r_fu_208_ap_done),
    .ap_idle(grp_process_r_fu_208_ap_idle),
    .ap_ready(grp_process_r_fu_208_ap_ready),
    .ap_ce(grp_process_r_fu_208_ap_ce),
    .p_read(cipher_key_list_V_load),
    .p_read1(cipher_key_list_V_1_load),
    .p_read2(cipher_key_list_V_2_load),
    .p_read3(cipher_key_list_V_3_load),
    .p_read4(cipher_key_list_V_4_load),
    .p_read5(cipher_key_list_V_5_load),
    .p_read6(cipher_key_list_V_6_load),
    .p_read7(cipher_key_list_V_7_load),
    .p_read8(cipher_key_list_V_8_load),
    .p_read9(cipher_key_list_V_9_load),
    .p_read10(cipher_key_list_V_10_load),
    .plaintext(grp_process_r_fu_208_plaintext),
    .ap_return(grp_process_r_fu_208_ap_return)
);

example_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_loop_exit_ready == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage1)) begin
            ap_enable_reg_pp0_iter0_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0_reg <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage1_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage18_subdone) & (1'b1 == ap_CS_fsm_pp0_stage18))) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_process_r_fu_208_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_e_1_phi_fu_188_p4 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            grp_process_r_fu_208_ap_start_reg <= 1'b1;
        end else if ((grp_process_r_fu_208_ap_ready == 1'b1)) begin
            grp_process_r_fu_208_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if ((1'b1 == ap_condition_2843)) begin
            e_1_reg_185 <= e_2_reg_323;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_init == 1'b1))) begin
            e_1_reg_185 <= e;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (e_1_reg_185_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        initialization_reg_196 <= 1'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        initialization_reg_196 <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lhs_V_fu_76 <= 128'd0;
    end else if (((1'b0 == ap_block_pp0_stage1_11001) & (e_1_reg_185_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        lhs_V_fu_76 <= grp_process_r_fu_208_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        e_1_reg_185_pp0_iter1_reg <= e_1_reg_185;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (e_1_reg_185 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        e_2_reg_323 <= endPlaintextStrm_dout;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (e_1_reg_185 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_subdone) & (1'b1 == ap_CS_fsm_pp0_stage1) & (ap_loop_exit_ready == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        ap_enable_reg_pp0_iter0 = ap_start_int;
    end else begin
        ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter1 == 1'b0)) begin
        ap_idle_pp0_1to1 = 1'b1;
    end else begin
        ap_idle_pp0_1to1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if ((1'b1 == ap_condition_2838)) begin
            ap_phi_mux_e_1_phi_fu_188_p4 = e_2_reg_323;
        end else if ((ap_loop_init == 1'b1)) begin
            ap_phi_mux_e_1_phi_fu_188_p4 = e;
        end else begin
            ap_phi_mux_e_1_phi_fu_188_p4 = e_2_reg_323;
        end
    end else begin
        ap_phi_mux_e_1_phi_fu_188_p4 = e_2_reg_323;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (e_1_reg_185_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_phi_mux_initialization_phi_fu_200_p4 = 1'd0;
    end else begin
        ap_phi_mux_initialization_phi_fu_200_p4 = initialization_reg_196;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage18_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage18))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (e_1_reg_185_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ap_sig_allocacmp_lhs_V_load = grp_process_r_fu_208_ap_return;
    end else begin
        ap_sig_allocacmp_lhs_V_load = lhs_V_fu_76;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (e_1_reg_185_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ciphertextStrm_blk_n = ciphertextStrm_full_n;
    end else begin
        ciphertextStrm_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (e_1_reg_185_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        ciphertextStrm_write = 1'b1;
    end else begin
        ciphertextStrm_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (e_1_reg_185_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        endCiphertextStrm_blk_n = endCiphertextStrm_full_n;
    end else begin
        endCiphertextStrm_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (e_1_reg_185_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        endCiphertextStrm_write = 1'b1;
    end else begin
        endCiphertextStrm_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (e_1_reg_185 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        endPlaintextStrm_blk_n = endPlaintextStrm_empty_n;
    end else begin
        endPlaintextStrm_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (e_1_reg_185 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        endPlaintextStrm_read = 1'b1;
    end else begin
        endPlaintextStrm_read = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001_ignoreCallOp71) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage18_11001_ignoreCallOp70) & (1'b1 == ap_CS_fsm_pp0_stage18)) | ((1'b0 == ap_block_pp0_stage17_11001_ignoreCallOp69) & (1'b1 == ap_CS_fsm_pp0_stage17)) | ((1'b0 == ap_block_pp0_stage16_11001_ignoreCallOp68) & (1'b1 == ap_CS_fsm_pp0_stage16)) | ((1'b0 == ap_block_pp0_stage15_11001_ignoreCallOp67) & (1'b1 == ap_CS_fsm_pp0_stage15)) | ((1'b0 == ap_block_pp0_stage14_11001_ignoreCallOp66) & (1'b1 == ap_CS_fsm_pp0_stage14)) | ((1'b0 == ap_block_pp0_stage13_11001_ignoreCallOp65) & (1'b1 == ap_CS_fsm_pp0_stage13)) | ((1'b0 == ap_block_pp0_stage12_11001_ignoreCallOp64) & (1'b1 == ap_CS_fsm_pp0_stage12)) | ((1'b0 == ap_block_pp0_stage11_11001_ignoreCallOp63) & (1'b1 == ap_CS_fsm_pp0_stage11)) | ((1'b0 == ap_block_pp0_stage10_11001_ignoreCallOp62) & (1'b1 == ap_CS_fsm_pp0_stage10)) | ((1'b0 == ap_block_pp0_stage9_11001_ignoreCallOp61) & (1'b1 == ap_CS_fsm_pp0_stage9)) | ((1'b0 == ap_block_pp0_stage8_11001_ignoreCallOp60) & (1'b1 == ap_CS_fsm_pp0_stage8)) | ((1'b0 == ap_block_pp0_stage7_11001_ignoreCallOp59) & (1'b1 == ap_CS_fsm_pp0_stage7)) | ((1'b0 == ap_block_pp0_stage6_11001_ignoreCallOp58) & (1'b1 == ap_CS_fsm_pp0_stage6)) | ((1'b0 == ap_block_pp0_stage5_11001_ignoreCallOp57) & (1'b1 == ap_CS_fsm_pp0_stage5)) | ((1'b0 == ap_block_pp0_stage4_11001_ignoreCallOp56) & (1'b1 == ap_CS_fsm_pp0_stage4)) | ((1'b0 == ap_block_pp0_stage3_11001_ignoreCallOp55) & (1'b1 == ap_CS_fsm_pp0_stage3)) | ((1'b0 == ap_block_pp0_stage2_11001_ignoreCallOp54) & (1'b1 == ap_CS_fsm_pp0_stage2)) | ((1'b0 == ap_block_pp0_stage1_11001_ignoreCallOp51) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
        grp_process_r_fu_208_ap_ce = 1'b1;
    end else begin
        grp_process_r_fu_208_ap_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1) & (e_1_reg_185 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        plaintextStrm_blk_n = plaintextStrm_empty_n;
    end else begin
        plaintextStrm_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage1_11001) & (e_1_reg_185 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
        plaintextStrm_read = 1'b1;
    end else begin
        plaintextStrm_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_start_int == 1'b0) & (ap_idle_pp0_1to1 == 1'b1)) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage1 : begin
            if ((1'b1 == ap_condition_exit_pp0_iter0_stage1)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((1'b0 == ap_block_pp0_stage1_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage1;
            end
        end
        ap_ST_fsm_pp0_stage2 : begin
            if ((1'b0 == ap_block_pp0_stage2_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage2;
            end
        end
        ap_ST_fsm_pp0_stage3 : begin
            if ((1'b0 == ap_block_pp0_stage3_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage3;
            end
        end
        ap_ST_fsm_pp0_stage4 : begin
            if ((1'b0 == ap_block_pp0_stage4_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage4;
            end
        end
        ap_ST_fsm_pp0_stage5 : begin
            if ((1'b0 == ap_block_pp0_stage5_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage5;
            end
        end
        ap_ST_fsm_pp0_stage6 : begin
            if ((1'b0 == ap_block_pp0_stage6_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage6;
            end
        end
        ap_ST_fsm_pp0_stage7 : begin
            if ((1'b0 == ap_block_pp0_stage7_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage7;
            end
        end
        ap_ST_fsm_pp0_stage8 : begin
            if ((1'b0 == ap_block_pp0_stage8_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage8;
            end
        end
        ap_ST_fsm_pp0_stage9 : begin
            if ((1'b0 == ap_block_pp0_stage9_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage9;
            end
        end
        ap_ST_fsm_pp0_stage10 : begin
            if ((1'b0 == ap_block_pp0_stage10_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage10;
            end
        end
        ap_ST_fsm_pp0_stage11 : begin
            if ((1'b0 == ap_block_pp0_stage11_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage12;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage11;
            end
        end
        ap_ST_fsm_pp0_stage12 : begin
            if ((1'b0 == ap_block_pp0_stage12_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage12;
            end
        end
        ap_ST_fsm_pp0_stage13 : begin
            if ((1'b0 == ap_block_pp0_stage13_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage14;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage13;
            end
        end
        ap_ST_fsm_pp0_stage14 : begin
            if ((1'b0 == ap_block_pp0_stage14_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage15;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage14;
            end
        end
        ap_ST_fsm_pp0_stage15 : begin
            if ((1'b0 == ap_block_pp0_stage15_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage16;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage15;
            end
        end
        ap_ST_fsm_pp0_stage16 : begin
            if ((1'b0 == ap_block_pp0_stage16_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage17;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage16;
            end
        end
        ap_ST_fsm_pp0_stage17 : begin
            if ((1'b0 == ap_block_pp0_stage17_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage18;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage17;
            end
        end
        ap_ST_fsm_pp0_stage18 : begin
            if ((1'b0 == ap_block_pp0_stage18_subdone)) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage18;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp0_stage10 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_pp0_stage11 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_pp0_stage12 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_pp0_stage13 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_pp0_stage14 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_pp0_stage15 = ap_CS_fsm[32'd15];

assign ap_CS_fsm_pp0_stage16 = ap_CS_fsm[32'd16];

assign ap_CS_fsm_pp0_stage17 = ap_CS_fsm[32'd17];

assign ap_CS_fsm_pp0_stage18 = ap_CS_fsm[32'd18];

assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp0_stage4 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_pp0_stage5 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_pp0_stage6 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_pp0_stage7 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_pp0_stage8 = ap_CS_fsm[32'd8];

assign ap_CS_fsm_pp0_stage9 = ap_CS_fsm[32'd9];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001_ignoreCallOp71 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage1 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage10 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage10_11001_ignoreCallOp62 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage10_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage11 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage11_11001_ignoreCallOp63 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage11_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage12 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage12_11001_ignoreCallOp64 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage12_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage13 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage13_11001_ignoreCallOp65 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage13_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage14 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage14_11001_ignoreCallOp66 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage14_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage15 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage15_11001_ignoreCallOp67 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage15_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage16 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage16_11001_ignoreCallOp68 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage16_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage17 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage17_11001_ignoreCallOp69 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage17_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage18 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage18_11001_ignoreCallOp70 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage18_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage1_01001 = (((ap_enable_reg_pp0_iter1 == 1'b1) & (((endCiphertextStrm_full_n == 1'b0) & (e_1_reg_185_pp0_iter1_reg == 1'd0)) | ((e_1_reg_185_pp0_iter1_reg == 1'd0) & (ciphertextStrm_full_n == 1'b0)))) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (((endPlaintextStrm_empty_n == 1'b0) & (e_1_reg_185 == 1'd0)) | ((e_1_reg_185 == 1'd0) & (plaintextStrm_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage1_11001 = (((ap_enable_reg_pp0_iter1 == 1'b1) & (((endCiphertextStrm_full_n == 1'b0) & (e_1_reg_185_pp0_iter1_reg == 1'd0)) | ((e_1_reg_185_pp0_iter1_reg == 1'd0) & (ciphertextStrm_full_n == 1'b0)))) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (((endPlaintextStrm_empty_n == 1'b0) & (e_1_reg_185 == 1'd0)) | ((e_1_reg_185 == 1'd0) & (plaintextStrm_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage1_11001_ignoreCallOp51 = (((ap_enable_reg_pp0_iter1 == 1'b1) & (((endCiphertextStrm_full_n == 1'b0) & (e_1_reg_185_pp0_iter1_reg == 1'd0)) | ((e_1_reg_185_pp0_iter1_reg == 1'd0) & (ciphertextStrm_full_n == 1'b0)))) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (((endPlaintextStrm_empty_n == 1'b0) & (e_1_reg_185 == 1'd0)) | ((e_1_reg_185 == 1'd0) & (plaintextStrm_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage1_subdone = (((ap_enable_reg_pp0_iter1 == 1'b1) & (((endCiphertextStrm_full_n == 1'b0) & (e_1_reg_185_pp0_iter1_reg == 1'd0)) | ((e_1_reg_185_pp0_iter1_reg == 1'd0) & (ciphertextStrm_full_n == 1'b0)))) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (((endPlaintextStrm_empty_n == 1'b0) & (e_1_reg_185 == 1'd0)) | ((e_1_reg_185 == 1'd0) & (plaintextStrm_empty_n == 1'b0)))));
end

assign ap_block_pp0_stage2 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_11001_ignoreCallOp54 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage2_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_11001_ignoreCallOp55 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage3_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_11001_ignoreCallOp56 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage4_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_11001_ignoreCallOp57 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage5_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6_11001_ignoreCallOp58 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage6_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage7 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage7_11001_ignoreCallOp59 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage7_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage8 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage8_11001_ignoreCallOp60 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage8_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage9 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage9_11001_ignoreCallOp61 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage9_subdone = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage9_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage9_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage10_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage10_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage11_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage11_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage12_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage12_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage13_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage13_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage14_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage14_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage15_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage15_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage16_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage16_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state18_pp0_stage17_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state18_pp0_stage17_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state19_pp0_stage18_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state19_pp0_stage18_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state20_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state20_pp0_stage0_iter1_ignore_call6 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state21_pp0_stage1_iter1 = (((endCiphertextStrm_full_n == 1'b0) & (e_1_reg_185_pp0_iter1_reg == 1'd0)) | ((e_1_reg_185_pp0_iter1_reg == 1'd0) & (ciphertextStrm_full_n == 1'b0)));
end

always @ (*) begin
    ap_block_state21_pp0_stage1_iter1_ignore_call6 = (((endCiphertextStrm_full_n == 1'b0) & (e_1_reg_185_pp0_iter1_reg == 1'd0)) | ((e_1_reg_185_pp0_iter1_reg == 1'd0) & (ciphertextStrm_full_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage1_iter0 = (((endPlaintextStrm_empty_n == 1'b0) & (e_1_reg_185 == 1'd0)) | ((e_1_reg_185 == 1'd0) & (plaintextStrm_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage1_iter0_ignore_call6 = (((endPlaintextStrm_empty_n == 1'b0) & (e_1_reg_185 == 1'd0)) | ((e_1_reg_185 == 1'd0) & (plaintextStrm_empty_n == 1'b0)));
end

assign ap_block_state3_pp0_stage2_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage2_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage3_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage3_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage4_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage4_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage5_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage5_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage6_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage6_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage7_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage7_iter0_ignore_call6 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage8_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage8_iter0_ignore_call6 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_2838 = ((1'b0 == ap_block_pp0_stage0) & (e_1_reg_185 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_2843 = ((1'b0 == ap_block_pp0_stage0_11001) & (e_1_reg_185 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;

assign ciphertextStrm_din = grp_process_r_fu_208_ap_return;

assign endCiphertextStrm_din = 1'd0;

assign grp_process_r_fu_208_ap_start = grp_process_r_fu_208_ap_start_reg;

assign grp_process_r_fu_208_plaintext = (select_ln112_fu_237_p3 ^ plaintextStrm_dout);

assign select_ln112_fu_237_p3 = ((ap_phi_mux_initialization_phi_fu_200_p4[0:0] == 1'b1) ? IV_V : ap_sig_allocacmp_lhs_V_load);

endmodule //example_enc_Pipeline_encryption_cbc_loop
