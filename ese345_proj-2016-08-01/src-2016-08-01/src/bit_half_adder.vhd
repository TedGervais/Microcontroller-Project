-------------------------------------------------------------------------------
--
-- Title       : bit_half_adder
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ese345_proj\project\src\bit_half_adder.vhd
-- Generated   : Wed Nov 26 17:44:08 2014
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
--{entity {Bit_half_adder} architecture {Bit_half_adder}}

library ieee;
use ieee.std_logic_1164.all;

entity bit_half_adder is
 port (
 	a, b : in std_logic;
 	sum, carry_out: out std_logic
 );
end bit_half_adder;

architecture mixed of bit_half_adder is
begin
 
 sum <= a xor b;  -- dataflow concurrent statement
 
 co: process (a,b) -- start of process concurrent statement
 begin
  if a = '1' then
   carry_out <= b;
  else
   carry_out <= '0';
  end if;
  end process co;  -- end of process concurrent statement
 end mixed;
