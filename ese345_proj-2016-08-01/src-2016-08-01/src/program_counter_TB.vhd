library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity program_counter_TB is
end program_counter_TB;

architecture wave of program_counter_TB is

component program_counter
	port(
	clk : in std_logic;
	count : out std_logic_vector(3 downto 0)
	);
end component;

signal clk:		std_logic := '0';
signal count:	std_logic_vector(3 downto 0):= "0000";
constant clk_period : time := 5 ns;

begin
	
	UUT: program_counter
	port map(
		clk => clk,
		count => count
	);
	

	clk_process : process
	begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
	end process;

STIMULUS: 
process
begin
	wait for 170 ns;
	wait;
end process;
end architecture;
	
 