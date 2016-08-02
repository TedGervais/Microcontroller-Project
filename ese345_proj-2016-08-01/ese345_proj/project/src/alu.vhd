-------------------------------------------------------------------------------
--
-- Title       : alu
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\alu.vhd
-- Generated   : Mon Dec  1 04:14:56 2014
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {alu} architecture {alu}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity alu is 
	port(
		rs1, rs2 : in std_logic_vector(63 downto 0);
		opcode : in std_logic_vector(3 downto 0);
		data : in std_logic_vector(63 downto 0);
		rd : out std_logic_vector(63 downto 0)
	);
end alu;

--}} End of automatically maintained section

architecture alu of alu is
	signal and_r, or_r, xor_r, clz_r, cntb_r, shft_r : std_logic_vector(63 downto 0);
	signal inv_r, opnd_2, a_s_r, mult_r, a_d_r : std_logic_vector(63 downto 0);
	signal no_op, ari_log, lv, sixteen, sat : std_logic;
	signal sub_of : std_logic_vector(3 downto 0); 
	signal log_op : std_logic_vector(2 downto 0);
	signal ari_op : std_logic_vector(1 downto 0);
	signal sub, blank : std_logic;
	signal log_r, lv_r, ari_r, op_r, nop_r : std_logic_vector(63 downto 0);
begin
	
	underflow: process(rs1,rs2,opcode)
	begin		
		if rs1(63 downto 48) < rs2(63 downto 48) then
			sub_of(3) <= '1';	  
		else 
			sub_of(3) <= '0';
		end if;
		if rs1(47 downto 32) < rs2(47 downto 32) then
			sub_of(2) <= '1';
		else 
			sub_of(2) <= '0';
		end if;
		if rs1(31 downto 16) < rs2(31 downto 16) then
			sub_of(1) <= '1';
		else 
			sub_of(1) <= '0';
		end if;
		if rs1(15 downto 0) < rs2(15 downto 0) then
			sub_of(0) <= '1';
		else 
			sub_of(0) <= '0';
		end if;
	end process underflow;
	
	logic: entity alu_logic port map (opcode => opcode, no_op => no_op,
		ari_log => ari_log, lv => lv, sixteen => sixteen, sat => sat,
		log_op => log_op, ari_op => ari_op);
	l_and: entity and_64 port map (a => rs1, b => rs2, q => and_r);
	l_or: entity or_64 port map (a => rs1, b => rs2, q => or_r);
	l_xor: entity xor_64 port map (a => rs1, b => rs2, q => xor_r);
	l_clz: entity count_lead_zero port map (a => rs1, q => clz_r);
	l_cntb: entity count_ones port map (a => rs1, q => cntb_r);
	l_shft: entity shft_left port map (a => rs1, b => rs2, q => shft_r);
	
	sub <= not ari_op(1) and ari_op(0);
	
	inv: entity inv_64 port map (a => rs2, q => inv_r);
	
	with sub select	
		opnd_2 <= inv_r when '1',
				  rs2 when others;
				  
	add_sub: entity cla_64 port map (a => rs1, b => opnd_2, c_in => sub,
		sixteen => sixteen, sat => sat, sub_of => sub_of, sum => a_s_r,
		c_out => blank);
	mult: entity multiply port map (a => rs1, b=> rs2, q => mult_r);
	absdf: entity abs_diff port map (a => rs1, b => rs2, q => a_d_r);
	
	with log_op select
		log_r <= shft_r when "000",
				 cntb_r when "001",
				 clz_r when "010",
				 xor_r when "011",
				 or_r when "100",
				 and_r when "101",
				 "----------------------------------------------------------------" when others;
	
	with lv select
		lv_r <= data when '1',
				log_r when others;
	
	with ari_op select
		ari_r <= a_d_r when "11",
				 mult_r when "10",
				 a_s_r when others;
	
	with ari_log select
		op_r <= ari_r when '0',
				lv_r when others;
				
	with no_op select
		nop_r <= nop_r when '1',
				 op_r when others; 
		
	rd <= nop_r;
	
end alu;
