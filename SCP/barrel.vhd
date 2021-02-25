library ieee;
use ieee.std_logic_1164.all;

entity BARREL is
port(IN_SRC2 : in std_logic_vector(31 downto 0);
     ROTATE  : in std_logic_vector(3 downto 0);
	  OUT_SRC2: out std_logic_vector(31 downto 0));
end entity BARREL;

architecture BEHAVIORAL of BARREL is
begin

	with ROTATE select
	OUT_SRC2 <= IN_SRC2 when X"0",
				   IN_SRC2(1 downto 0) & IN_SRC2(31 downto 2) when X"1",
					IN_SRC2(3 downto 0) & IN_SRC2(31 downto 4) when X"2",
					IN_SRC2(5 downto 0) & IN_SRC2(31 downto 6) when X"3",
					IN_SRC2(7 downto 0) & IN_SRC2(31 downto 8) when X"4",
					IN_SRC2(9 downto 0) & IN_SRC2(31 downto 10) when X"5",
					IN_SRC2(11 downto 0) & IN_SRC2(31 downto 12) when X"6",
					IN_SRC2(13 downto 0) & IN_SRC2(31 downto 14) when X"7",
					IN_SRC2(15 downto 0) & IN_SRC2(31 downto 16) when X"8",
					IN_SRC2(17 downto 0) & IN_SRC2(31 downto 18) when X"9",
					IN_SRC2(19 downto 0) & IN_SRC2(31 downto 20) when X"A",
					IN_SRC2(21 downto 0) & IN_SRC2(31 downto 22) when X"B",
					IN_SRC2(23 downto 0) & IN_SRC2(31 downto 24) when X"C",
					IN_SRC2(25 downto 0) & IN_SRC2(31 downto 26) when X"D",
					IN_SRC2(27 downto 0) & IN_SRC2(31 downto 28) when X"E",
					IN_SRC2(29 downto 0) & IN_SRC2(31 downto 30) when others;

end architecture BEHAVIORAL;