library IEEE;
use IEEE.std_logic_1164.all;

entity C2to7seg is
	port(SW: in std_logic_vector(3 downto 0);
		 LEDR: out std_logic_vector(9 downto 0);
		 HEX0: out std_logic_vector(6 downto 0)
		 );
end C2to7seg;

architecture topo of C2to7seg is
	
	signal sComp2: std_logic_vector(3 downto 0);
	signal sMux: std_logic_vector(3 downto 0);
	
	component complemento2 is
	port(entrada: in std_logic_vector(3 downto 0);
		 saida: out std_logic_vector(3 downto 0)
		 );
end component;

	component decodificador is
		port(entrada: in std_logic_vector(3 downto 0);
         display: out std_logic_vector(6 downto 0)       
    );
end component;

	component multiplexador is
		port(entrada: in std_logic_vector(3 downto 0);
         entrada2: in std_logic_vector(3 downto 0);
         sinal: in std_logic;
         saida: out std_logic_vector(3 downto 0)
        );
end component;

begin
		FC: complemento2 port map(SW, sComp2);
		FM: multiplexador port map(SW, sComp2, SW(3), sMux);
		FD: decodificador port map(sMux, HEX0);
end topo;