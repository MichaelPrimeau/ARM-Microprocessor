library ieee;
use ieee.std_logic_1164.all;

entity REGSRCBMUX is
port(D2 : in std_logic_vector(3 downto 0);
	  D1 : in std_logic_vector(3 downto 0);
     D0 : in std_logic_vector(3 downto 0);
	  S  : in std_logic_vector(1 downto 0);
	  Y  : out std_logic_vector(3 downto 0));
end entity;

architecture DATAFLOW of REGSRCBMUX is
begin

	with S select
	Y <= D2 when B"10",
		  D1 when B"01",
		  D0 when others;

end architecture DATAFLOW;