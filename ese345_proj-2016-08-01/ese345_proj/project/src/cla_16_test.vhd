-------------------------------------------------------------------------------
--
-- Title       : cla_16_test
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\cla_16_test.vhd
-- Generated   : Thu Nov 27 16:19:36 2014
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
--{entity {cla_16_test} architecture {cla_16_test}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity cla_16_test is
end cla_16_test;

--}} End of automatically maintained section

architecture cla_16_test of cla_16_test is
	signal a_tb, b_tb, s_tb : std_logic_vector(15 downto 0);
	signal c_in_tb : std_logic_vector(0 downto 0);
	signal gg_tb, pg_tb : std_logic;
begin

	uut: entity cla_16 port map (a => a_tb, b => b_tb,
		c_in => c_in_tb(0), sum => s_tb, gg => gg_tb, pg => pg_tb);
		
	tb: process
	constant period : time := 1 ns;
	constant n : integer := 16;
	begin		
		for i in 0 to 1 loop
			c_in_tb <= std_logic_vector(to_unsigned(i,1));
			for j in 0 to 2**n - 1 loop	 
				a_tb <= std_logic_vector(to_unsigned(j,n));
				for k in 0 to 2**n - 1 loop
					b_tb <= std_logic_vector(to_unsigned(k,n));
					wait for period;
				end loop;
			end loop;
		end loop;
		wait;
	end process;

end cla_16_test;
