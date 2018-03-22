library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Controle is port (
	c: in std_logic;
	Tm: in std_logic;
	clock: in std_logic;
	reset: in std_logic;
	Tc: out std_logic;
	Tw: out std_logic;
	d: out std_logic);
end Controle;

architecture ControleArch of Controle is
	type STATES is(inicio, espmoeda, espsoltar, soma, entrega);
	signal EAtual, PEstado: STATES;
begin

	process(clock, reset)
	begin
		if(reset = '0')then
			Tc<='1';
			EAtual <= inicio;
		elsif (clock'event AND clock = '1') then
			EAtual<=PEstado;
			Tc<='0';
		end if;
	end process;
	
	process(EAtual)
	begin
		case EAtual is
			when inicio =>
				d<='0';
				Tw<='0';
				PEstado<=espmoeda;
			
			when espmoeda =>
				if ((c='1') and (Tm='1')) then
					PEstado<=espmoeda;
				elsif (c='0') then
					PEstado<=espsoltar;
				else
					PEstado <=entrega;
				end if;
				d<='0';
				Tw<='0';
			
			when espsoltar =>
				if(c='1') then
					PEstado<=soma;
				else
					PEstado<=espsoltar;
				end if;
				d<='0';
				Tw<='0';
				
			when soma =>
				Tw<='1';
				PEstado<=espmoeda;
				d<='0';
				
			when entrega =>
				d<='1';
				PEstado <= entrega;
				Tw<='0';
			end case;
		end process;
end ControleArch;