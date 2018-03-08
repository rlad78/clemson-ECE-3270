LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY ripple_adder_cl is
	--Note the use of generic here.  Makes life easier!
	generic (WIDTH: INTEGER := 16);
	
	PORT(clock, resetn, ivalid, iready: IN std_logic;

		  --NOTE THAT DATAIN IS 32 BITS
		  datain: IN std_logic_vector((WIDTH*2) - 1 downto 0);
		  oready, ovalid: OUT std_logic;
		  dataout: OUT std_logic_vector(WIDTH - 1 downto 0));
END ripple_adder_cl;

ARCHITECTURE structure of ripple_adder_cl is
	--Create your ripple adder component instantiation here

	BEGIN
	rca_inst : entity work.ripple_carry_adder
		port map (
			A =>  datain(WIDTH-1 downto 0),
			B =>  datain((WIDTH*2)-1 downto WIDTH),
			ci=>  '0',
			S =>  dataout,
			cout => OPEN
		);

END structure;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
