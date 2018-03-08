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
-- Generated on "02/22/2018 20:19:30"
                                                            
-- Vhdl Test Bench template for design  :  ripple_carry_adder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ripple_carry_adder_vhd_tst IS
END ripple_carry_adder_vhd_tst;
ARCHITECTURE ripple_carry_adder_arch OF ripple_carry_adder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL ci : STD_LOGIC;
SIGNAL cout : STD_LOGIC;
SIGNAL S : STD_LOGIC_VECTOR(15 DOWNTO 0);
COMPONENT ripple_carry_adder
	PORT (
	A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	ci : IN STD_LOGIC;
	cout : OUT STD_LOGIC;
	S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ripple_carry_adder
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	ci => ci,
	cout => cout,
	S => S
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
    --test all edge cases
	edge_cases : for i in 0 to 1 loop
		if i = 1 then
			ci <= '1';
		else
			ci <= '0';
		end if ;

		A <= (others => '0');
		B <= (others => '0');
		wait for 10 ns;

		A <= (others => '1');
		wait for 10 ns;

		B <= (others => '1');
		wait for 10 ns;

		B <= (others => '0');
		wait for 10 ns;
	end loop ; -- edge_cases

	-- ## 80 ns ###
	wait for 20 ns; -- padding space
	-- ## 100 ns ##

	--test generic cases
	A <= (0 => '0', others => '1');
	B <= (others => '0');
	ci <= '1';
	wait for 10 ns;

	A <= (15 downto 7 => '1', others => '0');
	B <= (6 downto 0 => '0', others => '0');
	-- ci = '1' still
	wait for 10 ns;

	A <= "1010101010101010";
	B <= "1010101010101010";
	ci <= '0';
	wait for 10 ns;

	B <= "0101010101010101";
	wait for 10 ns;

	ci <= '1';
	wait for 10 ns;

	-- ## 150 ns ##

WAIT;                                                        
END PROCESS always;                                          
END ripple_carry_adder_arch;
