library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity cla_64 is
	port(
		a : in std_logic_vector(63 downto 0);
		b : in std_logic_vector(63 downto 0);  
		c_in : in std_logic;
		sixteen : in std_logic;
		sat : in std_logic;	  
		sub_of : in	std_logic_vector(3 downto 0);
		sum : out std_logic_vector(63 downto 0);
		c_out : out std_logic
	);
end cla_64;

architecture cla_64 of cla_64 is
	signal c_sig : std_logic_vector (3 downto 0);
	signal gg_sig, pg_sig : std_logic_vector(3 downto 0);
	signal s_1, s_2, s_3, s_4 : std_logic_vector(15 downto 0);
	signal carry_2, carry_4 : std_logic;
	signal gg_c_out, pg_c_out : std_logic; 
	signal sat_c_out : std_logic;
	
begin

	c_sig(0) <= c_in;
	sat_c_out <= gg_c_out or (pg_c_out and c_in);
	
	m_c1: entity mux_2_1 port map (a => c_sig(1), b => c_in, s => sixteen, q => carry_2);
	m_c2: entity mux_2_1 port map (a => c_sig(3), b => c_in, s => sixteen, q => carry_4);
	
	sat_1: entity sat_logic port map (a => s_1, c_in => c_in, c_out => c_sig(1),
		sat => sat, sub_of => sub_of(0), q => sum(15 downto 0));
	sat_2: entity sat_logic port map (a => s_2, c_in => c_in, c_out => c_sig(2),
		sat => sat, sub_of => sub_of(1), q => sum(31 downto 16));
	sat_3: entity sat_logic port map (a => s_3, c_in => c_in, c_out => c_sig(3),
		sat => sat, sub_of => sub_of(2), q => sum(47 downto 32));
	sat_4: entity sat_logic port map (a => s_4, c_in => c_in,
		c_out => sat_c_out, sat => sat, sub_of => sub_of(3), q => sum(63 downto 48));

	cl1: entity cla_16 port map (a => a(15 downto 0), b => b(15 downto 0),
		c_in => c_in, sum => s_1, gg => gg_sig(0), pg => pg_sig(0));
	
	cl2: entity cla_16 port map (a => a(31 downto 16), b => b(31 downto 16),
		c_in => carry_2, sum => s_2, gg => gg_sig(1), pg => pg_sig(1));
	
	cl3: entity cla_16 port map (a => a(47 downto 32), b => b(47 downto 32),
		c_in => c_in, sum => s_3, gg => gg_sig(2), pg => pg_sig(2));
	
	cl4: entity cla_16 port map (a => a(63 downto 48), b => b(63 downto 48),
		c_in => carry_4, sum => s_4, gg => gg_sig(3), pg => pg_sig(3));
	
	cl_logic: entity cl_logic port map (c_in => c_in, g => gg_sig, p => pg_sig,
		gg => gg_c_out, pg => pg_c_out, c_out => c_sig(3 downto 1));	
	
	c_out <= sat_c_out;
	
end cla_64;