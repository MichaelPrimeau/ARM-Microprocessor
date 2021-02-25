library ieee;
use ieee.std_logic_1164.all;

entity CONTROLLER is
port(COND   : in std_logic_vector(3 downto 0);
	  OP     : in std_logic_vector(1 downto 0);
	  FUNCT  : in std_logic_vector(5 downto 0);
	  ROT	   : in std_logic_vector(3 downto 0);
	  C,V,N,Z: in std_logic;
	  FOUR   : in std_logic;
	  RD     : in std_logic_vector(3 downto 0);
	  MULS	: out std_logic;
	  PCSRC  : out std_logic_vector(1 downto 0);
	  PCWR,REGWR : out std_logic;
	  EXTS,REGDST,REGSRC: out std_logic_vector(1 downto 0);
	  ALUSRCB: out std_logic;
	  ALUS   : out std_logic_vector(2 downto 0);
	  CPSRWR,MEMWR     : out std_logic;
	  ROTATE : out std_logic_vector(3 downto 0);
	  BLS    : out std_logic;
	  MEMRD	: out std_logic);
end entity;

architecture DATAFLOW of CONTROLLER is

	signal I,P,U,B,W,L : std_logic; -- load/store bits
	signal S				 : std_logic;
	signal CMD         : std_logic_vector(3 downto 0);

begin
	
	-- get bits from FUNCT input
	I   <= FUNCT(5);
	P   <= FUNCT(4);
	U   <= FUNCT(3);
	B   <= FUNCT(2);
	W   <= FUNCT(1);
	L   <= FUNCT(0);
	S   <= FUNCT(0);
	CMD <= FUNCT(4 downto 1);
	
	MULS   <= '0' when COND = X"E" and OP = B"00" and I = '0' and P = '0' and FUNCT(3 downto 1) = B"000" and FOUR = '1' else	-- MUL
	          '1';

	PCSRC  <= B"10" when COND = X"E" and OP = B"00" and CMD = X"D" and RD = X"F" else     -- MOV PC,LR
			    B"00" when COND = X"E" and OP = B"10" and P = '1' else						-- BL
				 B"00" when COND = X"1" and OP = B"10" and P = '0' and Z = '0' else		-- BNE
				 B"00" when COND = X"0" and OP = B"10" and P = '0' and Z = '1' else		-- BEQ
				 B"00" when COND = X"E" and OP = B"10" and P = '0' else						-- B
			    B"01";																						-- all others
				
	PCWR   <= '1';	-- all instructions always write
	
	REGDST <= B"10" when COND = X"E" and OP = B"01" and L = '0' else																				-- STR
				 B"00" when COND = X"E" and OP = B"00" and I = '0' and P = '0' and FUNCT(3 downto 1) = B"000" and FOUR = '1' else -- MUL
				 B"01";																																				-- all others
				 
	REGWR  <= '0' when COND = X"E" and OP = B"00" and CMD = X"D" and RD = X"F" else     -- MOV PC,LR
	          '1' when COND = X"E" and OP = B"10" and P = '1' else								-- BL
	          '0' when COND = X"E" and OP = B"00" and CMD = X"A" and S = '1' else			-- CMP
				 '0' when COND = X"E" and OP = B"01" and L = '0' else								-- STR
				 '0' when OP = B"10" else																	-- branches
				 '1';																								-- all others
				 
	EXTS   <= B"10" when OP = B"10" else							-- branches
				 B"01" when COND = X"E" and OP = B"01"	else		-- LDR/STR
				 B"00";
				 
	ROTATE <= X"0";	-- not needed for this lab
	
	ALUSRCB<= '1' when COND = X"E" and OP = B"00" and I = '0' else		-- register mode arithmetic and logic
				 '0';																		-- immediate mode, LDR/STR, and branches
				 
	ALUS   <= B"000" when COND = X"E" and OP = B"00" and CMD = X"4" else		-- ADD
	          B"111" when COND = X"E" and OP = B"00" and I = '0' and P = '0' and FUNCT(3 downto 1) = B"000" and FOUR = '1' else	-- MUL
	          B"010" when COND = X"E" and OP = B"00" and CMD = X"0" else		-- AND
				 B"001" when COND = X"E" and OP = B"00" and CMD = X"A" else		-- CMP
				 B"100" when COND = X"E" and OP = B"00" and CMD = X"1" else		-- EOR
				 B"110" when COND = X"E" and OP = B"00" and CMD = X"D" else		-- MOV
				 B"011" when COND = X"E" and OP = B"00" and CMD = X"C" else		-- ORR
				 B"001" when COND = X"E" and OP = B"00" and CMD = X"2" else		-- SUB
				 B"000";																			-- LDR,STR,branches
				 
	CPSRWR <= '1' when COND = X"E" and OP = B"00" and CMD = X"A" and S = '1' else		-- CMP
				 '1' when COND = X"E" and OP = B"00" and S = '1' else							-- arithmetic and logic
				 '0';
				 
	MEMWR  <= '1' when COND = X"E" and OP = B"01" and B = '0' and L = '0' else		-- STR
				 '0';																						-- all others
				 
	REGSRC <= B"10" when COND = X"E" and OP = B"10" and P = '1' else					-- BL
	          B"00" when COND = X"E" and OP = B"01" and B = '0' and L = '1' else 	-- LDR
				 B"01";																					-- all others
			
   BLS    <= '1' when COND = X"E" and OP = B"10" and P = '1' else					-- BL
	          '0';
	
	MEMRD  <= '1' when COND = X"E" and OP = B"01" and B = '0' and L = '1' else	-- LDR
				 '0';

end architecture DATAFLOW;











