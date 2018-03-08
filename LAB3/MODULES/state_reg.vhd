library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity state_reg is
  port (
	clock : in std_logic;
	state_in : in std_logic_vector(3 downto 0) ;
	state_out: out std_logic_vector(3 downto 0)
  ) ;
end entity ; -- state_reg

architecture behav of state_reg is
	signal current_state : std_logic_vector(3 downto 0) := "0000" ;
begin
	state_out <= current_state;

	data_sync : process( clock )
	begin
		if( rising_edge(clock) ) then
			current_state <= state_in;
		end if ;
	end process ; -- data_sync
end architecture ; -- arch