library IEEE;
use IEEE.Std_Logic_1164.all;

entity fulladder is
port (	A: in std_logic;
		B: in std_logic;
		Cin: in std_logic;
		S: out std_logic;
		Cout: out std_logic
			
	);
end fulladder;

architecture cir_fa of fulladder is
	signal D, E, F: std_logic;
begin
S <= D xor Cin;
Cout <= E or F;
D<= A xor B;
E<= Cin and D;
F<=A and B;
end cir_fa;