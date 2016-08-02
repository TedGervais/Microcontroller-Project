-------------------------------------------------------------------------------
--
-- Title       : inv_64
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ese345_proj\project\src\inv_64.vhd
-- Generated   : Mon Dec  1 17:39:03 2014
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
--{entity {inv_64} architecture {inv_64}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity inv_64 is
	port(
		a : in std_logic_vector(63 downto 0);
		q : out std_logic_vector(63 downto 0)
	);
end inv_64;

--}} End of automatically maintained section

architecture inv_64 of inv_64 is
begin

	 q <= not a;

end inv_64;
