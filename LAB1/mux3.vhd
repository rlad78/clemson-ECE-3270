library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity mux3 is
  port (
	S 	: in std_logic_vector(2 downto 0);
	U	: in std_logic_vector(2 downto 0);
	V	: in std_logic_vector(2 downto 0);
	W	: in std_logic_vector(2 downto 0);
	X	: in std_logic_vector(2 downto 0);
	Y	: in std_logic_vector(2 downto 0);
	M 	: out std_logic_vector(2 downto 0)
  ) ;
end entity ; -- mux3

architecture behav of mux3 is
begin
	with unsigned(S) select M <=
		U when 0,
		V when 1,
		W when 2,
		X when 3,
		Y when 4;
end architecture ; -- behav