library ieee;
use ieee.std_logic_1164.all;

entity WBADDSELECT is
port(D1,D0 : in std_logic_vector(3 downto 0);
     S     : in std_logic;
	  WBADD : out std_logic_vector(3 downto 0));
end entity WBADDSELECT;

architecture DATAFLOW of WBADDSELECT is
begin

	with S select
	WBADD <= D1 when '1',
	         D0 when others;

end architecture DATAFLOW;