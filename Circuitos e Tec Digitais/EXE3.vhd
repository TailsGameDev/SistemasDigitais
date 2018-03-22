library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity EXE3 is
	port (
	CLOCK_50: in std_logic;
	HEX0: out std_logic_vector(6 downto 0);
	HEX1: out std_logic_vector(6 downto 0);
	HEX2: out std_logic_vector(6 downto 0);
	HEX3: out std_logic_vector(6 downto 0);
	HEX4: out std_logic_vector(6 downto 0);
	HEX5: out std_logic_vector(6 downto 0);
	LEDR: out std_logic_vector (9 downto 0);
	KEY: in std_logic_vector(3 downto 0));
end EXE3;

architecture EXE3ARCH of EXE3 is 
	type STATES is (EF, EE, ED, EC, EB, EA, E9, E8, E7, E6, E5, E4, E3, E2, E1, E0);
	signal C1Hz: std_logic;
	signal cont: std_logic_vector(27 downto 0);
	signal EAtual, PEstado: STATES;
	
--remover C1Hz e cont do começo do process
--substituir KEY(3)='0' por KEY(3)
--
begin
	process(CLOCK_50, KEY(3))
	begin
		if (KEY(3) = '0') then
			EAtual <= EF;
			cont <= x"0000000";
		
		elsif (CLOCK_50'event AND CLOCK_50 = '1') then
			cont <= cont+1;
		
		
			if (cont = x"2FAF07F") then
				cont <= x"0000000";
				EAtual <= PEstado;
				--C1Hz <= '1';
			--else
				--C1Hz <= '0';
			end if;
		
		end if;
		--if(C1Hz='1') then
		--	EAtual <= PEstado;
		--end if;
		
	end process;

	process(EAtual)
	begin
		case EAtual is
			when EF => 
				HEX0 <= "0001110";
				HEX1 <= "0001110";
				HEX2 <= "0001110";
				HEX3 <= "0001110";
				HEX4 <= "0001110";
				HEX5 <= "0001110";
				LEDR <= "0101010101";
				PEstado<=EE;
			
			when EE => 
				HEX0 <= "0000110";
				HEX1 <= "0000110";
				HEX2 <= "0000110";
				HEX3 <= "0000110";
				HEX4 <= "0000110";
				HEX5 <= "0000110";
				LEDR <= "1010101010";
				PEstado<=ED;
			
			when ED => 
				HEX0 <= "0100001";
				HEX1 <= "0100001";
				HEX2 <= "0100001";
				HEX3 <= "0100001";
				HEX4 <= "0100001";
				HEX5 <= "0100001";
				LEDR <= "1111111111";
				PEstado<=EC;
				
			
			when EC => 
				HEX0 <= "1000110";
				HEX1 <= "1000110";
				HEX2 <= "1000110";
				HEX3 <= "1000110";
				HEX4 <= "1000110";
				HEX5 <= "1000110";
				LEDR <= "0000000000";
				PEstado<=EB;
				
			when EB =>
				HEX0 <= "0000011";
				HEX1 <= "0000011";
				HEX2 <= "0000011";
				HEX3 <= "0000011";
				HEX4 <= "0000011";
				HEX5 <= "0000011";
				LEDR <= "0101010101";
				PEstado<=EA;
				
			when EA => 
				HEX0 <= "0001000";
				HEX1 <= "0001000";
				HEX2 <= "0001000";
				HEX3 <= "0001000";
				HEX4 <= "0001000";
				HEX5 <= "0001000";
				LEDR <= "1010101010";
				PEstado<=E9;
			
			when E9 => 
				HEX0 <= "0011000";
				HEX1 <= "0011000";
				HEX2 <= "0011000";
				HEX3 <= "0011000";
				HEX4 <= "0011000";
				HEX5 <= "0011000";
				LEDR <= "1111111111";
				PEstado<=E8;
				
			when E8 =>
				HEX0 <= "0000000";
				HEX1 <= "0000000";
				HEX2 <= "0000000";
				HEX3 <= "0000000";
				HEX4 <= "0000000";
				HEX5 <= "0000000";
				LEDR <= "0000000000";
				PEstado<=E7;
			
			when E7 => 
				HEX0 <= "1111000";
				HEX1 <= "1111000";
				HEX2 <= "1111000";
				HEX3 <= "1111000";
				HEX4 <= "1111000";
				HEX5 <= "1111000";
				LEDR <= "0101010101";
				PEstado<=E6;
			
			when E6 => 
				HEX0 <= "0000010";
				HEX1 <= "0000010";
				HEX2 <= "0000010";
				HEX3 <= "0000010";
				HEX4 <= "0000010";
				HEX5 <= "0000010";
				LEDR <= "1010101010";
				PEstado<=E5;
			
			when E5 =>
				HEX0 <= "0010010";
				HEX1 <= "0010010";
				HEX2 <= "0010010";
				HEX3 <= "0010010";
				HEX4 <= "0010010";
				HEX5 <= "0010010";
				LEDR <= "1111111111";
				PEstado<=E4;
			
			when E4 =>
				HEX0 <= "0011001";
				HEX1 <= "0011001";
				HEX2 <= "0011001";
				HEX3 <= "0011001";
				HEX4 <= "0011001";
				HEX5 <= "0011001";
				LEDR <= "0000000000";
				PEstado<=E3;
			
			when E3 => 
				HEX0 <= "0110000";
				HEX1 <= "0110000";
				HEX2 <= "0110000";
				HEX3 <= "0110000";
				HEX4 <= "0110000";
				HEX5 <= "0110000";
				LEDR <= "0101010101";
				PEstado<=E2;
			
			when E2 => 
				HEX0 <= "0100100";
				HEX1 <= "0100100";
				HEX2 <= "0100100";
				HEX3 <= "0100100";
				HEX4 <= "0100100";
				HEX5 <= "0100100";
				LEDR <= "1010101010";
				PEstado<=E1;
			
			when E1 => 
				HEX0 <= "1111001";
				HEX1 <= "1111001";
				HEX2 <= "1111001";
				HEX3 <= "1111001";
				HEX4 <= "1111001";
				HEX5 <= "1111001";
				LEDR <= "1111111111";
				PEstado<=E0;
			
			when E0 => 
				HEX0 <= "1000000";
				HEX1 <= "1000000";
				HEX2 <= "1000000";
				HEX3 <= "1000000";
				HEX4 <= "1000000";
				HEX5 <= "1000000";
				LEDR <= "0000000000";
				PEstado<=EF;
			
			end case;
		end process;
	end EXE3ARCH;