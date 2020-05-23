
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Top_TB is
end entity;

architecture sim of Top_TB is
	constant c_ClkFrequency : integer := 10000000;
	constant c_ClkPeriod    : time    := 1 sec / c_ClkFrequency;

	signal clk           : std_logic := '1';
	signal RS232_TCX_TTL : std_logic;

begin

	i_DUT : entity work.Top(rtl)
	generic map (
		G_CLKFREQUENCY => c_ClkFrequency
	)
	port map (		
		clk           => clk
	);
	
	-- clock generator	
	clk <= not Clk after c_ClkPeriod / 2;
	
	-- Testbench sequence
	process is 
	begin
		wait for 300 ms;
	  wait;  
	end process;
end architecture;


