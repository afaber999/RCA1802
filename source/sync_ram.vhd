
-- read old address before write new address
library ieee;
use ieee.std_logic_1164.all;

entity 
  sync_ram_prev_read is
    generic (
      word_size : integer := 8;
      elements  : integer := 1024
      );

      
  port (
    clk            : in std_logic;
    data_in        : in std_logic_vector ((word_size-1) downto 0);
    write_address  : in integer range 0 to (elements-1);
    read_address   : in integer range 0 to (elements-1);
    we             : in std_logic;
    data_out       : out std_logic_vector ((word_size-1) downto 0)
  );
  
end sync_ram_prev_read;


architecture rtl of sync_ram_prev_read is
  type mem is array(0 to (elements-1)) of std_logic_vector((word_size-1) downto 0);
  signal ram_block: mem;
begin

  process (clk)
  begin
    if ( rising_edge(clk)) then
      if (we = '1') then
        ram_block(write_address) <= data_in;
      end if;

      -- vhdl semantics imply that q doesn't get data
      -- in this clock cycle
      data_out <= ram_block(read_address);
      
    end if;
  end process;
end rtl;

