-------------------------------------------------------------------------------
--
-- Title       : count_ones
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\count_ones.vhd
-- Generated   : Sat Nov 29 17:11:36 2014
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {count_ones} architecture {count_ones}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity count_ones is
	port(
		a : in std_logic_vector(63 downto 0);
		q : out std_logic_vector(63 downto 0)
	);
end count_ones;

--}} End of automatically maintained section

architecture count_ones of count_ones is
	signal b1, b2, b3, b4, b5, b6, b7, b8 : std_logic_vector(7 downto 0); 
	signal d1, d2, d3, d4, d5, d6, d7, d8 : std_logic_vector(7 downto 0);
begin

	b1 <= a(63 downto 56);
	b2 <= a(55 downto 48);
	b3 <= a(47 downto 40);
	b4 <= a(39 downto 32);
	b5 <= a(31 downto 24);
	b6 <= a(23 downto 16);
	b7 <= a(15 downto 8);
	b8 <= a(7 downto 0);
	
	count: process(b1,b2,b3,b4,b5,b6,b7,b8)
		variable c1, c2, c3, c4, c5, c6, c7, c8 : integer range 0 to 63;
	begin 
		c1 := 0;
		c2 := 0;
		c3 := 0;
		c4 := 0;
		c5 := 0;
		c6 := 0;
		c7 := 0;
		c8 := 0;
		
		for i in 7 downto 0 loop
			if b1(i) = '1' then
				c1 := c1 + 1;
			end if;
			if b2(i) = '1' then
				c2 := c2 + 1;  
			end if;
			if b3(i) = '1' then
				c3 := c3 + 1;  
			end if;
			if b4(i) = '1' then
				c4 := c4 + 1;  
			end if;
			if b5(i) = '1' then
				c5 := c5 + 1;  
			end if;
			if b6(i) = '1' then
				c6 := c6 + 1;  
			end if;
			if b7(i) = '1' then
				c7 := c7 + 1;  
			end if;
			if b8(i) = '1' then
				c8 := c8 + 1;
			end if;
		end loop;

		d1 <= std_logic_vector(to_unsigned(c1,8));
		d2 <= std_logic_vector(to_unsigned(c2,8));
		d3 <= std_logic_vector(to_unsigned(c3,8));
		d4 <= std_logic_vector(to_unsigned(c4,8));
		d5 <= std_logic_vector(to_unsigned(c5,8));
		d6 <= std_logic_vector(to_unsigned(c6,8));
		d7 <= std_logic_vector(to_unsigned(c7,8));
		d8 <= std_logic_vector(to_unsigned(c8,8));
	
	end process count;
	
	q <= d1 & d2 & d3 & d4 & d5 & d6 & d7 & d8;
	

end count_ones;
