library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use std.textio.all;

entity control_TB is
end control_TB;

architecture wave of control_TB is

component processor_control
		port(
	op_in : in std_logic_vector (15 downto 0);
	op_out : out std_logic_vector(3 downto 0);
	s1_out : out std_logic_vector(3 downto 0); 
	s2_out : out std_logic_vector(3 downto 0);
	d_out : out std_logic_vector(3 downto 0)
	);
end component;

signal op_in :  std_logic_vector(15 downto 0):= "0000000000000000";
signal op_out : std_logic_vector(3 downto 0):= "0000";
signal s1_out : std_logic_vector(3 downto 0):= "0000"; 
signal s2_out : std_logic_vector(3 downto 0):= "0000";
signal d_out :  std_logic_vector(3 downto 0):= "0000";

begin
	UUT: processor_control 
		port map(
			op_in => op_in,
			op_out => op_out,
			s1_out => s1_out,
			s2_out => s2_out
		);
	Stimulus: 
	process 
	begin
		op_in <= x"ffff";
		wait for 5 ns;
		op_in <= x"abcd";
		wait for 5 ns;
		op_in <= x"1234";
		wait for 5 ns;
		wait;
	end process;
end architecture;

	