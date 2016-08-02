library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ifid_TB is
end entity;

architecture wave of ifid_TB is

component if_id_pipeline
	port(
	clk : in std_logic;
	instruction_in :in  std_logic_vector(15 downto 0);
	instruction_out :out  std_logic_vector(15 downto 0)
	);
end component;

signal clk:					std_logic := '0';
signal instruction_in:		std_logic_vector(15 downto 0) := x"0000";
signal instruction_out:		std_logic_vector(15 downto 0) := x"0000";
constant clk_period : time := 5 ns;

begin 

UUT:
	if_id_pipeline
	port map(
		clk => clk,
		instruction_in => instruction_in,
		instruction_out => instruction_out
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
	instruction_in <= x"ffff";
	wait for 10 ns;
	instruction_in <= x"abcd";
	wait for 10 ns;
	wait;
end process;
end architecture;
