-------------------------------------------------------------------------------
--
-- Title       : alu_logic
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\alu_logic.vhd
-- Generated   : Sun Nov 30 19:33:05 2014
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
--{entity {alu_logic} architecture {alu_logic}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity alu_logic is
	 port(
	 	 opcode : in STD_LOGIC_VECTOR(3 downto 0); 
	 	 rs1, rs2 : in std_logic_vector(63 downto 0);
		 no_op : out std_logic;
		 ari_log : out std_logic;
		 lv : out std_logic;
		 sixteen : out std_logic;
		 sat : out std_logic;  
		 sub_of : out std_logic_vector(3 downto 0);
		 log_op : out std_logic_vector(2 downto 0);
		 ari_op : out std_logic_vector(1 downto 0)
	     );
end alu_logic;

--}} End of automatically maintained section

architecture alu_logic of alu_logic is
begin

	decode : process (opcode)
		variable decode_op : std_logic_vector(3 downto 0);
	begin
		decode_op := opcode;
		no_op <= '0';
		ari_log <= '-';
		lv <= '-';
		sixteen <= '-';
		sat <= '-';
		log_op <= "---";
		ari_op <= "--";
		if (decode_op = "1111") then
			no_op <= '1';
		elsif (decode_op(3) = '1') then
			ari_log <= '1';
			if (decode_op(2 downto 0) = "110") then
				lv <= '1';
			else
				log_op <= opcode(2 downto 0);
			end if;
		elsif (decode_op(3) = '0') then
			ari_log <= '0';
			if (decode_op(2 downto 1) = "01") then
				sat <= '1';	 
			else
				sat <= '0';
			end if;
			if (decode_op(2 downto 1) = "10") or (decode_op(2 downto 1) = "01") then
				sixteen <= '1';
			else
				sixteen <= '0';
			end if;
			if (decode_op = "0111") or (decode_op = "0101") or (decode_op = "0011") then
				ari_op <= "00";
			elsif (decode_op = "0110") or (decode_op = "0100") or (decode_op = "0010") then
				ari_op <= "01";
			elsif (decode_op = "0001") then
				ari_op <= "10";
			else 
				ari_op <= "11";
			end if;
		end if;
	end process decode;
	
	sub_of_gen: process (rs1, rs2) 
		variable diff_temp : std_logic_vector(16 downto 0);
		variable sub_of_temp : std_logic_vector(3 downto 0);
	begin
		diff_temp := std_logic_vector(unsigned('0' & rs1(63 downto 48)) - unsigned('0' & rs2(63 downto 48)));
		sub_of_temp(3) := diff_temp(16);
		diff_temp := std_logic_vector(unsigned('0' & rs1(47 downto 32)) - unsigned('0' & rs2(47 downto 32)));
		sub_of_temp(2) := diff_temp(16);
		diff_temp := std_logic_vector(unsigned('0' & rs1(31 downto 16)) - unsigned('0' & rs2(31 downto 16)));
		sub_of_temp(1) := diff_temp(16);
		diff_temp := std_logic_vector(unsigned('0' & rs1(15 downto 0)) - unsigned('0' & rs2(15 downto 0)));
		sub_of_temp(0) := diff_temp(16);
		sub_of <= sub_of_temp;
	end process sub_of_gen;

end alu_logic;
