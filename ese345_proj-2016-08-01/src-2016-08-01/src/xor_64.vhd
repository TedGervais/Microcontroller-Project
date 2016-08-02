-------------------------------------------------------------------------------
--
-- Title       : xor_64
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\xor_64.vhd
-- Generated   : Sat Nov 29 15:35:27 2014
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
--{entity {xor_64} architecture {xor_64}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity xor_64 is
	port(
		a : in std_logic_vector(63 downto 0);
		b : in std_logic_vector(63 downto 0);
		q : out std_logic_vector(63 downto 0)
	);
end xor_64;

--}} End of automatically maintained section

architecture xor_64 of xor_64 is
begin

	q <= a xor b;

end xor_64;
