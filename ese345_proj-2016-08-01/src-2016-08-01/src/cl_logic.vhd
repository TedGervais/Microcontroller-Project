-------------------------------------------------------------------------------
--
-- Title       : cl_logic
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ese345_proj\project\src\cl_logic.vhd
-- Generated   : Wed Nov 26 18:50:37 2014
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
--{entity {cl_logic} architecture {cl_logic}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity cl_logic is
	 port(
		 c_in : in STD_LOGIC;
		 g : in STD_LOGIC_VECTOR(3 downto 0);
		 p : in STD_LOGIC_VECTOR(3 downto 0);
		 gg : out STD_LOGIC;
		 pg : out STD_LOGIC;
		 c_out : out STD_LOGIC_VECTOR(3 downto 1)
	     );
end cl_logic;

--}} End of automatically maintained section

architecture cl_logic of cl_logic is
	signal gg_int, pg_int : STD_LOGIC;
begin
	
	c_out(1) <= g(0) or (p(0) and c_in);
	c_out(2) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and c_in);
	c_out(3) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and c_in);
	gg_int <= g(3) or (g(2) and p(3)) or (g(1) and p(3) and p(2)) or (g(0) and p(3) and p(2) and p(1));
	pg_int <= p(3) and p(2) and p(1) and p(0);
	gg <= gg_int;
	pg <= pg_int;

end cl_logic;
