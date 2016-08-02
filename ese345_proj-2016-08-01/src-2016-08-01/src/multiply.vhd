-------------------------------------------------------------------------------
--
-- Title       : multiply
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\multiply.vhd
-- Generated   : Mon Dec  1 02:01:40 2014
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
--{entity {multiply} architecture {multiply}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity multiply is
	port(
		a : in std_logic_vector(63 downto 0);
		b : in std_logic_vector(63 downto 0);
		q : out std_logic_vector(63 downto 0)
	);
end multiply;

--}} End of automatically maintained section

architecture multiply of multiply is
	signal a_1, a_2, b_1, b_2 : std_logic_vector(15 downto 0);
	signal s_1, s_2 : std_logic_vector(31 downto 0);
	signal output : std_logic_vector(63 downto 0);
	signal sig1, sig2 : std_logic_vector(31 downto 0);
begin

	a_1 <= a(15 downto 0);
	a_2 <= a(47 downto 32);
	b_1 <= b(15 downto 0);
	b_2 <= b(47 downto 32);
	
	output(31 downto 0) <= std_logic_vector(unsigned(a_1) * unsigned(b_1));
	output(63 downto 32) <= std_logic_vector(unsigned(a_2) * unsigned(b_2));
	q <= output;

end multiply;