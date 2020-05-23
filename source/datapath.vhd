-- 1802 CPU datapath
-- A.L. Faber

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Datapath is

	port (
    i_clk  : in  std_logic
	);

end entity;

architecture rtl of Datapath is

	signal r_reg_addr      : std_logic_vector(15 downto 0) := x"0000";
	signal r_incr_reg_addr : std_logic  := '1';
	signal r_load_reg_addr : std_logic  := '0';


	signal r_reg_x         : std_logic_vector(3 downto 0) := x"0";
	signal r_load_reg_x    : std_logic  := '0';


	signal r_mem_address   : std_logic_vector(7 downto 0) := x"00";
	signal r_data_in       : std_logic_vector(7 downto 0) := x"00";
	signal r_data_out      : std_logic_vector(7 downto 0);
	signal r_mem_we        : std_logic := '0';


	signal r_sys_data_in   : std_logic_vector(7 downto 0) := x"00";
	signal r_sys_data_out  : std_logic_vector(7 downto 0);

  signal w_nclk          : std_logic;
begin

  w_nclk <= not i_clk;

  INST_SYS_MEM: entity work.system_ram(RTL)
    generic map ( 
      g_address_width => 12,
      g_data_width    => 8
    )
    port map (
      i_clk            => w_nclk,
      i_data_in        => r_sys_data_in,
      i_write_address  => r_reg_addr(11 downto 0),
      i_read_address   => r_reg_addr(11 downto 0),
      i_we             => r_mem_we,
      o_data_out       => r_sys_data_out
    );


  INST_REG_MEM: entity work.sync_ram(RTL)
    generic map ( 
      g_address_width => 8,
      g_data_width    => 8
    )
    port map (
      i_clk            => i_clk,
      i_data_in        => r_data_in,
      i_write_address  => r_mem_address,
      i_read_address   => r_mem_address,
      i_we             => r_mem_we,
      o_data_out       => r_data_out
    );

  P_INCRA : process(i_clk)
  begin
    if rising_edge(i_clk) then
      if ( r_incr_reg_addr = '1' ) then
        r_reg_addr <= std_logic_vector( unsigned(r_reg_addr) + 1 );      
      end if;      
    end if;
  end process; 

end architecture;

