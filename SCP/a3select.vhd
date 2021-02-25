library ieee;
use ieee.std_logic_1164.all;

entity A3SELECT is
port(D1,D0 : in std_logic_vector(3 downto 0);
     S     : in std_logic;
	  A3    : out std_logic_vector(3 downto 0));
end entity A3SELECT;

architecture DATAFLOW of A3SELECT is
begin

	with S select
	A3 <= D1 when '1',
	      D0 when others;

end architecture DATAFLOW;