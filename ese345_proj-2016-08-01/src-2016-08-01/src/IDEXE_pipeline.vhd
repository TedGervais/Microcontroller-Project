library ieee;
use ieee.std_logic_1164.all;	
use ieee.numeric_std.all;

entity id_exe_pipeline is
	port(
	clk : in std_logic;
	rs1_in : in std_logic_vector(63 downto 0);	
	rs2_in : in std_logic_vector(63 downto 0);
	wr_out : out std_logic;
	in_op : in std_logic_vector(3 downto 0);
	rd_dest : in std_logic_vector (3 downto 0);
	data_in : in std_logic_vector (63 downto 0);
	rs1_out : out std_logic_vector(63 downto 0);
	out_op : out std_logic_vector(3 downto 0);
	rd_dout: out std_logic_vector(3 downto 0);
	rs2_out : out std_logic_vector(63 downto 0)
	);
end id_exe_pipeline;

architecture behavioral of id_exe_pipeline is
signal buff1 : std_logic_vector(63 downto 0);
signal buff2 : std_logic_vector(63 downto 0);
signal buff3 : std_logic_vector (3 downto 0);
signal buff4 : std_logic_vector (3 downto 0);

begin
	
	buff1 <= rs1_in;
	buff2 <= rs2_in;
	buff3 <= in_op;
	buff4 <= rd_dest;
	
	process (clk, data_in)
	begin
		if clk'event and clk = '1' then
			rs1_out <= buff1;
			rs2_out <= buff2;
			out_op <= buff3;
			rd_dout <= buff4;
			
			if (buff3 = "1111")  then
				wr_out <= '0';
			else wr_out <= '1';
			end if;
			
		end if;
		
	end process;
end behavioral;