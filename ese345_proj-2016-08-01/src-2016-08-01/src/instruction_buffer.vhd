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

entity instruction_buffer is
	port(
		count_in :in  std_logic_vector (3 downto 0); -- 
		instruction_out :out std_logic_vector(15 downto 0) --
		);
end instruction_buffer;

architecture dataflow of instruction_buffer is

type instructionFile is array (0 to 15) of std_logic_vector(15 downto 0);

signal inbuffer : instructionFile;
begin 	
	
	A:process (count_in)
	
	 begin
			instruction_out <= inbuffer(to_integer(unsigned(count_in)));
	end process A;
	
	Instruction: process

	file readfile : text;
	variable inbufferA : line;
	variable instructions : bit_vector (15 downto 0);
	
	begin
		file_open(readfile,"C:\Users\Ted\Desktop\test_vector.txt",read_mode);
		for i in 0 to 15 loop
			if (not endfile(readfile)) then
				readline(readfile,inbufferA);
				read(inbufferA,instructions);
				inbuffer(i) <= to_stdlogicvector(instructions);	
			else
				exit;
			end if;
		end loop;
		file_close(readfile);
		wait;
	end process Instruction;	
end dataflow;