library ieee ;
	use ieee.std_logic_1164.all ;

entity DE1_state_machine is
  port (
	KEY	:	IN std_logic_vector(3 downto 0) ;
	SW	:	IN std_logic_vector(9 downto 0) ;
	LEDR:	OUT std_logic_vector(9 downto 0) 
  ) ;
end entity ; -- DE1_state_machine

architecture arch of DE1_state_machine is
begin
	sm_inst : entity work.state_machine
		port map (
			clock => KEY(0),
			seq_bit => SW(0),
			cur_state => LEDR(3 downto 0)
		);
end architecture ; -- arch