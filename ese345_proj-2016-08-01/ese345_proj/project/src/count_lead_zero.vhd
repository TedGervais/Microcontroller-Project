-------------------------------------------------------------------------------
--
-- Title       : count_lead_zero
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ese345_proj\project\src\count_lead_zero.vhd
-- Generated   : Sat Nov 29 15:53:49 2014
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
--{entity {count_lead_zero} architecture {count_lead_zero}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity count_lead_zero is
	port(
		a : in std_logic_vector(63 downto 0);
		q : out std_logic_vector(63 downto 0)
	);
end count_lead_zero;

--}} End of automatically maintained section

architecture count_lead_zero of count_lead_zero is
	signal hw_h, hw_l : std_logic_vector(31 downto 0);
	signal out_h, out_l : std_logic_vector(31 downto 0);
begin

	hw_h <= a(63 downto 32);
	hw_l <= a(31 downto 0);
	 
	count: process (hw_h,hw_l)
		variable zero_count_h, zero_count_l : integer range 0 to 32;
	begin
		zero_count_h := 0;
		zero_count_l := 0; 
		
		for i in 31 downto 0 loop
			if (hw_h(i) = '1') then 
				exit;
			else
				zero_count_h := zero_count_h + 1;
			end if;
		end loop; 
		
		for j in 31 downto 0 loop
			if (hw_l(j) = '1') then 
				exit;
			else
				zero_count_l := zero_count_l + 1;
			end if;
		end loop;
		
		out_h <= std_logic_vector(to_unsigned(zero_count_h,32));
		out_l <= std_logic_vector(to_unsigned(zero_count_l,32));
	end process count;	
	
	q <= out_h & out_l; 
	
end count_lead_zero;