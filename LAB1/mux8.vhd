library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity mux8 is
  port (
	s 	: in std_logic;
	X	: in std_logic_vector(7 downto 0);
	Y	: in std_logic_vector(7 downto 0);
	M 	: out std_logic_vector(7 downto 0)
  ) ;
end entity ; -- mux8

architecture behav of mux8 is
begin
	with s select M <=
		X when '0',
		Y when '1';
end architecture ; -- behav