library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexador4 is 
port(
	       entrada: in std_logic_vector(7 downto 0);
         entrada2: in std_logic_vector(7 downto 0);
         entrada3: in std_logic_vector(7 downto 0);
         entrada4: in std_logic_vector(7 downto 0);
            sinal: in std_logic_vector(1 downto 0);
           saida: out std_logic_vector(7 downto 0)
        );
end multiplexador4;

architecture mux of multiplexador4 is 
begin

saida <=          entrada  when sinal = "00" else
						entrada2 when sinal = "01" else
						entrada3 when sinal = "10" else
						entrada4;
	
end mux;
