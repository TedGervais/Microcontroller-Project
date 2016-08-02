-------------------------------------------------------------------------------
--
-- Title       : mux_2_1
-- Design      : lab10s14
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : D:\VHDL\lab10s14\src\mux_2_1.vhd
-- Generated   : Thu Apr 24 00:33:46 2014
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
--{entity {mux_2_1} architecture {mux_2_1}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_2_1 is
	 port(
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 s : in STD_LOGIC;
		 q : out STD_LOGIC
	     );
end mux_2_1;

--}} End of automatically maintained section

architecture mux_2_1 of mux_2_1 is
begin

	with s select q <= b when '1', a when others;

end mux_2_1;