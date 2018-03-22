library IEEE;
use IEEE.Std_Logic_1164.all;

entity ClockConvert is
port (
	CLOCK_50: in std_logic;
	      Nv: in std_logic_vector(1 downto 0);
   NewClock: out std_logic
);
end ClockConvert;

architecture ClockConvertArch of ClockConvert is

component Clock01 is

	port (
	CLOCK_50: in std_logic;
	saida: out std_logic );
end component;

	component Clock25 is

	port (
	CLOCK_50: in std_logic;
	saida: out std_logic );
end component;

	component Clock33 is

	port (
	CLOCK_50: in std_logic;
	saida: out std_logic );
end component;

	component Clock05 is

	port (
	CLOCK_50: in std_logic;
	saida: out std_logic );
end component;

component mux4e1b is 
port(
	  	    entrada: in std_logic;
         entrada2: in std_logic;
         entrada3: in std_logic;
         entrada4: in std_logic;
            sinal: in std_logic_vector(1 downto 0);
           saida: out std_logic
        );
end component;

signal       C01:    std_logic;
signal       C25:    std_logic;
signal       C33:    std_logic;
signal       C05:    std_logic;

begin

convert01: Clock01 port map (CLOCK_50, C01);
convert25: Clock01 port map (CLOCK_50, C25);
convert33: Clock01 port map (CLOCK_50, C33);
convert05: Clock01 port map (CLOCK_50, C05);
 decision: mux4e1b port map (C01, C25, C33, C05, Nv, NewClock);

end ClockConvertArch;