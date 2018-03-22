library IEEE;
use IEEE.Std_Logic_1164.all;

entity Calculadora8 is
port (
SW: in std_logic_vector(9 downto 0);
KEY: in std_logic_vector(1 downto 0);
CLOCK_50: in std_logic;
LEDR: out std_logic_vector(9 downto 0);
HEX0: out std_logic_vector(6 downto 0);
HEX1: out std_logic_vector(6 downto 0)
);
end Calculadora8;

architecture Calculadora8Arch of Calculadora8 is

signal SA: std_logic_vector(7 downto 0);
signal SS: std_logic_vector(7 downto 0);
signal SD: std_logic_vector(7 downto 0);

component RD8B is
port (
	CLK: in std_logic;
	D: in std_logic_vector(7 downto 0);
	Q: out std_logic_vector(7 downto 0);
	EN: in std_logic
);
end component;

component SomaSub is
port (
	  A: in std_logic_vector(7 downto 0);
	  X: in std_logic_vector(7 downto 0);
	  C: in std_logic_vector(1 downto 0);
	  S: out std_logic_vector(7 downto 0);
	  Overflow: out std_logic
);
end component;

component C2to7seg is
port (
		 SDinside: in std_logic_vector(7 downto 0);
	--SDinside para representar um signal no topo e aki um vetor utilizavel SD q era um signal
		 LEDR: out std_logic;
		 HEX0: out std_logic_vector(6 downto 0);
		 HEX1: out std_logic_vector(6 downto 0)
);
end component;

begin
RD8B1: RD8B port map (CLOCK_50, SW (7 downto 0), SA, KEY(0));
SOMASUBE: SomaSub port map (SA, SW (7 downto 0), SW (9 downto 8), SS, LEDR (1));
RD8B2: RD8B port map (CLOCK_50, SS, SD, KEY(1));
Decod: C2to7seg port map (SD, LEDR (0), HEX0, HEX1);

end Calculadora8Arch;