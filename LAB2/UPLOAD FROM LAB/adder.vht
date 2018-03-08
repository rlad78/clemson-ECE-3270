-- Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "02/22/2018 18:54:37"
                                                            
-- Vhdl Test Bench template for design  :  adder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY adder_vhd_tst IS
END adder_vhd_tst;
ARCHITECTURE adder_arch OF adder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC;
SIGNAL b : STD_LOGIC;
SIGNAL ci : STD_LOGIC;
SIGNAL co : STD_LOGIC;
SIGNAL s : STD_LOGIC;
COMPONENT adder
	PORT (
	a : IN STD_LOGIC;
	b : IN STD_LOGIC;
	ci : IN STD_LOGIC;
	co : BUFFER STD_LOGIC;
	s : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : adder
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	ci => ci,
	co => co,
	s => s
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN        
	--initialize all values with 0                                                 
	a <= '0';
	b <= '0';
	ci <= '0';
	wait for 10ns;

	--begin grey code runthrough to check all possible inputs
	a <= '1'; -- 001
	wait for 10ns;

	b <= '1'; -- 011
	wait for 10ns;
	
	a <= '0'; -- 010
	wait for 10ns;
	
	ci <= '1'; -- 110
	wait for 10ns;
	
	b <= '0'; -- 100
	wait for 10ns;
	
	a <= '1'; -- 101
	wait for 10ns;
	
	b <= '1'; -- 111
WAIT;                                                        
END PROCESS always;                                          
END adder_arch;
