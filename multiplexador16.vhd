library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexador16 is 
port(
		   entrada1: in std_logic_vector(9 downto 0);
         entrada2: in std_logic_vector(9 downto 0);
         entrada3: in std_logic_vector(9 downto 0);
         entrada4: in std_logic_vector(9 downto 0);
         entrada5: in std_logic_vector(9 downto 0);
         entrada6: in std_logic_vector(9 downto 0);
         entrada7: in std_logic_vector(9 downto 0);
         entrada8: in std_logic_vector(9 downto 0);
         entrada9: in std_logic_vector(9 downto 0);
        entrada10: in std_logic_vector(9 downto 0);
        entrada11: in std_logic_vector(9 downto 0);
        entrada12: in std_logic_vector(9 downto 0);
        entrada13: in std_logic_vector(9 downto 0);
        entrada14: in std_logic_vector(9 downto 0);
        entrada15: in std_logic_vector(9 downto 0);
        entrada16: in std_logic_vector(9 downto 0);
        	sinal: in std_logic_vector(3 downto 0);
           saida: out std_logic_vector(9 downto 0)
        );
end multiplexador16;

architecture mux of multiplexador16 is 
begin

saida <= entrada1 when sinal = "0000" else
		 entrada2 when sinal = "0001" else
		 entrada3 when sinal = "0010" else
		 entrada4 when sinal = "0011" else
		 entrada5 when sinal = "0100" else
		 entrada6 when sinal = "0101" else
		 entrada7 when sinal = "0110" else
		 entrada8 when sinal = "0111" else
		 entrada9 when sinal = "1000" else
		entrada10 when sinal = "1001" else
		entrada11 when sinal = "1010" else
		entrada12 when sinal = "1011" else
		entrada13 when sinal = "1100" else
		entrada14 when sinal = "1101" else
		entrada15 when sinal = "1110" else
		entrada16;
		
		
	
end mux;
