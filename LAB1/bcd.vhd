library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity bcd is
  port (
	v : in unsigned(3 downto 0);
	m : out unsigned(4 downto 0)
  ) ;
end entity ; -- bcd

architecture behav of bcd is
begin
conv : process( v )
begin
	if v < 10 then m <= ("0" & v);
	else m <= ("1" & (v - 10));
	end if ;
end process ; -- conv
end architecture ; -- behav