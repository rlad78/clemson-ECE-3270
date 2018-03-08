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
-- Generated on "03/01/2018 16:06:38"
                                                            
-- Vhdl Test Bench template for design  :  state_machine
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY state_machine_vhd_tst IS
  generic (
	R : std_logic_vector(3 downto 0) := "0000" ; 
	L1 : std_logic_vector(3 downto 0) := "0001" ; 
	L2 : std_logic_vector(3 downto 0) := "0011" ; 
	L3 : std_logic_vector(3 downto 0) := "0010" ; 
	L4 : std_logic_vector(3 downto 0) := "0110" ; 
	L5 : std_logic_vector(3 downto 0) := "0111" ; 
	ERR : std_logic_vector(3 downto 0) := "0101" ; 
	FU : std_logic_vector(3 downto 0) := "0100" ; 
	U : std_logic_vector(3 downto 0) := "1100"  
  ) ;  
END state_machine_vhd_tst;
ARCHITECTURE state_machine_arch OF state_machine_vhd_tst IS
                                            
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL cur_state : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL seq_bit : STD_LOGIC;
COMPONENT state_machine
	PORT (
	clock : IN STD_LOGIC;
	cur_state : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	seq_bit : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : state_machine
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	cur_state => cur_state,
	seq_bit => seq_bit
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
BEGIN                                                         
		clock <= '0';

        --send all reset (locked) combinations
        -- 0
        seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        assert (cur_state = R) report "RESET break (0)" severity failure;

        -- 11
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        assert (cur_state = R) report "RESET break (11)" severity failure;

        -- 100
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
		seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        assert (cur_state = R) report "RESET break (100)" severity failure;

        --send all false unlocks
        -- 10111
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        assert (cur_state = FU) report "FALSE UNLOCK break (10111)" severity failure;
        -- make sure reset works
        seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        assert (cur_state = R) report "RESET break (FU-10111)" severity failure;

        -- 10100
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        assert (cur_state = FU) report "FALSE UNLOCK break (10100)" severity failure;
        -- make sure reset works
        seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        assert (cur_state = R) report "RESET break (FU-10100)" severity failure;

        -- 10101
		seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        assert (cur_state = FU) report "FALSE UNLOCK break (10101)" severity failure;
        -- make sure reset works
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        assert (cur_state = R) report "RESET break (FU-10101)" severity failure;

        --send unlock
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '1'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        assert (cur_state = U) report "UNLOCK break" severity failure;
        -- make sure reset works
        seq_bit <= '0'; wait for 5 ns; clock <= '1'; wait for 5 ns; 
        clock <= '0'; wait for 5 ns;
        assert (cur_state /= R) report "RESET break (UNLOCK)" severity note;


WAIT;                                                        
END PROCESS always;                                          
END state_machine_arch;
