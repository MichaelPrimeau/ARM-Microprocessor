library ieee;
use ieee.std_logic_1164.all;

entity synchronizer is
port(SYSRST, CLK: in std_logic;
     RST: out std_logic);
end entity synchronizer;

architecture behavioral of synchronizer is 
  signal Q1 : std_logic;
begin
  
  dff1: process(SYSRST,CLK)
  begin
    if SYSRST='0' then Q1 <= '0';
	 elsif rising_edge(CLK) then 
	   Q1 <= '1';
	 end if;
  end process;
  
  dff2: process(SYSRST,CLK)
  begin
    if SYSRST='0' then RST <='0';
	 elsif rising_edge(CLK) then 
	   RST <= Q1;
	 end if;
  end process;
  
end architecture behavioral;