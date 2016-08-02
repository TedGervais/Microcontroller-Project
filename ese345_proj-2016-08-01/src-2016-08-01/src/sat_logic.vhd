-------------------------------------------------------------------------------
--
-- Title       : sat_logic
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\sat_logic.vhd
-- Generated   : Sun Nov 30 21:25:08 2014
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
--{entity {sat_logic} architecture {sat_logic}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sat_logic is
	port(
		a : in std_logic_vector(15 downto 0);
		c_in, c_out, sat, sub_of : in std_logic;
		q : out std_logic_vector(15 downto 0)
	);
end sat_logic;

--}} End of automatically maintained section

architecture sat_logic of sat_logic is
	signal one, zero : std_logic_vector(15 downto 0);
	signal s1, s2, s3, s4 : std_logic_vector(15 downto 0);
begin
	
	one <= "1111111111111111";
	zero <= "0000000000000000";
	mux1: entity mux_16_2_1 port map (a => a, b => one, s => c_out, q => s1);
	mux2: entity mux_16_2_1 port map (a => a, b => zero, s => sub_of, q => s2);
	mux3: entity mux_16_2_1 port map (a => a, b => s1, s => sat, q => s3);
	mux4: entity mux_16_2_1 port map (a => a, b => s2, s => sat, q => s4);
	mux5: entity mux_16_2_1 port map (a => s3, b => s4, s => c_in, q => q);

end sat_logic;
