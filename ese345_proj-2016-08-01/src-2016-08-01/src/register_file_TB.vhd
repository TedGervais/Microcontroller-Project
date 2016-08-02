library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_TB is 
end entity;

architecture wave of register_TB is
	
component register_file
	port(							  
		--clk : in std_logic;
		wr_en : in std_logic;
		rd_ctrl : in std_logic_vector (3 downto 0);
		rs1_ctrl : in std_logic_vector (3 downto 0);
		rs2_ctrl : in std_logic_vector (3 downto 0);
		rd : in std_logic_vector(63 downto 0);
		rs1 : out std_logic_vector(63 downto 0);
		rs2 : out std_logic_vector(63 downto 0)
		);
end component;

--signal clk:			std_logic := '0';
signal wr_en:		std_logic := '1';
signal rd_ctrl: 	std_logic_vector (3 downto 0) := "0000";
signal rd: 			std_logic_vector(63 downto 0) := (others => '0');
signal rs1_ctrl: 	std_logic_vector(3 downto 0) := "0000";
signal rs2_ctrl: 	std_logic_vector(3 downto 0) := "0000";
signal rs1:			std_logic_vector(63 downto 0);
signal rs2:			std_logic_vector(63 downto 0);

begin

UUT:
	register_file
	port map (		
	--		clk => clk,
			wr_en => wr_en,
			rd_ctrl => rd_ctrl,
			rd => rd,
			rs1_ctrl => rs1_ctrl,
			rs2_ctrl => rs2_ctrl,
			rs1 => rs1,
			rs2 => rs2
    );

STIMULUS:
process
begin
	wait for 10 ns;
--	clock <= not clock;
	wr_en <= '0';
	wait for 10 ns;
--	clock <= not clock;
	wr_en <= '1';
	wait for 10 ns;
	
	rd <= x"feedbeefacedcafe";
	rd_ctrl <= "0001";
	wr_en <= '0';
	wait for 10 ns;
	wr_en <= '1';
	rs1_ctrl <= "0001";
--	clock <= not clock;
	wait for 10 ns;
--	clock <= not clock;
	rd <= x"fadedeafbeadcade";
	rd_ctrl <= "0010";
	rs2_ctrl <= "0010";
	wr_en <= '0';
	wait for 10 ns;
	wr_en <= '1';
	wait for 20 ns;
	wait;
end process;
end architecture;
	

	
	
