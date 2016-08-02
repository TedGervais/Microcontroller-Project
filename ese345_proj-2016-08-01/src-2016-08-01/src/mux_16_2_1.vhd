-------------------------------------------------------------------------------
--
-- Title       : mux_8_2_1
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\mux_8_2_1.vhd
-- Generated   : Sun Nov 30 21:53:08 2014
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
--{entity {mux_8_2_1} architecture {mux_8_2_1}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_16_2_1 is
	port(
		a : in std_logic_vector(15 downto 0);
		b : in std_logic_vector(15 downto 0);
		s : in std_logic;
		q : out std_logic_vector(15 downto 0)
	);
end mux_16_2_1;

--}} End of automatically maintained section

architecture mux_16_2_1 of mux_16_2_1 is
begin

	with s select q <= b when '1' , a when others;

end mux_16_2_1;
