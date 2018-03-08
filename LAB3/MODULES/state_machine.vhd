library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity state_machine is
  port (
	clock : in std_logic ;
	seq_bit : in std_logic ;
	cur_state : out std_logic_vector(3 downto 0) 
  ) ;
end entity ; -- state_machine

architecture behav of state_machine is
	signal reg_in_line : std_logic_vector(3 downto 0) ;
	signal reg_out_line: std_logic_vector(3 downto 0) ;
begin
	sreg : entity work.state_reg
		port map (
			clock => clock,
			state_in => reg_in_line,
			state_out => reg_out_line 
		);
	slogic : entity work.state_next
		port map (
			seq_bit => seq_bit,
			prev_state => reg_out_line,
			next_state => reg_in_line
		);
	cur_state <= reg_out_line;
end architecture ; -- behav