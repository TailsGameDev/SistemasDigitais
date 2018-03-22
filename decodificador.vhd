library IEEE;
use IEEE.std_logic_1164.all;

entity decodificador is
    port(entrada: in std_logic_vector(3 downto 0);
			 enable: in std_logic;
        display: out std_logic_vector(6 downto 0)         
    );
end decodificador;

architecture circuito of decodificador is
begin
    display <= 
					"1000000" when entrada = "0000" and enable ='1' else
               "1111001" when entrada = "0001" and enable ='1' else
               "0100100" when entrada = "0010" and enable ='1' else
               "0110000" when entrada = "0011" and enable ='1' else
               "0011001" when entrada = "0100" and enable ='1' else
               "0010010" when entrada = "0101" and enable ='1' else
               "0000010" when entrada = "0110" and enable ='1' else
               "1111000" when entrada = "0111" and enable ='1' else
               "0000000" when entrada = "1000" and enable ='1' else
               "0011000" when entrada = "1001" and enable ='1' else
               "0001000" when entrada = "1010" and enable ='1' else
               "0000011" when entrada = "1011" and enable ='1' else
               "1000110" when entrada = "1100" and enable ='1' else
               "0100001" when entrada = "1101" and enable ='1' else
               "0000110" when entrada = "1110" and enable ='1' else
               "0001110" when entrada = "1111" and enable ='1' else
					"1111111";
end circuito;
