library ieee;
use ieee.std_logic_1164.all;
entity registrador is port (
	CLK: in std_logic;
	EN: in std_logic;
	RST: in std_logic;
	ENTRADA: in std_logic_vector(7 downto 0);
	SAIDA: out std_logic_vector(7 downto 0));
end registrador;
architecture behv of registrador is
begin
	process(CLK,RST)
	begin
	
	if (RST = '0') then
		SAIDA <= "00000000";
	
		elsif (CLK'event and CLK = '1') then
			if (EN = '0') then
				SAIDA <= ENTRADA;
		
		end if;
	end if;

end process;
end behv;
