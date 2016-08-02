-------------------------------------------------------------------------------
--
-- Title       : cla_16
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\cla_16.vhd
-- Generated   : Thu Nov 27 15:30:57 2014
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
--{entity {cla_16} architecture {cla_16}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity cla_16 is 
	port(
		a : in std_logic_vector(15 downto 0);
		b : in std_logic_vector(15 downto 0);
		c_in : in std_logic;
		sum : out std_logic_vector(15 downto 0);
		gg : out std_logic;
		pg : out std_logic
	);
end cla_16;

--}} End of automatically maintained section

architecture cla_16 of cla_16 is
	signal c_sig : std_logic_vector (3 downto 0);
	signal gg_sig, pg_sig : std_logic_vector(3 downto 0);
begin
	
	c_sig(0) <= c_in;
	
	cl1: entity cla_4 port map (a => a(3 downto 0), b => b(3 downto 0),
		c_in =>	c_sig(0), sum => sum(3 downto 0), gg => gg_sig(0), pg => pg_sig(0));
	cl2: entity cla_4 port map (a => a(7 downto 4), b => b(7 downto 4),
		c_in =>	c_sig(1), sum => sum(7 downto 4), gg => gg_sig(1), pg => pg_sig(1));
	cl3: entity cla_4 port map (a => a(11 downto 8), b => b(11 downto 8),
		c_in =>	c_sig(2), sum => sum(11 downto 8), gg => gg_sig(2), pg => pg_sig(2));
	cl4: entity cla_4 port map (a => a(15 downto 12), b => b(15 downto 12),
		c_in =>	c_sig(3), sum => sum(15 downto 12), gg => gg_sig(3), pg => pg_sig(3));
	cl_logic: entity cl_logic port map (c_in => c_sig(0), g => gg_sig,
		p => pg_sig, gg => gg, pg => pg, c_out => c_sig(3 downto 1));
		
end cla_16;
