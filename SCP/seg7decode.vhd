library ieee;
use ieee.std_logic_1164.all;

entity SEG7DECODE is
port(A				 : in std_logic_vector(31 downto 0);
	  SEG5,SEG4,SEG3: out std_logic_vector(7 downto 0);
	  SEG2,SEG1,SEG0: out std_logic_vector(7 downto 0));
end entity SEG7DECODE;

architecture BEHAVIORAL of SEG7DECODE is
begin

	with A(23 downto 20) select -- sixth nibble
	SEG5	<= B"11000000" when X"0",
				B"11111001" when X"1",
				B"10100100" when X"2",
				B"10110000" when X"3",
				B"10011001" when X"4",
				B"10010010" when X"5",
				B"10000010" when X"6",
				B"11111000" when X"7",
				B"10000000" when X"8",
				B"10011000" when X"9",
				B"10001000" when X"A",
				B"10000011" when X"B",
				B"10100111" when X"C",
				B"10100001" when X"D",
				B"10000110" when X"E",
				B"10001110" when others;
				
	with A(19 downto 16) select -- fifth nibble
	SEG4	<= B"11000000" when X"0",
				B"11111001" when X"1",
				B"10100100" when X"2",
				B"10110000" when X"3",
				B"10011001" when X"4",
				B"10010010" when X"5",
				B"10000010" when X"6",
				B"11111000" when X"7",
				B"10000000" when X"8",
				B"10011000" when X"9",
				B"10001000" when X"A",
				B"10000011" when X"B",
				B"10100111" when X"C",
				B"10100001" when X"D",
				B"10000110" when X"E",
				B"10001110" when others;
				
	with A(15 downto 12) select -- fourth nibble
	SEG3	<= B"11000000" when X"0",
				B"11111001" when X"1",
				B"10100100" when X"2",
				B"10110000" when X"3",
				B"10011001" when X"4",
				B"10010010" when X"5",
				B"10000010" when X"6",
				B"11111000" when X"7",
				B"10000000" when X"8",
				B"10011000" when X"9",
				B"10001000" when X"A",
				B"10000011" when X"B",
				B"10100111" when X"C",
				B"10100001" when X"D",
				B"10000110" when X"E",
				B"10001110" when others;
				
	with A(11 downto 8) select -- third nibble
	SEG2	<= B"11000000" when X"0",
				B"11111001" when X"1",
				B"10100100" when X"2",
				B"10110000" when X"3",
				B"10011001" when X"4",
				B"10010010" when X"5",
				B"10000010" when X"6",
				B"11111000" when X"7",
				B"10000000" when X"8",
				B"10011000" when X"9",
				B"10001000" when X"A",
				B"10000011" when X"B",
				B"10100111" when X"C",
				B"10100001" when X"D",
				B"10000110" when X"E",
				B"10001110" when others;
				
	with A(7 downto 4) select -- second nibble
	SEG1	<= B"11000000" when X"0",
				B"11111001" when X"1",
				B"10100100" when X"2",
				B"10110000" when X"3",
				B"10011001" when X"4",
				B"10010010" when X"5",
				B"10000010" when X"6",
				B"11111000" when X"7",
				B"10000000" when X"8",
				B"10011000" when X"9",
				B"10001000" when X"A",
				B"10000011" when X"B",
				B"10100111" when X"C",
				B"10100001" when X"D",
				B"10000110" when X"E",
				B"10001110" when others;
				
	with A(3 downto 0) select -- first nibble
	SEG0	<= B"11000000" when X"0",
				B"11111001" when X"1",
				B"10100100" when X"2",
				B"10110000" when X"3",
				B"10011001" when X"4",
				B"10010010" when X"5",
				B"10000010" when X"6",
				B"11111000" when X"7",
				B"10000000" when X"8",
				B"10011000" when X"9",
				B"10001000" when X"A",
				B"10000011" when X"B",
				B"10100111" when X"C",
				B"10100001" when X"D",
				B"10000110" when X"E",
				B"10001110" when others;
				
end architecture BEHAVIORAL;