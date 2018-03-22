library IEEE;
use IEEE.Std_Logic_1164.all;

entity somador is
port ( 	SW : IN STD_LOGIC_VECTOR(9 downto 0);
		LEDR : OUT STD_LOGIC_VECTOR(9 downto 0)
	);
end somador;

architecture topo_somador of somador is
signal F1: std_logic;
component halfadder
port (	A: in std_logic;
		B: in std_logic;
		S: out std_logic;
		Cout: out std_logic
	);
end component;

component fulladder
port (	A: in std_logic;
		B: in std_logic;
		Cin: in std_logic;
		S: out std_logic;
		Cout: out std_logic
			
	);
end component;

begin

L0: halfadder port map (SW(0), SW(1), LEDR(0), F1);
L1: fulladder port map (SW(2), SW(3), F1, LEDR(1), LEDR(2));
end topo_somador;