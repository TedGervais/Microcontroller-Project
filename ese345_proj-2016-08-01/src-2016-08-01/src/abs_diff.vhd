-------------------------------------------------------------------------------
--
-- Title       : abs_diff
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\abs_diff.vhd
-- Generated   : Mon Dec  1 02:12:51 2014
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
--{entity {abs_diff} architecture {abs_diff}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity abs_diff is
	port(
		a : in std_logic_vector(63 downto 0);
		b : in std_logic_vector(63 downto 0);
		q : out std_logic_vector(63 downto 0)
	);
end abs_diff;

--}} End of automatically maintained section

architecture abs_diff of abs_diff is
	signal diffs : std_logic_vector(63 downto 0);
begin

	diff: process (a,b)
		variable a_1, a_2, a_3, a_4, a_5, a_6, a_7, a_8 : integer;
		variable b_1, b_2, b_3, b_4, b_5, b_6, b_7, b_8 : integer;
		variable d_1, d_2, d_3, d_4, d_5, d_6, d_7, d_8 : integer;
	begin
		a_1 := to_integer(unsigned(a(7 downto 0)));
		a_2 := to_integer(unsigned(a(15 downto 8)));
		a_3 := to_integer(unsigned(a(23 downto 16)));
		a_4 := to_integer(unsigned(a(31 downto 24)));
		a_5 := to_integer(unsigned(a(39 downto 32)));
		a_6 := to_integer(unsigned(a(47 downto 40)));
		a_7 := to_integer(unsigned(a(55 downto 48)));
		a_8 := to_integer(unsigned(a(63 downto 56)));
		b_1 := to_integer(unsigned(b(7 downto 0)));
		b_2 := to_integer(unsigned(b(15 downto 8)));
		b_3 := to_integer(unsigned(b(23 downto 16)));
		b_4 := to_integer(unsigned(b(31 downto 24)));
		b_5 := to_integer(unsigned(b(39 downto 32)));
		b_6 := to_integer(unsigned(b(47 downto 40)));
		b_7 := to_integer(unsigned(b(55 downto 48)));
		b_8 := to_integer(unsigned(b(63 downto 56)));
		d_1 := abs(a_1-b_1);
		d_2 := abs(a_2-b_2);
		d_3 := abs(a_3-b_3);
		d_4 := abs(a_4-b_4);
		d_5 := abs(a_5-b_5);
		d_6 := abs(a_6-b_6);
		d_7 := abs(a_7-b_7);
		d_8 := abs(a_8-b_8);
		
		diffs <= std_logic_vector(to_unsigned(d_8,8))
			& std_logic_vector(to_unsigned(d_7,8))
			& std_logic_vector(to_unsigned(d_6,8))
			& std_logic_vector(to_unsigned(d_5,8))
			& std_logic_vector(to_unsigned(d_4,8))
			& std_logic_vector(to_unsigned(d_3,8))
			& std_logic_vector(to_unsigned(d_2,8))
			& std_logic_vector(to_unsigned(d_1,8));
		
	end process diff;
	q <= diffs;

end abs_diff;