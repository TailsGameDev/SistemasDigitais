library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Clock25 is
	port (
	CLOCK_50: in std_logic;
	saida: out std_logic ); 
end Clock25;

architecture Clock25Arch of Clock25 is 
	
	signal cont: std_logic_vector(27 downto 0);
	
begin
	process(CLOCK_50)
	begin
		
		if (CLOCK_50'event AND CLOCK_50 = '1') then
			cont <= cont+1;
		
		
			if (cont = x"BEBC1FC") then
				cont <= x"0000000";
				saida <= '1';
			else
				saida <= '0';
			end if;
		end if;
		
	end process;

	end Clock25Arch;
