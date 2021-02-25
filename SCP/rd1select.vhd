library ieee;
use ieee.std_logic_1164.all;

entity RD1SELECT is
port(D1,D0 : in std_logic_vector(3 downto 0);
	  S	  : in std_logic;
	  RD1	  : out std_logic_vector(3 downto 0));
end entity RD1SELECT;

architecture DATAFLOW of RD1SELECT is
begin

	with S select
	RD1 <= D1 when '1',
			 D0 when others;
			 
end architecture DATAFLOW;