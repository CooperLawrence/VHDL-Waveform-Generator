-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "12/6/2018 13:20:00"
                                                            
-- Vhdl Test Bench template for design  :  Top
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
use ieee.numeric_std.all;

ENTITY top_vhd_tst IS
END top_vhd_tst;
ARCHITECTURE top_arch OF top_vhd_tst IS
-- constants
type test_vector is record
		SW: STD_LOGIC_VECTOR(17 DOWNTO 0);
		KEY : STD_LOGIC_VECTOR(3 DOWNTO 0);
        VOUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
end record;
type test_vector_array is array (natural range <>) of test_vector;
    constant test_vectors : test_vector_array := (
			--Sample cases
        );
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL SW : STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL VOUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT top
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	SW: IN STD_LOGIC_VECTOR(17 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	VOUT : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	);
END COMPONENT;
BEGIN
	i1 : counter_top
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	SW => SW,
	KEY => KEY,
	VOUT => VOUT
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS
  variable k : natural range 0 to test_vectors'length := 0;                               
BEGIN
  CLOCK_50 <= '0';
		wait for 50 ps;   
		CLOCK_50 <= '1';
		wait for 50 ps;

  for i in 0 to 26*4 loop
    if (i mod 4 = 0) then
		  assert((SW = test_vectors(k).SW) and (KEY = test_vectors(k).KEY) and (VOUT = test_vectors(k).VOUT))
            report  "test_vector " & integer'image(k) & " failed "
                    severity error;
            k := k + 1;
    end if;
    
		CLOCK_50 <= '0';
		wait for 50 ps;   
		CLOCK_50 <= '1';
		wait for 50 ps;
	end loop;
WAIT;                                                        
END PROCESS always;
                                        
END top_arch;
