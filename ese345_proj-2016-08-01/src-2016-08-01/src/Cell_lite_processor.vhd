library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 
use std.textio.all;

entity cell_lite_processor is
	port (
	clk: in std_logic;
	data : in std_logic_vector(63 downto 0);
	if_id : out std_logic_vector(15 downto 0);
	id_ex : out std_logic_vector(200 downto 0);
	exwb : out std_logic_vector(64 downto 0)
	); 
end entity;

architecture structured of cell_lite_processor is
signal ins : std_logic_vector(15 downto 0);
signal ins2 : std_logic_vector(15 downto 0);
signal opcodes : std_logic_vector(3 downto 0);
signal opcode2 : std_logic_vector(3 downto 0);
signal d_ctrl :std_logic_vector(3 downto 0);
signal d_ctrl2 : std_logic_vector(3 downto 0);
signal s1_ctrl : std_logic_vector(3 downto 0);
signal s2_ctrl : std_logic_vector(3 downto 0);
signal write : std_logic;
signal d : std_logic_vector(63 downto 0);
signal s1: std_logic_vector(63 downto 0);
signal s1a : std_logic_vector(63 downto 0);
signal s2: std_logic_vector(63 downto 0);
signal s2a: std_logic_vector(63 downto 0);
--signal data : std_logic_vector(63 downto 0);
signal wbd : std_logic_vector(63 downto 0);

begin 
	U1: entity ib_complete port map(
			clk => clk,
			oper_out=> ins
		);
	U2: entity if_id_pipeline port map(
			clk => clk,
			instruction_in => ins,
			instruction_out => ins2
		);
	U3: entity processor_control port map(
			op_in => ins2,
			op_out => opcodes,
			s1_out => s1_ctrl,
			s2_out => s2_ctrl,
			d_out => d_ctrl2
		);
	U4: entity register_file port map(
			wr_en => write ,
			rd_ctrl =>d_ctrl2 ,
			rs1_ctrl => s1_ctrl,
			rs2_ctrl => s2_ctrl,
			rd => wbd,
			rs1 => s1,
			rs2 => s2
		);
	U5: entity id_exe_pipeline port map(
			clk => clk,
			in_op => opcodes,
			out_op => opcode2,
			rs1_in => s1, 
			rs2_in => s2,
			rd_dest => d_ctrl,
			rd_dout =>d_ctrl2 ,
			data_in=> data,
			rs1_out => s1a,
			wr_out => write,
			rs2_out	=>s2a
		);
	U6: entity alu port map(
		rs1 => s1a,
		rs2 => s2a,
		opcode => opcode2,
		data => data,
		rd => wbd
		);
	
	if_id <= ins2;
	id_ex <= (opcode2 & s1 & s2 & d_ctrl2 & data & write);
	exwb <= (wbd & write);
--Enable_ALU_output: process (wbd)
--begin
--	if wbd'event then
--		write = '1';
--	end if;
--end process; 

end structured;
		