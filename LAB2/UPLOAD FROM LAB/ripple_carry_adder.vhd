library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all;

entity ripple_carry_adder is
  generic ( N : integer := 16);
  port ( 
	A : in std_logic_vector(N-1 downto 0) ;
	B : in std_logic_vector(N-1 downto 0) ;
	ci: in std_logic ;
	S : out std_logic_vector(N-1 downto 0) ;
	cout : out std_logic
  ) ;
end entity ; -- ripple_carry_adder

architecture behav of ripple_carry_adder is
	signal carry_through : std_logic_vector(N downto 0) ;                    
begin
	carry_through(0) <= ci;
	cout <= carry_through(N);

	fadd_group : for i in 0 to N-1 generate
		fadd : entity work.adder
			port map (
				a => A(i),
				b => B(i),
				ci => carry_through(i),
				s => S(i),
				co => carry_through(i+1)
			);
	end generate ; -- fa_group
end architecture ; -- behav