library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is
port(A,B    : in std_logic_vector(31 downto 0);
      ALUS   : in std_logic_vector(2 downto 0);
		F      : inout std_logic_vector(31 downto 0);
		C,V,N,Z: out std_logic);
end entity ALU;

architecture BEHAVIORAL of ALU is

  signal INTA,INTB,INTF : std_logic_vector(32 downto 0);
  signal MUL				: std_logic_vector(63 downto 0);
  
begin

  INTA(31 downto 0) <= A;
  INTA(32) <= '0';
  INTB(31 downto 0) <= B;
  INTB(32) <= '0';
  MUL	 <= INTA(31 downto 0) * INTB(31 downto 0);

  with ALUS select
  INTF <= INTA+INTB     when B"000",
          INTA-INTB     when B"001",
		    INTA and INTB when B"010",
		    INTA or INTB  when B"011",
		    INTA xor INTB when B"100",
		    INTA          when B"101",
		    INTB          when B"110",
		    MUL(32 downto 0) when others;
			 
  F <= INTF(31 downto 0);
		 
  C <= '1' when INTF(32) = '1' and (ALUS =  B"000" or ALUS = B"001") else
       '0';
		 
  V <= (INTA(31) and INTB(31) and not INTF(31)) or (not INTA(31) and not INTB(31) and INTF(31)) when ALUS = B"000" else
       (INTA(31) and not INTB(31) and not INTF(31)) or (not INTA(31) and INTB(31) and INTF(31)) when ALUS = B"001" else
		 '0';
		 
  N <= INTF(31);
  
  Z <= '1' when F = X"00000000" else
       '0';
		 
end architecture BEHAVIORAL;