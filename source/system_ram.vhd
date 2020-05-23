-- Sync RAM , previous read

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity system_ram is
	generic
	(
		g_address_width	: integer := 12;
		g_data_width	  : integer := 8
	);
	port
	(
		i_clk		       	: in  std_logic;
		i_data_in	      : in  std_logic_vector(g_data_width - 1 downto 0);
		i_write_address	: in  std_logic_vector(g_address_width - 1 downto 0);
		i_read_address	: in  std_logic_vector(g_address_width - 1 downto 0);
		i_we	          : in  std_logic;
  	o_data_out     	: out std_logic_vector(g_data_width - 1 downto 0)
	);
end system_ram;


architecture rtl of system_ram is

	type t_ram is array(0 to 2 ** g_address_width - 1) of std_logic_vector(g_data_width - 1 downto 0);

	function program_1 return t_ram is
		variable temp : t_ram;
		-- other variables
	begin
		for i in t_ram'range loop
			temp(i) := x"FF";
	 	end loop;
		temp(0) := x"AA";
		temp(1) := x"AB";
		temp(2) := x"AC";
		temp(3) := x"AD";
		
		return temp;

	end function;

  signal ram_block : t_ram := program_1;
begin

	process (i_clk)
	begin
		if (i_clk'event and i_clk = '1') then
			if (i_we = '1') then
			    ram_block(to_integer(unsigned(i_write_address))) <= i_data_in;
			end if;

      -- read previous data
			o_data_out <= ram_block(to_integer(unsigned(i_read_address)));
		end if;
	end process;

end rtl;
