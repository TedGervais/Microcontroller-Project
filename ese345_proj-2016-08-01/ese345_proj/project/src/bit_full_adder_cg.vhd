-------------------------------------------------------------------------------
--
-- Title       : bit_full_adder_cg
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ese345_proj\project\src\bit_full_adder_cg.vhd
-- Generated   : Wed Nov 26 17:58:13 2014
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
--{entity {bit_full_adder_cg} architecture {bit_full_adder_cg}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity bit_full_adder_cg is
	 port(
		 a, b, c : in STD_LOGIC;
		 g, p, s : out STD_LOGIC
	     );
end bit_full_adder_cg;

--}} End of automatically maintained section

architecture bit_full_adder_cg of bit_full_adder_cg is
	 signal propagate_sig : std_logic;
begin

	u1: entity bit_half_adder port map (a => a, b => b, carry_out => g, sum => propagate_sig);
	p <= propagate_sig;
	s <= c xor propagate_sig;

end bit_full_adder_cg;
