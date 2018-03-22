library IEEE;
use IEEE.Std_Logic_1164.all;

entity selecionaRom is
port (
		 ROM: in std_logic_vector (1 downto 0);
		   L: in std_logic_vector (3 downto 0);
      Lrom: out std_logic_vector (7 downto 0)
);
end selecionaRom;

architecture selecionaRomArch of selecionaRom is

signal       vrom0:    std_logic_vector (7 downto 0);
signal       vrom1:    std_logic_vector (7 downto 0);
signal       vrom2:    std_logic_vector (7 downto 0);
signal       vrom3:    std_logic_vector (7 downto 0);
signal       vLrom:    std_logic_vector (7 downto 0);
signal        vROM:    std_logic_vector (1 downto 0);
signal		 	 vL:    std_logic_vector (3 downto 0);

component ROM0 is
  port ( 
	address : in std_logic_vector(3 downto 0);
	data : out std_logic_vector(7 downto 0) );
end component;

component ROM1 is
  port ( 
	address : in std_logic_vector(3 downto 0);
	data : out std_logic_vector(7 downto 0) );
end component;

component ROM2 is
  port ( 
	address : in std_logic_vector(3 downto 0);
	data : out std_logic_vector(7 downto 0) );
end component;

component ROM3 is
  port ( 
	address : in std_logic_vector(3 downto 0);
	data : out std_logic_vector(7 downto 0) );
end component;

component multiplexador4 is 
port(
	  	    entrada: in std_logic_vector(7 downto 0);
         entrada2: in std_logic_vector(7 downto 0);
         entrada3: in std_logic_vector(7 downto 0);
         entrada4: in std_logic_vector(7 downto 0);
            sinal: in std_logic_vector(1 downto 0);
           saida: out std_logic_vector(7 downto 0)
        );
end component;

begin

Lrom <= vLrom;
vROM <= ROM;
vL <= L;

lerom0: ROM0 port map (vL, vrom0);
lerom1: ROM1 port map (vL, vrom1);
lerom2: ROM2 port map (vL, vrom2);
lerom3: ROM3 port map (vL, vrom3);
selmem: multiplexador4 port map (vrom0(7 downto 0), vrom1(7 downto 0), vrom2(7 downto 0),
 vrom3(7 downto 0), vROM (1 downto 0), vLrom(7 downto 0));

end selecionaRomArch;