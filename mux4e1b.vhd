library IEEE;
use IEEE.std_logic_1164.all;

entity mux4e1b is 
port(
	  entrada: in std_logic;
         entrada2: in std_logic;
         entrada3: in std_logic;
         entrada4: in std_logic;
            sinal: in std_logic_vector(1 downto 0);
           saida: out std_logic
        );
end mux4e1b;

architecture mux of mux4e1b is 
begin

saida <= entrada when sinal = "00" else
		entrada2 when sinal = "01" else
		entrada3 when sinal = "10" else
		entrada4;
	
end mux;
