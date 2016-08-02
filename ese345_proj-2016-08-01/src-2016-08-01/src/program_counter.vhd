
library ieee;
use ieee.std_logic_1164.all;	
use ieee.numeric_std.all;

entity program_counter is
	port (
	clk: in std_logic;
	count : out std_logic_vector (3 downto 0)
	);
end program_counter;

architecture behavioral	of program_counter is
signal count_out: integer range 0 to 15;
-- wasn't sure of max range of counter, so
-- I went with 16^2

begin 
	cnt_int : process (clk) 
	begin
		if rising_edge(clk)	then
			if count_out = 15 then
				count_out <= 0;
			else 
				count_out <= count_out + 1; 
				--read and incerement count_int
			end if;
		end if;
	end process;
		count <= std_logic_vector(to_unsigned(count_out, 4));
end behavioral;
	
		
		