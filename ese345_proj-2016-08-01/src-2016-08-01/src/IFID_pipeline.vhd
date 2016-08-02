library ieee;
use ieee.std_logic_1164.all;	
use ieee.numeric_std.all;

entity if_id_pipeline is
	port(
	clk : in std_logic;
	instruction_in :in  std_logic_vector(15 downto 0);
	instruction_out :out  std_logic_vector(15 downto 0)
	);
end if_id_pipeline;

architecture behavioral of if_id_pipeline is
signal buffr : std_logic_vector(15 downto 0);
begin
	buffr <= instruction_in;
	process (clk)
	begin
		if clk'event and clk = '1' then
			instruction_out <= buffr;
		end if;
	end process;
	
end behavioral;
