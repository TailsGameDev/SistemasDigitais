library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexador is 
    port(entrada: in std_logic_vector(3 downto 0);
         entrada2: in std_logic_vector(3 downto 0);
         sinal: in std_logic;
         saida: out std_logic_vector(3 downto 0)
        );
end multiplexador;

architecture mux of multiplexador is 
begin
    saida <= entrada when sinal ='0' else
             entrada2;
end mux;