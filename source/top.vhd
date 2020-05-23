-- TX uart sender for icecube
-- A.L. Faber

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Top is

	generic( 
		G_CLKFREQUENCY : integer := 12000000
	);
	port (
    i_clk  : in  std_logic
	);

end entity;

architecture rtl of Top is

begin

	INST_Datapath : entity work.Datapath(rtl)
	port map (		
		i_clk => i_clk
	);

end architecture;

