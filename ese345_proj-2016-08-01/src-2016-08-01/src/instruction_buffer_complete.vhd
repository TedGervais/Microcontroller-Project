------------------------------------------------------------------------------
--
-- Title       : Instruction Buffer 
-- Author      : Ted Gervais
--
-------------------------------------------------------------------------------
--
-- File        : instruction_buffer.vhd
-------------------------------------------------------------------------------
--
-- Description : Accepts a series of 16 bit opcodes from a text file and puts
-- them in a buffer, outputting them only if the address corresponds 
-- to the PC value
--
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use std.textio.all;

entity ib_complete is
	port( 
	clk: in std_logic;
	oper_out :out std_logic_vector(15 downto 0)
	);
end ib_complete;

architecture structure of ib_complete is
signal c1 : std_logic_vector(3 downto 0);

begin	
	Count : entity program_counter port map(
		clk => clk,
		count => c1
	);
	
	IB : entity instruction_buffer port map(
		count_in => c1,
		instruction_out => oper_out
	);
end structure;

	