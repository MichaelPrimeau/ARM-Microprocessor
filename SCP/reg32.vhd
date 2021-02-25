library ieee;
use ieee.std_logic_1164.all;

entity REG32 is
port(D		   : in std_logic_vector(31 downto 0);
     LD,RST,CLK: in std_logic;
	  Q			: out std_logic_vector(31 downto 0));
end entity REG32;

architecture DATAFLOW of REG32 is
begin

	process(LD,RST,CLK)
	begin
		if rising_edge(CLK) then
			if RST = '0' then Q <= X"00000000";
			elsif LD = '1' then Q <= D;
			end if;
		end if;
	end process;
	
end architecture DATAFLOW;