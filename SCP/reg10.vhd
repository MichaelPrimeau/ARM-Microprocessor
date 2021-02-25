library ieee;
use ieee.std_logic_1164.all;

entity REG10 is
port(D	      : in std_logic_vector(9 downto 0);
     LD,RST,CLK: in std_logic;
	  Q			: out std_logic_vector(31 downto 0));
end entity REG10;

architecture DATAFLOW of REG10 is
begin

	process(LD,RST,CLK)
	begin
		if RST = '0' then Q <= X"00000000";
		elsif rising_edge(CLK) then
			if LD = '1' then Q <= X"00000"&B"00"&D;
			end if;
		end if;
	end process;
	
end architecture DATAFLOW;