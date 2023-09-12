-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity example_example_Pipeline_VITIS_LOOP_27_1_VITIS_LOOP_28_2_VITIS_LOOP_30_3 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    res_address0 : OUT STD_LOGIC_VECTOR (17 downto 0);
    res_ce0 : OUT STD_LOGIC;
    res_we0 : OUT STD_LOGIC;
    res_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    A_address0 : OUT STD_LOGIC_VECTOR (17 downto 0);
    A_ce0 : OUT STD_LOGIC;
    A_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    B_address0 : OUT STD_LOGIC_VECTOR (17 downto 0);
    B_ce0 : OUT STD_LOGIC;
    B_q0 : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of example_example_Pipeline_VITIS_LOOP_27_1_VITIS_LOOP_28_2_VITIS_LOOP_30_3 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv18_0 : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    constant ap_const_lv27_0 : STD_LOGIC_VECTOR (26 downto 0) := "000000000000000000000000000";
    constant ap_const_lv27_7735940 : STD_LOGIC_VECTOR (26 downto 0) := "111011100110101100101000000";
    constant ap_const_lv27_1 : STD_LOGIC_VECTOR (26 downto 0) := "000000000000000000000000001";
    constant ap_const_lv18_3D090 : STD_LOGIC_VECTOR (17 downto 0) := "111101000010010000";
    constant ap_const_lv9_1F4 : STD_LOGIC_VECTOR (8 downto 0) := "111110100";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv18_1 : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000001";
    constant ap_const_lv18_1F4 : STD_LOGIC_VECTOR (17 downto 0) := "000000000111110100";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter5 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter6 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter7 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter6 : BOOLEAN;
    signal ap_block_state8_pp0_stage0_iter7 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln27_fu_151_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln28_fu_166_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln28_reg_415 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln28_reg_415_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln27_fu_184_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln27_reg_421 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln27_reg_421_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln28_fu_190_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln28_reg_426 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln28_reg_426_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln28_reg_426_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln28_reg_426_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln28_reg_426_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln28_reg_426_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln31_1_fu_204_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal zext_ln31_1_reg_431 : STD_LOGIC_VECTOR (17 downto 0);
    signal zext_ln31_1_reg_431_pp0_iter2_reg : STD_LOGIC_VECTOR (17 downto 0);
    signal ifzero_fu_214_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ifzero_reg_437 : STD_LOGIC_VECTOR (0 downto 0);
    signal ifzero_reg_437_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ifzero_reg_437_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ifzero_reg_437_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ifzero_reg_437_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ifzero_reg_437_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln36_fu_298_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln36_fu_302_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln36_reg_446 : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln36_reg_446_pp0_iter4_reg : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln36_reg_446_pp0_iter5_reg : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln36_reg_446_pp0_iter6_reg : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln31_fu_308_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln31_reg_451 : STD_LOGIC_VECTOR (17 downto 0);
    signal a_tmp_reg_466 : STD_LOGIC_VECTOR (31 downto 0);
    signal b_tmp_reg_471 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln34_fu_331_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln34_reg_476 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln31_2_fu_323_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal zext_ln32_fu_327_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln36_1_fu_345_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal sum_fu_52 : STD_LOGIC_VECTOR (31 downto 0);
    signal sum_1_fu_349_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal i_fu_56 : STD_LOGIC_VECTOR (8 downto 0);
    signal add_ln30_fu_208_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal b_col_fu_60 : STD_LOGIC_VECTOR (8 downto 0);
    signal select_ln28_2_fu_291_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal indvar_flatten_fu_64 : STD_LOGIC_VECTOR (17 downto 0);
    signal select_ln28_3_fu_226_p3 : STD_LOGIC_VECTOR (17 downto 0);
    signal a_row_fu_68 : STD_LOGIC_VECTOR (8 downto 0);
    signal select_ln27_1_fu_268_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal indvar_flatten14_fu_72 : STD_LOGIC_VECTOR (26 downto 0);
    signal add_ln27_1_fu_157_p2 : STD_LOGIC_VECTOR (26 downto 0);
    signal icmp_ln30_fu_178_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln27_fu_172_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln28_fu_196_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal add_ln28_1_fu_220_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln27_fu_255_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal mul_ln31_fu_279_p0 : STD_LOGIC_VECTOR (8 downto 0);
    signal mul_ln31_fu_279_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln27_fu_261_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal add_ln28_fu_285_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal mul_ln31_fu_279_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal grp_fu_360_p3 : STD_LOGIC_VECTOR (17 downto 0);
    signal select_ln28_1_fu_338_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_360_p0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_fu_360_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_fu_360_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter4_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter5_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter6_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal grp_fu_360_p00 : STD_LOGIC_VECTOR (17 downto 0);
    signal mul_ln31_fu_279_p00 : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component example_mul_9ns_10ns_18_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (8 downto 0);
        din1 : IN STD_LOGIC_VECTOR (9 downto 0);
        dout : OUT STD_LOGIC_VECTOR (17 downto 0) );
    end component;


    component example_mul_32s_32s_32_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component example_mac_muladd_9ns_9ns_9ns_18_4_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (8 downto 0);
        din1 : IN STD_LOGIC_VECTOR (8 downto 0);
        din2 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (17 downto 0) );
    end component;


    component example_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    mul_9ns_10ns_18_1_1_U10 : component example_mul_9ns_10ns_18_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 9,
        din1_WIDTH => 10,
        dout_WIDTH => 18)
    port map (
        din0 => mul_ln31_fu_279_p0,
        din1 => mul_ln31_fu_279_p1,
        dout => mul_ln31_fu_279_p2);

    mul_32s_32s_32_1_1_U11 : component example_mul_32s_32s_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        din0 => b_tmp_reg_471,
        din1 => a_tmp_reg_466,
        dout => mul_ln34_fu_331_p2);

    mac_muladd_9ns_9ns_9ns_18_4_1_U12 : component example_mac_muladd_9ns_9ns_9ns_18_4_1
    generic map (
        ID => 1,
        NUM_STAGE => 4,
        din0_WIDTH => 9,
        din1_WIDTH => 9,
        din2_WIDTH => 9,
        dout_WIDTH => 18)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_360_p0,
        din1 => grp_fu_360_p1,
        din2 => grp_fu_360_p2,
        ce => ap_const_logic_1,
        dout => grp_fu_360_p3);

    flow_control_loop_pipe_sequential_init_U : component example_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter1_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter6_reg = ap_const_logic_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter4_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter5_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter5 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter6_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter6 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter7_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter7 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
                end if; 
            end if;
        end if;
    end process;


    a_row_fu_68_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    a_row_fu_68 <= ap_const_lv9_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    a_row_fu_68 <= select_ln27_1_fu_268_p3;
                end if;
            end if; 
        end if;
    end process;

    b_col_fu_60_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    b_col_fu_60 <= ap_const_lv9_0;
                elsif ((ap_enable_reg_pp0_iter3 = ap_const_logic_1)) then 
                    b_col_fu_60 <= select_ln28_2_fu_291_p3;
                end if;
            end if; 
        end if;
    end process;

    i_fu_56_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_56 <= ap_const_lv9_0;
                elsif (((icmp_ln27_fu_151_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    i_fu_56 <= add_ln30_fu_208_p2;
                end if;
            end if; 
        end if;
    end process;

    indvar_flatten14_fu_72_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    indvar_flatten14_fu_72 <= ap_const_lv27_0;
                elsif (((icmp_ln27_fu_151_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    indvar_flatten14_fu_72 <= add_ln27_1_fu_157_p2;
                end if;
            end if; 
        end if;
    end process;

    indvar_flatten_fu_64_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    indvar_flatten_fu_64 <= ap_const_lv18_0;
                elsif (((icmp_ln27_fu_151_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    indvar_flatten_fu_64 <= select_ln28_3_fu_226_p3;
                end if;
            end if; 
        end if;
    end process;

    sum_fu_52_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                    sum_fu_52 <= ap_const_lv32_0;
                elsif ((ap_enable_reg_pp0_iter7 = ap_const_logic_1)) then 
                    sum_fu_52 <= sum_1_fu_349_p2;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                a_tmp_reg_466 <= A_q0;
                add_ln31_reg_451 <= add_ln31_fu_308_p2;
                add_ln36_reg_446 <= add_ln36_fu_302_p2;
                add_ln36_reg_446_pp0_iter4_reg <= add_ln36_reg_446;
                add_ln36_reg_446_pp0_iter5_reg <= add_ln36_reg_446_pp0_iter4_reg;
                add_ln36_reg_446_pp0_iter6_reg <= add_ln36_reg_446_pp0_iter5_reg;
                and_ln27_reg_421_pp0_iter2_reg <= and_ln27_reg_421;
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
                ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
                ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
                b_tmp_reg_471 <= B_q0;
                icmp_ln28_reg_415_pp0_iter2_reg <= icmp_ln28_reg_415;
                ifzero_reg_437_pp0_iter2_reg <= ifzero_reg_437;
                ifzero_reg_437_pp0_iter3_reg <= ifzero_reg_437_pp0_iter2_reg;
                ifzero_reg_437_pp0_iter4_reg <= ifzero_reg_437_pp0_iter3_reg;
                ifzero_reg_437_pp0_iter5_reg <= ifzero_reg_437_pp0_iter4_reg;
                ifzero_reg_437_pp0_iter6_reg <= ifzero_reg_437_pp0_iter5_reg;
                mul_ln34_reg_476 <= mul_ln34_fu_331_p2;
                or_ln28_reg_426_pp0_iter2_reg <= or_ln28_reg_426;
                or_ln28_reg_426_pp0_iter3_reg <= or_ln28_reg_426_pp0_iter2_reg;
                or_ln28_reg_426_pp0_iter4_reg <= or_ln28_reg_426_pp0_iter3_reg;
                or_ln28_reg_426_pp0_iter5_reg <= or_ln28_reg_426_pp0_iter4_reg;
                or_ln28_reg_426_pp0_iter6_reg <= or_ln28_reg_426_pp0_iter5_reg;
                    zext_ln31_1_reg_431_pp0_iter2_reg(8 downto 0) <= zext_ln31_1_reg_431(8 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln27_fu_151_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                and_ln27_reg_421 <= and_ln27_fu_184_p2;
                icmp_ln28_reg_415 <= icmp_ln28_fu_166_p2;
                ifzero_reg_437 <= ifzero_fu_214_p2;
                or_ln28_reg_426 <= or_ln28_fu_190_p2;
                    zext_ln31_1_reg_431(8 downto 0) <= zext_ln31_1_fu_204_p1(8 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
            end if;
        end if;
    end process;
    zext_ln31_1_reg_431(17 downto 9) <= "000000000";
    zext_ln31_1_reg_431_pp0_iter2_reg(17 downto 9) <= "000000000";

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    A_address0 <= zext_ln31_2_fu_323_p1(18 - 1 downto 0);

    A_ce0_assign_proc : process(ap_enable_reg_pp0_iter4, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1))) then 
            A_ce0 <= ap_const_logic_1;
        else 
            A_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    B_address0 <= zext_ln32_fu_327_p1(18 - 1 downto 0);

    B_ce0_assign_proc : process(ap_enable_reg_pp0_iter4, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter4 = ap_const_logic_1))) then 
            B_ce0 <= ap_const_logic_1;
        else 
            B_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    add_ln27_1_fu_157_p2 <= std_logic_vector(unsigned(indvar_flatten14_fu_72) + unsigned(ap_const_lv27_1));
    add_ln27_fu_255_p2 <= std_logic_vector(unsigned(a_row_fu_68) + unsigned(ap_const_lv9_1));
    add_ln28_1_fu_220_p2 <= std_logic_vector(unsigned(indvar_flatten_fu_64) + unsigned(ap_const_lv18_1));
    add_ln28_fu_285_p2 <= std_logic_vector(unsigned(select_ln27_fu_261_p3) + unsigned(ap_const_lv9_1));
    add_ln30_fu_208_p2 <= std_logic_vector(unsigned(select_ln28_fu_196_p3) + unsigned(ap_const_lv9_1));
    add_ln31_fu_308_p2 <= std_logic_vector(unsigned(mul_ln31_fu_279_p2) + unsigned(zext_ln31_1_reg_431_pp0_iter2_reg));
    add_ln36_fu_302_p2 <= std_logic_vector(unsigned(mul_ln31_fu_279_p2) + unsigned(zext_ln36_fu_298_p1));
    and_ln27_fu_184_p2 <= (xor_ln27_fu_172_p2 and icmp_ln30_fu_178_p2);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter4 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter5 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage0_iter6 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state8_pp0_stage0_iter7 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln27_fu_151_p2)
    begin
        if (((icmp_ln27_fu_151_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter6_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter6_reg = ap_const_logic_1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5, ap_enable_reg_pp0_iter6, ap_enable_reg_pp0_iter7)
    begin
        if (((ap_enable_reg_pp0_iter7 = ap_const_logic_0) and (ap_enable_reg_pp0_iter6 = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_360_p0 <= grp_fu_360_p00(9 - 1 downto 0);
    grp_fu_360_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln28_fu_196_p3),18));
    grp_fu_360_p1 <= ap_const_lv18_1F4(9 - 1 downto 0);
    grp_fu_360_p2 <= zext_ln36_fu_298_p1(9 - 1 downto 0);
    icmp_ln27_fu_151_p2 <= "1" when (indvar_flatten14_fu_72 = ap_const_lv27_7735940) else "0";
    icmp_ln28_fu_166_p2 <= "1" when (indvar_flatten_fu_64 = ap_const_lv18_3D090) else "0";
    icmp_ln30_fu_178_p2 <= "1" when (i_fu_56 = ap_const_lv9_1F4) else "0";
    ifzero_fu_214_p2 <= "1" when (add_ln30_fu_208_p2 = ap_const_lv9_1F4) else "0";
    mul_ln31_fu_279_p0 <= mul_ln31_fu_279_p00(9 - 1 downto 0);
    mul_ln31_fu_279_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln27_1_fu_268_p3),18));
    mul_ln31_fu_279_p1 <= ap_const_lv18_1F4(10 - 1 downto 0);
    or_ln28_fu_190_p2 <= (icmp_ln28_fu_166_p2 or and_ln27_fu_184_p2);
    res_address0 <= zext_ln36_1_fu_345_p1(18 - 1 downto 0);

    res_ce0_assign_proc : process(ap_enable_reg_pp0_iter7, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1))) then 
            res_ce0 <= ap_const_logic_1;
        else 
            res_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    res_d0 <= std_logic_vector(unsigned(mul_ln34_reg_476) + unsigned(select_ln28_1_fu_338_p3));

    res_we0_assign_proc : process(ap_enable_reg_pp0_iter7, ap_block_pp0_stage0_11001, ifzero_reg_437_pp0_iter6_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1) and (ifzero_reg_437_pp0_iter6_reg = ap_const_lv1_1))) then 
            res_we0 <= ap_const_logic_1;
        else 
            res_we0 <= ap_const_logic_0;
        end if; 
    end process;

    select_ln27_1_fu_268_p3 <= 
        add_ln27_fu_255_p2 when (icmp_ln28_reg_415_pp0_iter2_reg(0) = '1') else 
        a_row_fu_68;
    select_ln27_fu_261_p3 <= 
        ap_const_lv9_0 when (icmp_ln28_reg_415_pp0_iter2_reg(0) = '1') else 
        b_col_fu_60;
    select_ln28_1_fu_338_p3 <= 
        ap_const_lv32_0 when (or_ln28_reg_426_pp0_iter6_reg(0) = '1') else 
        sum_fu_52;
    select_ln28_2_fu_291_p3 <= 
        add_ln28_fu_285_p2 when (and_ln27_reg_421_pp0_iter2_reg(0) = '1') else 
        select_ln27_fu_261_p3;
    select_ln28_3_fu_226_p3 <= 
        ap_const_lv18_1 when (icmp_ln28_fu_166_p2(0) = '1') else 
        add_ln28_1_fu_220_p2;
    select_ln28_fu_196_p3 <= 
        ap_const_lv9_0 when (or_ln28_fu_190_p2(0) = '1') else 
        i_fu_56;
    sum_1_fu_349_p2 <= std_logic_vector(unsigned(mul_ln34_reg_476) + unsigned(select_ln28_1_fu_338_p3));
    xor_ln27_fu_172_p2 <= (icmp_ln28_fu_166_p2 xor ap_const_lv1_1);
    zext_ln31_1_fu_204_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln28_fu_196_p3),18));
    zext_ln31_2_fu_323_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln31_reg_451),64));
    zext_ln32_fu_327_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(grp_fu_360_p3),64));
    zext_ln36_1_fu_345_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln36_reg_446_pp0_iter6_reg),64));
    zext_ln36_fu_298_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln28_2_fu_291_p3),18));
end behav;
