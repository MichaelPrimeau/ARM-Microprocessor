library ieee;
use ieee.std_logic_1164.all;

entity EXTIMM is
port(IMM  : in std_logic_vector(23 downto 0);
	  EXTS : in std_logic_vector(1 downto 0);
	  IMM32: out std_logic_vector(31 downto 0));
end entity EXTIMM;

architecture DATAFLOW of EXTIMM is
begin

	IMM32 <= X"000000"&IMM(7 downto 0) when EXTS=B"00" else
			   X"00000"&IMM(11 downto 0) when EXTS=B"01" else
				IMM(23)&IMM(23)&IMM(23)&IMM(23)&IMM(23)&IMM(23)&IMM(23 downto 0)&B"00" when EXTS=B"10" else
				X"00000000";

end architecture DATAFLOW;