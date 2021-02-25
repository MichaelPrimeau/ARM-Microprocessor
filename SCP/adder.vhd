library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ADDER is
port(A : in std_logic_vector(31 downto 0);
	  B : in std_logic_vector(31 downto 0);
	  F : out std_logic_vector(31 downto 0));
end entity;

architecture BEHAVIORAL of ADDER is
begin

	F <= A + B;
	
end architecture BEHAVIORAL;