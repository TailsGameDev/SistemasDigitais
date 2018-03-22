library IEEE;
use IEEE.Std_Logic_1164.all;

entity multiplicador is
port (
	  SW: in std_logic_vector(9 downto 0);
	  
	  
	  LEDR: out std_logic_vector(9 downto 0)
	  
	
	  );
end multiplicador;

architecture arc_multi of multiplicador is
begin
LEDR(0)<=SW(0) and SW(2);
LEDR(1)<=((not SW(1))and SW(0) and SW(3)) or (SW(0) and SW(3) and (not SW(2))) or (SW(1) and (not SW(3))and SW(2)) or (SW(1) and (not SW(0)) and SW(2));
LEDR(2)<=(SW(1) and SW(3) and (not SW(2))) or (SW(1) and (not SW(0))and SW(3));
LEDR(3)<=SW(1) and SW(0) and SW(3) and SW(2);
end arc_multi;