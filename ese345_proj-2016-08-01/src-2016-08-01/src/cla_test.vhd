-------------------------------------------------------------------------------
--
-- Title       : cla_test
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ese345_proj\project\src\cla_test.vhd
-- Generated   : Wed Nov 26 20:03:42 2014
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
--{entity {cla_test} architecture {cla_test}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use ieee.numeric_std.all;

entity cla_test is
end cla_test;

--}} End of automatically maintained section

architecture cla_test of cla_test is
	signal a_tb, b_tb, g_tb, p_tb, s_tb : std_logic_vector(3 downto 0);
	signal c_tb : std_logic_vector(3 downto 1);
	signal c_in_tb, gg_tb, pg_tb : std_logic;
begin

	uut1: entity bit_full_adder_cg port map (a => a_tb(0), b => b_tb(0),
		c => c_in_tb, g => g_tb(0), p => p_tb(0), s => s_tb(0));
	uut2: entity bit_full_adder_cg port map (a => a_tb(1), b => b_tb(1),
		c => c_tb(1), g => g_tb(1), p => p_tb(1), s => s_tb(1));
	uut3: entity bit_full_adder_cg port map (a => a_tb(2), b => b_tb(2),
		c => c_tb(2), g => g_tb(2), p => p_tb(2), s => s_tb(2));
	uut4: entity bit_full_adder_cg port map (a => a_tb(3), b => b_tb(3),
		c => c_tb(3), g => g_tb(3), p => p_tb(3), s => s_tb(3));
	uut5: entity cl_logic port map (c_in => c_in_tb, g => g_tb, p => p_tb, gg => gg_tb, pg => pg_tb, c_out => c_tb);

	tb: process
	constant period: time := 1 ns;
	constant n: integer := 9;
	begin
		for i in 0 to 2**n - 1 loop
			(c_in_tb, a_tb(3), a_tb(2), a_tb(1), a_tb(0), b_tb(3), b_tb(2), b_tb(1), b_tb(0)) <= to_unsigned(i,n);
			wait for period;
		end loop;
		wait;
	end process;
	
end cla_test;
