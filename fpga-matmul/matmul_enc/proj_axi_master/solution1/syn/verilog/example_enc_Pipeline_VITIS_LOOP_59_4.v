// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module example_enc_Pipeline_VITIS_LOOP_59_4 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        endCiphertextStrm_dout,
        endCiphertextStrm_empty_n,
        endCiphertextStrm_read,
        ciphertextStrm_dout,
        ciphertextStrm_empty_n,
        ciphertextStrm_read,
        end_r,
        ct_address0,
        ct_ce0,
        ct_we0,
        ct_d0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [0:0] endCiphertextStrm_dout;
input   endCiphertextStrm_empty_n;
output   endCiphertextStrm_read;
input  [127:0] ciphertextStrm_dout;
input   ciphertextStrm_empty_n;
output   ciphertextStrm_read;
input  [0:0] end_r;
output  [6:0] ct_address0;
output   ct_ce0;
output   ct_we0;
output  [127:0] ct_d0;

reg ap_idle;
reg endCiphertextStrm_read;
reg ciphertextStrm_read;
reg ct_ce0;
reg ct_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] ap_phi_mux_end_1_phi_fu_77_p4;
reg    ap_block_state2_pp0_stage0_iter1;
reg   [0:0] end_1_reg_74;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    ciphertextStrm_blk_n;
wire    ap_block_pp0_stage0;
reg    endCiphertextStrm_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [6:0] trunc_ln60_fu_98_p1;
reg   [6:0] trunc_ln60_reg_123;
reg   [0:0] end_2_reg_128;
wire    ap_loop_init;
wire   [63:0] zext_ln60_fu_107_p1;
reg   [63:0] index_fu_38;
wire   [63:0] add_ln61_fu_92_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

example_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        end_1_reg_74 <= end_r;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (end_1_reg_74 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        end_1_reg_74 <= end_2_reg_128;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            index_fu_38 <= 64'd0;
        end else if (((ap_phi_mux_end_1_phi_fu_77_p4 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            index_fu_38 <= add_ln61_fu_92_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_end_1_phi_fu_77_p4 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        end_2_reg_128 <= endCiphertextStrm_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_end_1_phi_fu_77_p4 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        trunc_ln60_reg_123 <= trunc_ln60_fu_98_p1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_phi_mux_end_1_phi_fu_77_p4 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (end_1_reg_74 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_end_1_phi_fu_77_p4 = end_2_reg_128;
    end else begin
        ap_phi_mux_end_1_phi_fu_77_p4 = end_1_reg_74;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (end_1_reg_74 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ciphertextStrm_blk_n = ciphertextStrm_empty_n;
    end else begin
        ciphertextStrm_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (end_1_reg_74 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ciphertextStrm_read = 1'b1;
    end else begin
        ciphertextStrm_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ct_ce0 = 1'b1;
    end else begin
        ct_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (end_1_reg_74 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ct_we0 = 1'b1;
    end else begin
        ct_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_phi_mux_end_1_phi_fu_77_p4 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        endCiphertextStrm_blk_n = endCiphertextStrm_empty_n;
    end else begin
        endCiphertextStrm_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_end_1_phi_fu_77_p4 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        endCiphertextStrm_read = 1'b1;
    end else begin
        endCiphertextStrm_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln61_fu_92_p2 = (index_fu_38 + 64'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((end_1_reg_74 == 1'd0) & (ciphertextStrm_empty_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_phi_mux_end_1_phi_fu_77_p4 == 1'd0) & (endCiphertextStrm_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((end_1_reg_74 == 1'd0) & (ciphertextStrm_empty_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_phi_mux_end_1_phi_fu_77_p4 == 1'd0) & (endCiphertextStrm_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((ap_phi_mux_end_1_phi_fu_77_p4 == 1'd0) & (endCiphertextStrm_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = ((end_1_reg_74 == 1'd0) & (ciphertextStrm_empty_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ct_address0 = zext_ln60_fu_107_p1;

assign ct_d0 = ciphertextStrm_dout;

assign trunc_ln60_fu_98_p1 = index_fu_38[6:0];

assign zext_ln60_fu_107_p1 = trunc_ln60_reg_123;

endmodule //example_enc_Pipeline_VITIS_LOOP_59_4
