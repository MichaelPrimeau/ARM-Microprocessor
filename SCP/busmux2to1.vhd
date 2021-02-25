library ieee;
use ieee.std_logic_1164.all;

entity BUSMUX2TO1 is
port(D1,D0 : in std_logic_vector(31 downto 0);
	  S  		  : in std_logic;
	  Y        : out std_logic_vector(31 downto 0));
end entity;

architecture DATAFLOW of BUSMUX2TO1 is
begin

	with S select
	Y <= D1 when '1',
		  D0 when others;

end architecture DATAFLOW;