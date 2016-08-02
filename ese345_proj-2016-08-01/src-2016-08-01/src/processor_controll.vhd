library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use std.textio.all;

entity processor_control is
	port(
	op_in : in std_logic_vector (15 downto 0);
	op_out : out std_logic_vector(3 downto 0);
	s1_out : out std_logic_vector(3 downto 0); 
	s2_out : out std_logic_vector(3 downto 0);
	d_out : out std_logic_vector(3 downto 0)
	);
end processor_control;

architecture dataflow of processor_control is 
begin	
		op_out <= op_in(15 downto 12);
		s2_out <= op_in(11 downto 8);
		s1_out <= op_in(7 downto 4);
		d_out <= op_in(3 downto 0);
	
end dataflow;
 
 