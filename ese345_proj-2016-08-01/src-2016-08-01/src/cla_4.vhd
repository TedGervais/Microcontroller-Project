-------------------------------------------------------------------------------
--
-- Title       : cla_4
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\cla_4.vhd
-- Generated   : Thu Nov 27 14:46:51 2014
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
--{entity {cla_4} architecture {cla_4}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity cla_4 is	 
	port(
		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		c_in : std_logic;
		sum : out std_logic_vector(3 downto 0);
		gg : out std_logic;
		pg : out std_logic
	);
end cla_4;

--}} End of automatically maintained section

architecture cla_4 of cla_4 is
	signal a_sig, b_sig, g_sig, p_sig, s_sig : std_logic_vector(3 downto 0);
	signal c_sig : std_logic_vector(3 downto 1);
	signal c_in_sig, gg_sig, pg_sig : std_logic;
begin
	a_sig <= a;
	b_sig <= b;
	c_in_sig <= c_in;
	fa1: entity bit_full_adder_cg port map (a => a_sig(0), b => b_sig(0),
		c => c_in_sig, g => g_sig(0), p => p_sig(0), s => s_sig(0));
	fa2: entity bit_full_adder_cg port map (a => a_sig(1), b => b_sig(1),
		c => c_sig(1), g => g_sig(1), p => p_sig(1), s => s_sig(1));
	fa3: entity bit_full_adder_cg port map (a => a_sig(2), b => b_sig(2),
		c => c_sig(2), g => g_sig(2), p => p_sig(2), s => s_sig(2));
	fa4: entity bit_full_adder_cg port map (a => a_sig(3), b => b_sig(3),
		c => c_sig(3), g => g_sig(3), p => p_sig(3), s => s_sig(3));
	cl: entity cl_logic port map (c_in => c_in_sig, g => g_sig, p => p_sig, gg => gg_sig, pg => pg_sig, c_out => c_sig);  
	sum <= s_sig; 
	gg <= gg_sig;
	pg <= pg_sig;
end cla_4;
