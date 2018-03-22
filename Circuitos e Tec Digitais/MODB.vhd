library IEEE;
use IEEE.Std_Logic_1164.all;

entity MODB is
port (B0: in std_logic;
	  C0,C1: in std_logic;
	  B: out std_logic
	  );
end MODB;

architecture MODBArch of MODB is

begin
 B <= (C1 and (not B0)) or ((not C0) and B0);
end MODBArch;

