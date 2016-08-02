-------------------------------------------------------------------------------
--
-- Title       : half_adder_test
-- Design      : project
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ese345_proj\project\src\half_adder_test.vhd
-- Generated   : Wed Nov 26 17:45:51 2014
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
--{entity {half_adder_test} architecture {half_adder_test}}

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture behavior of testbench is
-- Declare signals to assign values to and to observe
signal a_tb, b_tb, sum_tb, carry_out_tb : std_logic;

begin
 -- Create an instance of the circuit to be tested
 uut: entity bit_half_adder port map(a => a_tb, b => b_tb,
  sum => sum_tb, carry_out => carry_out_tb);
  
 -- Define a process to apply input stimulus and test outputs
 tb: process
 constant period: time := 1 ns;
 constant n: integer := 2;
 begin -- Apply every possible input combination
  for i in 0 to 2**n - 1 loop
   (a_tb, b_tb) <= to_unsigned(i,n);
   wait for period;
   assert ((sum_tb = (a_tb xor b_tb)) and (carry_out_tb = (a_tb and b_tb)))
   report "test failed" severity error;
  end loop;
  wait; -- indefinitely suspend process
 end process;
 end;
