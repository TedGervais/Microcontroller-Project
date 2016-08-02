-------------------------------------------------------------------------------
--
-- Title       : Testbench
-- Design      : pipeline processor
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\workspace\pipeline processor\src\Testbench.vhd
-- Generated   : Tue Dec  2 14:30:31 2014
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
--{entity {Testbench} architecture {Testbench}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

use std.textio.all;

entity Testbench is
end Testbench;

--}} End of automatically maintained section

architecture Testbench of Testbench is

	signal CLK : std_logic := '0';
	constant clk_period : time := 1 ns;
	signal data : std_logic_vector(63 downto 0) := x"0123456789ABCDEF"; 
	signal if_id : std_logic_vector(15 downto 0);
	signal id_ex : std_logic_vector(200 downto 0);
	signal exwb : std_logic_vector(64 downto 0);
	
begin
		
	clk_process: process 
	begin
		CLK <= '0';
		wait for clk_period/2;
		CLK <= '1';
		wait for clk_period/2;	
	end process clk_process; 
	
	WRITE_FILE: process (CLK)  
	file l_file : text is out "results.txt";
	variable outline : line;
	begin
		write(outline, string'("IF/ID   op: "));
		write(outline, if_id(15 downto 12));
		write(outline, string'(" rs1:  "));
		write(outline, if_id(11 downto 8));
		write(outline, string'(" rs2: "));
		write(outline, if_id(7 downto 4));
		write(outline, string'(" rd: "));
		write(outline, if_id(3 downto 0));
		writeline(l_file, outline); 
		write(outline, string'("ID/EX   op: "));
		write(outline, if_id(200 downto 197));
		write(outline, string'(" rs1:  "));
		hwrite(outline, if_id(196 downto 133));
		write(outline, string'(" rs2: "));
		hwrite(outline, id_ex(132 downto 69));
		write(outline, string'(" rd: "));
		write(outline, id_ex(68 downto 65));
		write(outline, string'(" data: "));
		hwrite(outline, id_ex(64 downto 1));
		write(outline, string'(" write: "));
		write(outline, id_ex(0));
		writeline(l_file, outline);
		
	end process WRITE_FILE;

	uut: entity cell_lite_processor port map (
		clk => CLK,
		data => data,
		if_id => if_id,
		id_ex => id_ex,
		exwb => exwb
	);
	
end Testbench;