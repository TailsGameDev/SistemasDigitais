library IEEE;
use IEEE.std_logic_1164.all;

entity decodificador is
    port(entrada: in std_logic_vector(3 downto 0);
         display: out std_logic_vector(6 downto 0)         
    );
end decodificador;

architecture circuito of decodificador is
begin
    display <= "1000000" when entrada = "0000" else
               "1111001" when entrada = "0001" else
               "0100100" when entrada = "0010" else
               "0110000" when entrada = "0011" else
               "0011001" when entrada = "0100" else
               "0010010" when entrada = "0101" else
               "0000010" when entrada = "0110" else
               "1111000" when entrada = "0111" else
               "0000000" when entrada = "1000" else
               "0011000" when entrada = "1001" else
               "1110111" when entrada = "1010" else
               "1111100" when entrada = "1011" else
               "1111001" when entrada = "1100" else
               "0111110" when entrada = "1101" else
               "1111001" when entrada = "1110" else
               "1110001";
end circuito;