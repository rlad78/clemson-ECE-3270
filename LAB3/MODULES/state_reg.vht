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
-- Generated on "03/01/2018 09:58:52"
                                                            
-- Vhdl Test Bench template for design  :  state_reg
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY state_reg_vhd_tst IS
END state_reg_vhd_tst;
ARCHITECTURE state_reg_arch OF state_reg_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL state_in : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL state_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT state_reg
	PORT (
	clock : IN STD_LOGIC;
	state_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	state_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : state_reg
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	state_in => state_in,
	state_out => state_out
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
	clock <= '0';
	state_in <= (others => '0');
	wait for 10 ns;

	state_in <= (others => '1');
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;
	clock <= '0';
	wait for 10 ns;

	state_in <= (0 => '1', others => '0');
	wait for 10 ns;
	clock <= '1';
	wait for 10 ns;
	clock <= '0';

WAIT;                                                        
END PROCESS always;                                          
END state_reg_arch;
