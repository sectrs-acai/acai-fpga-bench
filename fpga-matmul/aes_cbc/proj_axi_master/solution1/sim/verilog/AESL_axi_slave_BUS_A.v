// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

module AESL_axi_slave_BUS_A (
    clk,
    reset,
    TRAN_s_axi_BUS_A_AWADDR,
    TRAN_s_axi_BUS_A_AWVALID,
    TRAN_s_axi_BUS_A_AWREADY,
    TRAN_s_axi_BUS_A_WVALID,
    TRAN_s_axi_BUS_A_WREADY,
    TRAN_s_axi_BUS_A_WDATA,
    TRAN_s_axi_BUS_A_WSTRB,
    TRAN_s_axi_BUS_A_ARADDR,
    TRAN_s_axi_BUS_A_ARVALID,
    TRAN_s_axi_BUS_A_ARREADY,
    TRAN_s_axi_BUS_A_RVALID,
    TRAN_s_axi_BUS_A_RREADY,
    TRAN_s_axi_BUS_A_RDATA,
    TRAN_s_axi_BUS_A_RRESP,
    TRAN_s_axi_BUS_A_BVALID,
    TRAN_s_axi_BUS_A_BREADY,
    TRAN_s_axi_BUS_A_BRESP,
    TRAN_BUS_A_start_in,
    TRAN_BUS_A_idle_out,
    TRAN_BUS_A_ready_out,
    TRAN_BUS_A_ready_in,
    TRAN_BUS_A_done_out,
    TRAN_BUS_A_write_start_in   ,
    TRAN_BUS_A_write_start_finish,
    TRAN_BUS_A_interrupt,
    TRAN_BUS_A_transaction_done_in
    );

//------------------------Parameter----------------------
parameter ADDR_WIDTH = 4;
parameter DATA_WIDTH = 32;
parameter BUS_A_DEPTH = 1;
reg [31 : 0] BUS_A_OPERATE_DEPTH = 0;
parameter BUS_A_c_bitwidth = 1;
parameter START_ADDR = 0;
parameter example_continue_addr = 0;
parameter example_auto_start_addr = 0;
parameter STATUS_ADDR = 0;

output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_BUS_A_AWADDR;
output  TRAN_s_axi_BUS_A_AWVALID;
input  TRAN_s_axi_BUS_A_AWREADY;
output  TRAN_s_axi_BUS_A_WVALID;
input  TRAN_s_axi_BUS_A_WREADY;
output [DATA_WIDTH - 1 : 0] TRAN_s_axi_BUS_A_WDATA;
output [DATA_WIDTH/8 - 1 : 0] TRAN_s_axi_BUS_A_WSTRB;
output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_BUS_A_ARADDR;
output  TRAN_s_axi_BUS_A_ARVALID;
input  TRAN_s_axi_BUS_A_ARREADY;
input  TRAN_s_axi_BUS_A_RVALID;
output  TRAN_s_axi_BUS_A_RREADY;
input [DATA_WIDTH - 1 : 0] TRAN_s_axi_BUS_A_RDATA;
input [2 - 1 : 0] TRAN_s_axi_BUS_A_RRESP;
input  TRAN_s_axi_BUS_A_BVALID;
output  TRAN_s_axi_BUS_A_BREADY;
input [2 - 1 : 0] TRAN_s_axi_BUS_A_BRESP;
input     clk;
input     reset;
input     TRAN_BUS_A_start_in;
output    TRAN_BUS_A_done_out;
output    TRAN_BUS_A_ready_out;
input     TRAN_BUS_A_ready_in;
output    TRAN_BUS_A_idle_out;
input  TRAN_BUS_A_write_start_in   ;
output TRAN_BUS_A_write_start_finish;
input     TRAN_BUS_A_interrupt;
input     TRAN_BUS_A_transaction_done_in;

reg [ADDR_WIDTH - 1 : 0] AWADDR_reg = 0;
reg  AWVALID_reg = 0;
reg  WVALID_reg = 0;
reg [DATA_WIDTH - 1 : 0] WDATA_reg = 0;
reg [DATA_WIDTH/8 - 1 : 0] WSTRB_reg = 0;
reg [ADDR_WIDTH - 1 : 0] ARADDR_reg = 0;
reg  ARVALID_reg = 0;
reg  RREADY_reg = 0;
reg [DATA_WIDTH - 1 : 0] RDATA_reg = 0;
reg  BREADY_reg = 0;
reg [DATA_WIDTH - 1 : 0] mem_BUS_A [BUS_A_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_BUS_A [ (BUS_A_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * BUS_A_DEPTH -1 : 0] = '{default : 'hz};
reg AESL_ready_out_index_reg = 0;
reg AESL_write_start_finish = 0;
reg AESL_ready_reg;
reg ready_initial;
reg AESL_done_index_reg = 0;
reg AESL_idle_index_reg = 0;
reg AESL_auto_restart_index_reg;
reg process_0_finish = 0;
reg process_1_finish = 0;
reg [31 : 0] write_start_count = 0;
reg write_start_run_flag = 0;

//===================process control=================
reg [31 : 0] ongoing_process_number = 0;
//process number depends on how much processes needed.
reg process_busy = 0;

//=================== signal connection ==============
assign TRAN_s_axi_BUS_A_AWADDR = AWADDR_reg;
assign TRAN_s_axi_BUS_A_AWVALID = AWVALID_reg;
assign TRAN_s_axi_BUS_A_WVALID = WVALID_reg;
assign TRAN_s_axi_BUS_A_WDATA = WDATA_reg;
assign TRAN_s_axi_BUS_A_WSTRB = WSTRB_reg;
assign TRAN_s_axi_BUS_A_ARADDR = ARADDR_reg;
assign TRAN_s_axi_BUS_A_ARVALID = ARVALID_reg;
assign TRAN_s_axi_BUS_A_RREADY = RREADY_reg;
assign TRAN_s_axi_BUS_A_BREADY = BREADY_reg;
assign TRAN_BUS_A_write_start_finish = AESL_write_start_finish;
assign TRAN_BUS_A_done_out = AESL_done_index_reg;
assign TRAN_BUS_A_ready_out = AESL_ready_out_index_reg;
assign TRAN_BUS_A_idle_out = AESL_idle_index_reg;
always @(TRAN_BUS_A_ready_in or ready_initial) 
begin
    AESL_ready_reg <= TRAN_BUS_A_ready_in | ready_initial;
end

always @(reset or process_0_finish or process_1_finish ) begin
    if (reset == 0) begin
        ongoing_process_number <= 0;
    end
    else if (ongoing_process_number == 0 && process_0_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 1 && process_1_finish == 1) begin
            ongoing_process_number <= 0;
    end
end

task count_c_data_four_byte_num_by_bitwidth;
input  integer bitwidth;
output integer num;
integer factor;
integer i;
begin
    factor = 32;
    for (i = 1; i <= 1024; i = i + 1) begin
        if (bitwidth <= factor && bitwidth > factor - 32) begin
            num = i;
        end
        factor = factor + 32;
    end
end    
endtask

task count_seperate_factor_by_bitwidth;
input  integer bitwidth;
output integer factor;
begin
    if (bitwidth <= 8) begin
        factor=4;
    end
    if (bitwidth <= 16 & bitwidth > 8 ) begin
        factor=2;
    end
    if (bitwidth <= 32 & bitwidth > 16 ) begin
        factor=1;
    end
    if (bitwidth > 32 ) begin
        factor=1;
    end
end    
endtask

task count_operate_depth_by_bitwidth_and_depth;
input  integer bitwidth;
input  integer depth;
output integer operate_depth;
integer factor;
integer remain;
begin
    count_seperate_factor_by_bitwidth (bitwidth , factor);
    operate_depth = depth / factor;
    remain = depth % factor;
    if (remain > 0) begin
        operate_depth = operate_depth + 1;
    end
end    
endtask

task write; /*{{{*/
    input  reg [ADDR_WIDTH - 1:0] waddr;   // write address
    input  reg [DATA_WIDTH - 1:0] wdata;   // write data
    output reg wresp;
    reg aw_flag;
    reg w_flag;
    reg [DATA_WIDTH/8 - 1:0] wstrb_reg;
    integer i;
begin 
    wresp = 0;
    aw_flag = 0;
    w_flag = 0;
//=======================one single write operate======================
    AWADDR_reg <= waddr;
    AWVALID_reg <= 1;
    WDATA_reg <= wdata;
    WVALID_reg <= 1;
    for (i = 0; i < DATA_WIDTH/8; i = i + 1) begin
        wstrb_reg [i] = 1;
    end    
    WSTRB_reg <= wstrb_reg;
    while (!(aw_flag && w_flag)) begin
        @(posedge clk);
        if (aw_flag != 1)
            aw_flag = TRAN_s_axi_BUS_A_AWREADY & AWVALID_reg;
        if (w_flag != 1)
            w_flag = TRAN_s_axi_BUS_A_WREADY & WVALID_reg;
        AWVALID_reg <= !aw_flag;
        WVALID_reg <= !w_flag;
    end

    BREADY_reg <= 1;
    while (TRAN_s_axi_BUS_A_BVALID != 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    BREADY_reg <= 0;
    if (TRAN_s_axi_BUS_A_BRESP === 2'b00) begin
        wresp = 1;
        //input success. in fact BRESP is always 2'b00
    end   
//=======================one single write operate======================

end
endtask/*}}}*/

task read (/*{{{*/
    input  [ADDR_WIDTH - 1:0] raddr ,   // write address
    output [DATA_WIDTH - 1:0] RDATA_result ,
    output rresp
);
begin 
    rresp = 0;
//=======================one single read operate======================
    ARADDR_reg <= raddr;
    ARVALID_reg <= 1;
    while (TRAN_s_axi_BUS_A_ARREADY !== 1) begin
        @(posedge clk);
    end
    @(posedge clk);
    ARVALID_reg <= 0;
    RREADY_reg <= 1;
    while (TRAN_s_axi_BUS_A_RVALID !== 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    RDATA_result  <= TRAN_s_axi_BUS_A_RDATA;
    RREADY_reg <= 0;
    if (TRAN_s_axi_BUS_A_RRESP === 2'b00 ) begin
        rresp <= 1;
        //output success. in fact RRESP is always 2'b00
    end  
    @(posedge clk);

//=======================one single read operate end======================

end
endtask/*}}}*/

initial begin : ready_initial_process
    ready_initial = 0;
    wait(reset === 1);
    @(posedge clk);
    ready_initial = 1;
    @(posedge clk);
    ready_initial = 0;
end

initial begin : update_status
    integer process_num ;
    integer read_status_resp;
    wait(reset === 1);
    @(posedge clk);
    process_num = 0;
    while (1) begin
        process_0_finish = 0;
        AESL_done_index_reg         <= 0;
        AESL_ready_out_index_reg        <= 0;
        if (ongoing_process_number === process_num && process_busy === 0) begin
            process_busy = 1;
            read (STATUS_ADDR, RDATA_reg, read_status_resp);
                AESL_done_index_reg         <= RDATA_reg[1 : 1];
                AESL_ready_out_index_reg    <= RDATA_reg[1 : 1];
                AESL_idle_index_reg         <= RDATA_reg[2 : 2];
            process_0_finish = 1;
            process_busy = 0;
        end 
        @(posedge clk);
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_start_run_flag <= 0; 
        write_start_count <= 0;
    end
    else begin
        if (write_start_count >= 1) begin
            write_start_run_flag <= 0; 
        end
        else if (TRAN_BUS_A_write_start_in === 1) begin
            write_start_run_flag <= 1; 
        end
        if (AESL_write_start_finish === 1) begin
            write_start_count <= write_start_count + 1;
            write_start_run_flag <= 0; 
        end
    end
end

initial begin : write_start
    reg [DATA_WIDTH - 1 : 0] write_start_tmp;
    integer process_num;
    integer write_start_resp;
    wait(reset === 1);
    @(posedge clk);
    process_num = 1;
    while (1) begin
        process_1_finish = 0;
        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            if (write_start_run_flag === 1) begin
                process_busy = 1;
                write_start_tmp=0;
                write_start_tmp[0 : 0] = 1;
                write (START_ADDR, write_start_tmp, write_start_resp);
                process_busy = 0;
                AESL_write_start_finish <= 1;
                @(posedge clk);
                AESL_write_start_finish <= 0;
            end
            process_1_finish <= 1;
        end 
        @(posedge clk);
    end
end

//------------------------Task and function-------------- 
task read_token; 
    input integer fp; 
    output reg [127 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end 
endtask 
 
task write_binary_BUS_A;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
endmodule
