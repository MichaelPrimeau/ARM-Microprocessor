library ieee;
use ieee.std_logic_1164.all;

entity REG4 is
port(D3,D2,D1,D0 : in std_logic;
	  LD,RST,CLK  : in std_logic;
	  Q3,Q2,Q1,Q0 : out std_logic);
end entity;

architecture BEHAVIORAL of REG4 is
begin

--	process(LD,RST,CLK)
--	begin
--		if rising_edge(CLK) then
--			if RST = '1' then Q3 <= '0'; Q2 <= '0'; Q1 <= '0'; Q0 <= '0';
--			elsif LD = '1' then Q3 <= D3; Q2 <= D2; Q1 <= D1; Q0 <= D0;
--			end if;
--		end if;
--	end process;

	process(LD,RST,CLK)
	begin
		if RST = '0' then Q3 <= '0'; Q2 <= '0'; Q1 <= '0'; Q0 <= '0';
	   elsif rising_edge(CLK) then
			if LD = '1' then Q3 <= D3; Q2 <= D2; Q1 <= D1; Q0 <= D0;
			end if;
		end if;
	end process;
	
end architecture BEHAVIORAL;