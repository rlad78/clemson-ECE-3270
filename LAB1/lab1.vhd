library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity lab1 is
  port (
	SW20 : in std_logic_vector(2 downto 0);
	SW97 : in std_logic_vector(2 downto 0);
	KEY: in std_logic_vector(3 downto 0);
	seg: out std_logic_vector(6 downto 0)
  ) ;
end entity ; -- lab1

architecture behav of lab1 is
	signal KF_out : std_logic_vector(11 downto 0) ;
	signal mux_out: std_logic_vector(2 downto 0) ;

begin
	keyflops : for i in 0 to 3 generate
		flops: entity work.dff
			port map(
				clock => KEY(i),
				d => SW20,
				q => KF_out(((i+1)*3)-1) downto (i*3));
	end generate ; -- keyflops

	mux_inst : entity work.mux3
		port map(
			U => KF_out(2 downto 0),
			V => KF_out(5 downto 3),
			W => KF_out(8 downto 6),
			X => KF_out(11 downto 9),
			Y => SW20,
			S => SW97,
			M => mux_out
		);

	seg7dec_inst : entity work.seg7dec
		port map(
			c => mux_out,
			seg => seg
		);

end architecture ; -- behav