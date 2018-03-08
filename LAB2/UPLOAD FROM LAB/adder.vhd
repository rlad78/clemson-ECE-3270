library ieee ;
	use ieee.std_logic_1164.all ;

entity adder is
  port (
	a 	: in std_logic;
	b 	: in std_logic;
	ci 	: in std_logic;
	s 	: out std_logic;
	co 	: out std_logic
  ) ;
end entity ; -- adder

architecture behav of adder is
begin
	s <= ci xor (a xor b);

	--with (a xor b) select co <=
	--	ci when '1',
	--	b when '0';
		
	co <= ci when (a xor b) = '1' else 
		  b when (a xor b) = '0';
end architecture ; -- behav