-------------------------------------------------------------------------------
--
-- Title       : shft_left
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\shft_left.vhd
-- Generated   : Sat Nov 29 18:31:01 2014
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
--{entity {shift_left} architecture {shift_left}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity shft_left is
	port(
		a : in std_logic_vector(63 downto 0);
		b : in std_logic_vector(63 downto 0);
		q : out std_logic_vector(63 downto 0)
	);
end shft_left;

--}} End of automatically maintained section

architecture shft_left of shft_left is
	signal shift : std_logic_vector(63 downto 0);
	signal shamt : std_logic_vector(3 downto 0);
begin
	
	shamt <= b(3 downto 0);
	shift <= To_StdLogicVector(To_bitvector(a) sll to_integer(unsigned(shamt)));
	q <= shift;

end shft_left;
