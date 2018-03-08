library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity state_next is
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
  port (
	seq_bit : in std_logic ;
	prev_state : in std_logic_vector(3 downto 0);
	next_state : out std_logic_vector(3 downto 0) 
  ) ;
end entity ; -- state_next

architecture behav of state_next is 
	
begin
  	next_state <= L1 when (seq_bit = '1' and prev_state = R) else
				R when (seq_bit = '0' and prev_state = R) else
				R when (seq_bit = '1' and prev_state = L1) else
				L2 when (seq_bit = '0' and prev_state =L1) else
				L3 when (seq_bit = '1' and prev_state = L2) else
				R when (seq_bit = '0' and prev_state = L2) else
				L5 when (seq_bit = '1' and prev_state = L3) else
				L4 when (seq_bit = '0' and prev_state = L3) else
				FU when (seq_bit = '1' and prev_state = L4) else
				FU when (seq_bit = '0' and prev_state = L4) else
				FU when (seq_bit = '1' and prev_state = L5) else
				U when (seq_bit = '0' and prev_state = L5) else
				ERR when (seq_bit = '1' and prev_state = ERR) else
				ERR when (seq_bit = '0' and prev_state = ERR) else
				R when (seq_bit = '1' and prev_state = FU) else
				R when (seq_bit = '0' and prev_state = FU) else
				R when (seq_bit = '1' and prev_state = U) else
				R when (seq_bit = '0' and prev_state = U) ;
  				
end architecture ; -- behav