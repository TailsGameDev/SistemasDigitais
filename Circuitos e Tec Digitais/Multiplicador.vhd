library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
entity Multiplicador is
	port (KEY: in std_logic_vector(1 downto 0);
	CLOCK_50: in std_logic;
	LEDR: out std_logic_vector(7 downto 0);
	SW: in std_logic_vector(9 downto 0) );
end Multiplicador;

architecture MultiplicadorArch of Multiplicador is
	--signals?
	signal F: std_logic_vector (7 downto 0);
	signal S: std_logic_vector (7 downto 0);
	signal sbtn0: std_logic;
	signal sbtn1: std_logic;
	signal sbtn2: std_logic;
	signal sbtn3: std_logic;



component multiplexador is

port (
		 entrada: in std_logic_vector(7 downto 0);
         entrada2: in std_logic_vector(7 downto 0);
         entrada3: in std_logic_vector(7 downto 0);
         entrada4: in std_logic_vector(7 downto 0);
         sinal: in std_logic_vector(1 downto 0);
         saida: out std_logic_vector(7 downto 0)
        );
end component;

component registrador is

port (
	CLK: in std_logic;
	EN: in std_logic;
	RST: in std_logic;
	ENTRADA: in std_logic_vector(7 downto 0);
	SAIDA: out std_logic_vector(7 downto 0));
end component;

component ButtonSync is

port
	(
		-- Input ports
		key0	: in  std_logic;
		key1	: in  std_logic;
		key2	: in  std_logic;
		key3	: in  std_logic;	
		clk : in std_logic;
		-- Output ports
		btn0	: out std_logic;
		btn1	: out std_logic;
		btn2	: out std_logic;
		btn3	: out std_logic
	);
end component;

begin

mux: multiplexador port map (F + SW(7 downto 0),SW(7 downto 0),F(6 downto 0) & '0', '0' & F(7 downto 1), SW(9 downto 8), S(7 downto 0));
registrator: registrador port map (CLOCK_50, sbtn1, sbtn0, S(7 downto 0), F(7 downto 0));
boton: ButtonSync port map (KEY(0), KEY(1), '1','1', CLOCK_50, sbtn0, sbtn1, sbtn2, sbtn3);
display: LEDR <= F(7 downto 0);

end MultiplicadorArch;
