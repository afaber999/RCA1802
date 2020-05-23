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

	signal r_reg_x      : std_logic_vector(3 downto 0) := x'0';
	signal r_load_reg_x : std_logic  := '0';

	-- signal r_reg_t : std_logic_vector(3 downto 0)  := x'0';
	-- signal r_reg_p : std_logic_vector(3 downto 0)  := x'0';

  INST_RAM1 : entity work.sync_ram_prev_read(RTL)
    generic map ( 
      word_size => 8,
      elements  => 256
    )
    port map (
      clk            => i_Clk,
      data_in        => r_TX_Byte,
      write_address  => to_integer(signed(r_bcounter(7 downto 0))),
      read_address   => to_integer(signed(r_acounter)),
      we             => r_TX_DV,
      data_out       => r_adata
    );



begin



end architecture;

