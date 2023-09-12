// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Version: 2022.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module example_example_Pipeline_VITIS_LOOP_158_1_VITIS_LOOP_159_2_VITIS_LOOP_161_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        res_address0,
        res_ce0,
        res_we0,
        res_d0,
        A_address0,
        A_ce0,
        A_q0,
        B_address0,
        B_ce0,
        B_q0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [13:0] res_address0;
output   res_ce0;
output   res_we0;
output  [31:0] res_d0;
output  [13:0] A_address0;
output   A_ce0;
input  [31:0] A_q0;
output  [13:0] B_address0;
output   B_ce0;
input  [31:0] B_q0;

reg ap_idle;
reg res_ce0;
reg res_we0;
reg A_ce0;
reg B_ce0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_state6_pp0_stage0_iter5;
wire    ap_block_state7_pp0_stage0_iter6;
wire    ap_block_state8_pp0_stage0_iter7;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln158_fu_151_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln159_fu_166_p2;
reg   [0:0] icmp_ln159_reg_415;
reg   [0:0] icmp_ln159_reg_415_pp0_iter2_reg;
wire   [0:0] and_ln158_fu_184_p2;
reg   [0:0] and_ln158_reg_421;
reg   [0:0] and_ln158_reg_421_pp0_iter2_reg;
wire   [0:0] or_ln159_fu_190_p2;
reg   [0:0] or_ln159_reg_426;
reg   [0:0] or_ln159_reg_426_pp0_iter2_reg;
reg   [0:0] or_ln159_reg_426_pp0_iter3_reg;
reg   [0:0] or_ln159_reg_426_pp0_iter4_reg;
reg   [0:0] or_ln159_reg_426_pp0_iter5_reg;
reg   [0:0] or_ln159_reg_426_pp0_iter6_reg;
wire   [13:0] zext_ln162_1_fu_204_p1;
reg   [13:0] zext_ln162_1_reg_431;
reg   [13:0] zext_ln162_1_reg_431_pp0_iter2_reg;
wire   [0:0] ifzero_fu_214_p2;
reg   [0:0] ifzero_reg_437;
reg   [0:0] ifzero_reg_437_pp0_iter2_reg;
reg   [0:0] ifzero_reg_437_pp0_iter3_reg;
reg   [0:0] ifzero_reg_437_pp0_iter4_reg;
reg   [0:0] ifzero_reg_437_pp0_iter5_reg;
reg   [0:0] ifzero_reg_437_pp0_iter6_reg;
wire   [13:0] zext_ln167_fu_298_p1;
wire   [13:0] add_ln167_fu_302_p2;
reg   [13:0] add_ln167_reg_446;
reg   [13:0] add_ln167_reg_446_pp0_iter4_reg;
reg   [13:0] add_ln167_reg_446_pp0_iter5_reg;
reg   [13:0] add_ln167_reg_446_pp0_iter6_reg;
wire   [13:0] add_ln162_fu_308_p2;
reg   [13:0] add_ln162_reg_451;
reg  signed [31:0] a_tmp_reg_466;
reg  signed [31:0] b_tmp_reg_471;
wire   [31:0] mul_ln165_fu_331_p2;
reg   [31:0] mul_ln165_reg_476;
wire   [63:0] zext_ln162_2_fu_323_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln163_fu_327_p1;
wire   [63:0] zext_ln167_1_fu_345_p1;
reg   [31:0] sum_fu_52;
wire   [31:0] sum_1_fu_349_p2;
wire    ap_loop_init;
reg   [6:0] i_fu_56;
wire   [6:0] add_ln161_fu_208_p2;
reg   [6:0] b_col_fu_60;
wire   [6:0] select_ln159_2_fu_291_p3;
reg   [13:0] indvar_flatten_fu_64;
wire   [13:0] select_ln159_3_fu_226_p3;
reg   [6:0] a_row_fu_68;
wire   [6:0] select_ln158_1_fu_268_p3;
reg   [19:0] indvar_flatten14_fu_72;
wire   [19:0] add_ln158_1_fu_157_p2;
wire   [0:0] icmp_ln161_fu_178_p2;
wire   [0:0] xor_ln158_fu_172_p2;
wire   [6:0] select_ln159_fu_196_p3;
wire   [13:0] add_ln159_1_fu_220_p2;
wire   [6:0] add_ln158_fu_255_p2;
wire   [6:0] mul_ln162_fu_279_p0;
wire   [7:0] mul_ln162_fu_279_p1;
wire   [6:0] select_ln158_fu_261_p3;
wire   [6:0] add_ln159_fu_285_p2;
wire   [13:0] mul_ln162_fu_279_p2;
wire   [13:0] grp_fu_360_p3;
wire   [31:0] select_ln159_1_fu_338_p3;
wire   [6:0] grp_fu_360_p0;
wire   [6:0] grp_fu_360_p1;
wire   [6:0] grp_fu_360_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg    ap_loop_exit_ready_pp0_iter5_reg;
reg    ap_loop_exit_ready_pp0_iter6_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire   [13:0] grp_fu_360_p00;
wire   [13:0] mul_ln162_fu_279_p00;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_done_reg = 1'b0;
end

example_mul_7ns_8ns_14_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 7 ),
    .din1_WIDTH( 8 ),
    .dout_WIDTH( 14 ))
mul_7ns_8ns_14_1_1_U65(
    .din0(mul_ln162_fu_279_p0),
    .din1(mul_ln162_fu_279_p1),
    .dout(mul_ln162_fu_279_p2)
);

example_mul_32s_32s_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
mul_32s_32s_32_1_1_U66(
    .din0(b_tmp_reg_471),
    .din1(a_tmp_reg_466),
    .dout(mul_ln165_fu_331_p2)
);

example_mac_muladd_7ns_7ns_7ns_14_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 7 ),
    .din1_WIDTH( 7 ),
    .din2_WIDTH( 7 ),
    .dout_WIDTH( 14 ))
mac_muladd_7ns_7ns_7ns_14_4_1_U67(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(grp_fu_360_p0),
    .din1(grp_fu_360_p1),
    .din2(grp_fu_360_p2),
    .ce(1'b1),
    .dout(grp_fu_360_p3)
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter6_reg == 1'b1))) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            a_row_fu_68 <= 7'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            a_row_fu_68 <= select_ln158_1_fu_268_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            b_col_fu_60 <= 7'd0;
        end else if ((ap_enable_reg_pp0_iter3 == 1'b1)) begin
            b_col_fu_60 <= select_ln159_2_fu_291_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            i_fu_56 <= 7'd0;
        end else if (((icmp_ln158_fu_151_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            i_fu_56 <= add_ln161_fu_208_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            indvar_flatten14_fu_72 <= 20'd0;
        end else if (((icmp_ln158_fu_151_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            indvar_flatten14_fu_72 <= add_ln158_1_fu_157_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            indvar_flatten_fu_64 <= 14'd0;
        end else if (((icmp_ln158_fu_151_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            indvar_flatten_fu_64 <= select_ln159_3_fu_226_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            sum_fu_52 <= 32'd0;
        end else if ((ap_enable_reg_pp0_iter7 == 1'b1)) begin
            sum_fu_52 <= sum_1_fu_349_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        a_tmp_reg_466 <= A_q0;
        add_ln162_reg_451 <= add_ln162_fu_308_p2;
        add_ln167_reg_446 <= add_ln167_fu_302_p2;
        add_ln167_reg_446_pp0_iter4_reg <= add_ln167_reg_446;
        add_ln167_reg_446_pp0_iter5_reg <= add_ln167_reg_446_pp0_iter4_reg;
        add_ln167_reg_446_pp0_iter6_reg <= add_ln167_reg_446_pp0_iter5_reg;
        and_ln158_reg_421_pp0_iter2_reg <= and_ln158_reg_421;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
        ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
        b_tmp_reg_471 <= B_q0;
        icmp_ln159_reg_415_pp0_iter2_reg <= icmp_ln159_reg_415;
        ifzero_reg_437_pp0_iter2_reg <= ifzero_reg_437;
        ifzero_reg_437_pp0_iter3_reg <= ifzero_reg_437_pp0_iter2_reg;
        ifzero_reg_437_pp0_iter4_reg <= ifzero_reg_437_pp0_iter3_reg;
        ifzero_reg_437_pp0_iter5_reg <= ifzero_reg_437_pp0_iter4_reg;
        ifzero_reg_437_pp0_iter6_reg <= ifzero_reg_437_pp0_iter5_reg;
        mul_ln165_reg_476 <= mul_ln165_fu_331_p2;
        or_ln159_reg_426_pp0_iter2_reg <= or_ln159_reg_426;
        or_ln159_reg_426_pp0_iter3_reg <= or_ln159_reg_426_pp0_iter2_reg;
        or_ln159_reg_426_pp0_iter4_reg <= or_ln159_reg_426_pp0_iter3_reg;
        or_ln159_reg_426_pp0_iter5_reg <= or_ln159_reg_426_pp0_iter4_reg;
        or_ln159_reg_426_pp0_iter6_reg <= or_ln159_reg_426_pp0_iter5_reg;
        zext_ln162_1_reg_431_pp0_iter2_reg[6 : 0] <= zext_ln162_1_reg_431[6 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln158_fu_151_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        and_ln158_reg_421 <= and_ln158_fu_184_p2;
        icmp_ln159_reg_415 <= icmp_ln159_fu_166_p2;
        ifzero_reg_437 <= ifzero_fu_214_p2;
        or_ln159_reg_426 <= or_ln159_fu_190_p2;
        zext_ln162_1_reg_431[6 : 0] <= zext_ln162_1_fu_204_p1[6 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        A_ce0 = 1'b1;
    end else begin
        A_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        B_ce0 = 1'b1;
    end else begin
        B_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln158_fu_151_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter6_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
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
    if (((ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
        res_ce0 = 1'b1;
    end else begin
        res_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter7 == 1'b1) & (ifzero_reg_437_pp0_iter6_reg == 1'd1))) begin
        res_we0 = 1'b1;
    end else begin
        res_we0 = 1'b0;
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

assign A_address0 = zext_ln162_2_fu_323_p1;

assign B_address0 = zext_ln163_fu_327_p1;

assign add_ln158_1_fu_157_p2 = (indvar_flatten14_fu_72 + 20'd1);

assign add_ln158_fu_255_p2 = (a_row_fu_68 + 7'd1);

assign add_ln159_1_fu_220_p2 = (indvar_flatten_fu_64 + 14'd1);

assign add_ln159_fu_285_p2 = (select_ln158_fu_261_p3 + 7'd1);

assign add_ln161_fu_208_p2 = (select_ln159_fu_196_p3 + 7'd1);

assign add_ln162_fu_308_p2 = (mul_ln162_fu_279_p2 + zext_ln162_1_reg_431_pp0_iter2_reg);

assign add_ln167_fu_302_p2 = (mul_ln162_fu_279_p2 + zext_ln167_fu_298_p1);

assign and_ln158_fu_184_p2 = (xor_ln158_fu_172_p2 & icmp_ln161_fu_178_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign grp_fu_360_p0 = grp_fu_360_p00;

assign grp_fu_360_p00 = select_ln159_fu_196_p3;

assign grp_fu_360_p1 = 14'd100;

assign grp_fu_360_p2 = zext_ln167_fu_298_p1;

assign icmp_ln158_fu_151_p2 = ((indvar_flatten14_fu_72 == 20'd1000000) ? 1'b1 : 1'b0);

assign icmp_ln159_fu_166_p2 = ((indvar_flatten_fu_64 == 14'd10000) ? 1'b1 : 1'b0);

assign icmp_ln161_fu_178_p2 = ((i_fu_56 == 7'd100) ? 1'b1 : 1'b0);

assign ifzero_fu_214_p2 = ((add_ln161_fu_208_p2 == 7'd100) ? 1'b1 : 1'b0);

assign mul_ln162_fu_279_p0 = mul_ln162_fu_279_p00;

assign mul_ln162_fu_279_p00 = select_ln158_1_fu_268_p3;

assign mul_ln162_fu_279_p1 = 14'd100;

assign or_ln159_fu_190_p2 = (icmp_ln159_fu_166_p2 | and_ln158_fu_184_p2);

assign res_address0 = zext_ln167_1_fu_345_p1;

assign res_d0 = (mul_ln165_reg_476 + select_ln159_1_fu_338_p3);

assign select_ln158_1_fu_268_p3 = ((icmp_ln159_reg_415_pp0_iter2_reg[0:0] == 1'b1) ? add_ln158_fu_255_p2 : a_row_fu_68);

assign select_ln158_fu_261_p3 = ((icmp_ln159_reg_415_pp0_iter2_reg[0:0] == 1'b1) ? 7'd0 : b_col_fu_60);

assign select_ln159_1_fu_338_p3 = ((or_ln159_reg_426_pp0_iter6_reg[0:0] == 1'b1) ? 32'd0 : sum_fu_52);

assign select_ln159_2_fu_291_p3 = ((and_ln158_reg_421_pp0_iter2_reg[0:0] == 1'b1) ? add_ln159_fu_285_p2 : select_ln158_fu_261_p3);

assign select_ln159_3_fu_226_p3 = ((icmp_ln159_fu_166_p2[0:0] == 1'b1) ? 14'd1 : add_ln159_1_fu_220_p2);

assign select_ln159_fu_196_p3 = ((or_ln159_fu_190_p2[0:0] == 1'b1) ? 7'd0 : i_fu_56);

assign sum_1_fu_349_p2 = (mul_ln165_reg_476 + select_ln159_1_fu_338_p3);

assign xor_ln158_fu_172_p2 = (icmp_ln159_fu_166_p2 ^ 1'd1);

assign zext_ln162_1_fu_204_p1 = select_ln159_fu_196_p3;

assign zext_ln162_2_fu_323_p1 = add_ln162_reg_451;

assign zext_ln163_fu_327_p1 = grp_fu_360_p3;

assign zext_ln167_1_fu_345_p1 = add_ln167_reg_446_pp0_iter6_reg;

assign zext_ln167_fu_298_p1 = select_ln159_2_fu_291_p3;

always @ (posedge ap_clk) begin
    zext_ln162_1_reg_431[13:7] <= 7'b0000000;
    zext_ln162_1_reg_431_pp0_iter2_reg[13:7] <= 7'b0000000;
end

endmodule //example_example_Pipeline_VITIS_LOOP_158_1_VITIS_LOOP_159_2_VITIS_LOOP_161_3