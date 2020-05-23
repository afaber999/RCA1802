-- 1802 CPU datapath
-- A.L. Faber

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Datapath is

	generic( 
		G_CLKFREQUENCY : integer := 12000000
	);


	port (
    clk  : in  std_logic
	);

end entity;

architecture rtl of Datapath is


begin



end architecture;

