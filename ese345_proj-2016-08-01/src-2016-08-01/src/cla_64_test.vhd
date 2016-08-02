-------------------------------------------------------------------------------
--
-- Title       : cla_64_test
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\cla_64_test.vhd
-- Generated   : Thu Nov 27 15:50:00 2014
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
--{entity {cla_64_test} architecture {cla_64_test}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.numeric_std.all;
use ieee.math_real.all;

entity cla_64_test is
end cla_64_test;

--}} End of automatically maintained section

architecture cla_64_test of cla_64_test is
	signal a_tb, b_tb, s_tb : std_logic_vector(63 downto 0);
	signal c_in_tb, c_out_tb : std_logic;
begin

	uut1: entity cla_64 port map (a => a_tb, b => b_tb, c_in => c_in_tb,
		sum => s_tb, c_out => c_out_tb);
	c_in_tb <= '0';
	tb: process
	constant period: time := 1 ns;
	constant n: integer := 64;	
	begin
		for i in 0 to 2**8 - 1 loop
			a_tb <= std_logic_vector(to_unsigned(i,n));
			for j in 0 to 2**8 - 1 loop
				b_tb <= std_logic_vector(to_unsigned(j,n));
				wait for period;
			end loop;
			wait for period;
		end loop;
		wait;
	end process;

end cla_64_test;
