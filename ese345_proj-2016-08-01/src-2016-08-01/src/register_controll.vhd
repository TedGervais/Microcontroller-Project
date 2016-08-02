library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
	port(
	-- clk : in std_logic;
	wr_en : in std_logic;
	rd_ctrl : in std_logic_vector (3 downto 0);
	rs1_ctrl : in std_logic_vector (3 downto 0);
	rs2_ctrl : in std_logic_vector (3 downto 0);
	rd : in std_logic_vector(63 downto 0);
	rs1 : out std_logic_vector(63 downto 0);
	rs2 : out std_logic_vector(63 downto 0)
	);
end register_file;

--Note: comments without "#" preceeding them indicate
--optional clocking, remove comments if you want to 
--clock the module

architecture dataflow of register_file is
	type registerFile is array (0 to 15) of std_logic_vector(63 downto 0);
	signal registers : registerFile;
begin 
	--regFile: process (clk)
--	regFile: process(wr_en)
--	begin
--		--if rising_edge(clk) then
--			--#: comment out next line if module is
--			--to be clock-dependant
--			if rising_edge(wr_en) then 
--				registers(to_integer(unsigned(rd_ctrl)))<= rd;
--				if rs1_ctrl = rd_ctrl then
--					rs1 <= rd;
--				end if;
--				if rs2_ctrl = rd_ctrl then
--					rs2 <= rd;
--				end if;
--			end if;
--	end process;
	--#: indicate which internal register(s) is/are read
	with wr_en select
		rs1 <= registers(to_integer(unsigned(rs1_ctrl))) when '0',
			   rd when others;
	
	with wr_en select
		rs2 <= registers(to_integer(unsigned(rs2_ctrl))) when '0',
			   rd when others;
--			rs1 <= registers(to_integer(unsigned(rs1_ctrl)));
--			rs2 <= registers(to_integer(unsigned(rs2_ctrl)));
		--end if;
		
end dataflow;