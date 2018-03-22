library IEEE;
use IEEE.Std_Logic_1164.all;

entity SomaSub is
port (A: in std_logic_vector(3 downto 0);
	  X: in std_logic_vector(3 downto 0);
	  C: in std_logic_vector(1 downto 0);
	  S: out std_logic_vector(3 downto 0);
	  Overflow: out std_logic
	  );
end SomaSub;

architecture SomaSubArch of SomaSub is

signal B: std_logic_vector(3 downto 0);
signal J: std_logic_vector(3 downto 0);

component fulladder is
port (	A: in std_logic;
		B: in std_logic;
		Cin: in std_logic;
		S: out std_logic;
		Cout: out std_logic
);
end component;

component MODB is
port(B0: in std_logic;
	  C0,C1: in std_logic;
	  B: out std_logic
	);
end component;

begin
MOD1: MODB port map (X(0), C(0), C(1), B(0));
FA1: fulladder port map (A(0), B(0),C(0), S(0), J(0));
MOD2: MODB port map (X(1), C(0), C(1), B(1));
FA2: fulladder port map (A(1), B(1),J(0), S(1), J(1));
MOD3: MODB port map (X(2), C(0), C(1), B(2));
FA3: fulladder port map (A(2), B(2), J(1), S(2), J(2));
MOD4: MODB port map (X(3), C(0), C(1), B(3));
FA4: fulladder port map (A(3), B(3), J(2), S(3), J(3));
Overflow <= J(2) xor J(3);
end SomaSubArch;