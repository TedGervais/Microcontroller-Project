library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use ieee.numeric_std.all;
use ieee.math_real.all;

entity alu_TB is
end entity;

architecture alu_wave of alu_TB is

signal rs1:			std_logic_vector(63 downto 0) := x"0000000000000000";
signal rs2:			std_logic_vector(63 downto 0) := x"0000000000000000";
signal opcode:		std_logic_vector(3 downto 0)  := "1111";
signal data: 		std_logic_vector(63 downto 0) := x"1000000000000000";
signal rd:			std_logic_vector(63 downto 0) := x"0000000000000000";

begin
	
	UUT: entity alu	port map(rs1 => rs1,
		rs2 => rs2, opcode => opcode,
		data => data, rd => rd);

	STIMULUS: process
	begin
		
		rs1 <= x"FFFFFFFF00000000";
		rs2 <= x"0001020300010203";
		opcode <= "0000";
		wait for 10 ns;
		
		rs1 <= x"0000fa1000009f43";
		rs2 <= x"0000ab3400007c47";
		opcode <= "0001";
		wait for 10 ns;
		
		rs1 <= x"FFFF0000FFFF0000";
		rs2 <= x"FFFE00010001FFFE";
		opcode <= "0010";
		wait for 10 ns;	
		
		rs1 <= x"FFFF0001FFF00000";
		rs2 <= x"0001CDFE0001FFFE";
		opcode <= "0011";
		wait for 10 ns;
		
		rs1 <= x"FFFFFFFF00000000";
		rs2 <= x"0001CDFE00010010";
		opcode <= "0100";
		wait for 10 ns;
		
		opcode <= "0101";
		wait for 10 ns;
		
		opcode <= "0110";
		wait for 10 ns;	
		
		opcode <= "0111";
		wait for 10 ns;	
		
		rs1 <= x"0000000000000001";
		rs2 <= x"0001CDFE00010103";
		opcode <= "1000";
		wait for 10 ns;
		
		rs1 <= x"FF00011133740103";
		opcode <= "1001";
		wait for 10 ns;
		
		rs1 <= x"0004000000000000";
		opcode <= "1010";
		wait for 10 ns;	
		
		rs1 <= x"FFFFFFFF00000000";
		rs2 <= x"0124FEDB0124FEDB";
		opcode <= "1011";
		wait for 10 ns;
		
		opcode <= "1100";
		wait for 10 ns;
		
		opcode <= "1101";
		wait for 10 ns;
		
		data <= x"0123456789ABCDEF";
		opcode <= "1110";
		wait for 10 ns;
		
		opcode <= "1111";
		wait for 10 ns;
		
		wait;	
	end process;
end architecture;