library ieee;
use ieee.std_logic_1164.all;

entity CONSTANT14 is
port(Y : out std_logic_vector(3 downto 0));
end entity;

architecture BEHAVIORAL of CONSTANT14 is
begin
	Y <= X"E";
end architecture BEHAVIORAL;