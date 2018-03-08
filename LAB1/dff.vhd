library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity dff is
  port (
	clock 	: in std_logic;
	d 		: in std_logic_vector(2 downto 0);
	q		: out std_logic_vector(2 downto 0)
  ) ;
end entity ; -- dff

architecture behav of dff is
begin
	set : process( clock )
	begin
		q <= d;
	end process ; -- set
end architecture ; -- behav