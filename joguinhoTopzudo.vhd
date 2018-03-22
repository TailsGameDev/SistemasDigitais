library IEEE;
use IEEE.Std_Logic_1164.all;

entity joguinhoTopzudo is
port (
 CLOCK_50: in std_logic;
	   SW: in std_logic_vector (9 downto 0);
	  KEY: in std_logic_vector (3 downto 0);
	HEX5: out std_logic_vector (6 downto 0);
    HEX4: out std_logic_vector (6 downto 0);
    HEX3: out std_logic_vector (6 downto 0);
    HEX2: out std_logic_vector (6 downto 0);
    HEX1: out std_logic_vector (6 downto 0);
    HEX0: out std_logic_vector (6 downto 0);
    LEDR: out std_logic_vector (9 downto 0)
);
end joguinhoTopzudo;

architecture joguinhoTopArch of joguinhoTopzudo is

--signals

signal       vE1:    std_logic;
signal       vE2:    std_logic;
signal       vE3:    std_logic;
signal  	    vE54:    std_logic;
signal  	    vE32:    std_logic;
signal  	    vE10:    std_logic;
signal        C:    std_logic;
signal        M:    std_logic;
signal       CG:    std_logic;
signal     BTN0:    std_logic;
signal     BTN1:    std_logic;
signal     BTN2:    std_logic;
signal     BTN3:    std_logic;

--components

component DATAPATH is 
port (    E1: in std_logic;
	      E2: in std_logic;
	      E3: in std_logic;
		  E54: in std_logic;
		  E32: in std_logic;
		  E10: in std_logic;
	       C: in std_logic;
	CLOCK_50: in std_logic;
	  	  SW: in std_logic_vector (9 downto 0);
	   HEX5: out std_logic_vector (6 downto 0);
       HEX4: out std_logic_vector (6 downto 0);
       HEX3: out std_logic_vector (6 downto 0);
       HEX2: out std_logic_vector (6 downto 0);
       HEX1: out std_logic_vector (6 downto 0);
       HEX0: out std_logic_vector (6 downto 0);
       LEDR: out std_logic_vector (9 downto 0);
          M: out std_logic
);
end component;

component FSM is
port (
		CLOCK_50: in std_logic;
		M: in std_logic;
		BTN0: std_logic;
		BTN1: std_logic;
		E1: out std_logic;
		E2: out std_logic;
		E3: out std_logic;
	  E54: out std_logic;
	  E32: out std_logic;
	  E10: out std_logic;
		C: out std_logic
	);
end component;

component ButtonSync is
	port
	(
		KEY0, KEY1, KEY2, KEY3, CLK: in std_logic;
		BTN0, BTN1, BTN2, BTN3: out std_logic
	);
end component;
begin

callbtns: ButtonSync port map(KEY(0), KEY(1), KEY(2), KEY(3), CLOCK_50, BTN0, BTN1, BTN2, BTN3 );
calldtp: DATAPATH port map(vE1, vE2, vE3, vE54, vE32, vE10, C, CLOCK_50, SW, HEX5, HEX4,
 HEX3, HEX2, HEX1, HEX0, LEDR, M);
callfsm: FSM port map(CLOCK_50, M, BTN0, BTN1, vE1, vE2, vE3, vE54, vE32, vE10, C);

end joguinhoTopArch;