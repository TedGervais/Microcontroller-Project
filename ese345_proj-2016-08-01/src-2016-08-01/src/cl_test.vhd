-------------------------------------------------------------------------------
--
-- Title       : cl_test
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ese345_proj\project\src\cl_test.vhd
-- Generated   : Wed Nov 26 19:33:04 2014
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
--{entity {cl_test} architecture {cl_test}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity cl_test is
end cl_test;

--}} End of automatically maintained section

architecture cl_test of cl_test is

	signal g_tb, p_tb : std_logic_vector(3 downto 0);
	signal c_out_tb : std_logic_vector(3 downto 1);
	signal c_in_tb : std_logic;

begin

	uut: entity cl_logic port map (g => g_tb, p => p_tb, c_out => c_out_tb, c_in => c_in_tb);
	
	tb: process
	constant period: time := 1 ns;
	constant n: integer := 9;
	begin
		for i in 0 to 2**n - 1 loop
			(c_in_tb, g_tb(3), g_tb(2), g_tb(1), g_tb(0), p_tb(3), p_tb(2), p_tb(1), p_tb(0)) <= to_unsigned(i,n);
			wait for period;
		end loop;
		wait;
	end process;

end cl_test;
