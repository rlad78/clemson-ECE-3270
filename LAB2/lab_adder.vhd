library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity lab_adder is
  port (
	ci	: IN std_logic;
	a 	: IN std_logic_vector(3 downto 0);
	b 	: IN std_logic_vector(3 downto 0);
	s 	: OUT std_logic_vector(3 downto 0);
	co 	: OUT std_logic
  ) ;
end entity ; -- lab_adder
	
architecture behav of lab_adder is
begin
	(ci, s) <= ('0' & a) + ('0' & b) + ci;
end architecture ; -- behav