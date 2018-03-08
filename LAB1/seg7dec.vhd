library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity seg7dec is
  port (
	c	: in unsigned(2 downto 0);
	seg : out std_logic_vector(7 downto 0)
  ) ;
end entity ; -- seg7dec

architecture behav of seg7dec is
	signal letter1: std_logic_vector(6 downto 0) := "1111000";
	signal letter2:	std_logic_vector(6 downto 0) := "0110000";
	signal letter3: std_logic_vector(6 downto 0) := "1001111";
	signal letter4: std_logic_vector(6 downto 0) := "1111001";
	signal letter5: std_logic_vector(6 downto 0) := "1010000";
	signal letter6: std_logic_vector(6 downto 0) := "0000000";
begin
	with c select seg <=
		letter1 when 0,
		letter2 when 1,
		letter3 when 2,
		letter4 when 3,
		letter5 when 4,
		letter6 when 5;
end architecture ; -- behav