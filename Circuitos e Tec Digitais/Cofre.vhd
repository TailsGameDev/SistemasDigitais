library ieee;
use ieee.std_logic_1164.all;

entity Cofre is
	port (KEY: in std_logic_vector(3 downto 0);
	CLOCK_50: in std_logic;
	LEDR: out std_logic_vector (9 downto 0));
end Cofre;

architecture CofreArch of Cofre is
	type STATES is (inicio, ES1, C1, ES2, C2, aberto, fechado);
	signal EAtual, PEstado: STATES;

begin
	process(CLOCK_50, KEY(3))
	begin
		if (KEY(3) = '0') then
			EAtual <= inicio;
		elsif (CLOCK_50'event AND CLOCK_50 = '1') then
			EAtual <= PEstado;
		end if;
	end process;

	process(EAtual, KEY(2 downto 0))
	begin
		case EAtual is
			when inicio => LEDR(0) <= '0';
				if    (KEY(2 downto 0) = "011") then PEstado <= ES1;
				elsif (KEY(2 downto 0) = "111") then PEstado <= inicio;
				else                                 PEstado <= fechado;
				end if;
			
			when ES1 => LEDR(0) <= '0';
					if (KEY(2)='1') then PEstado <= C1;
					else             	 PEstado <= ES1;
					end if;
			
			when C1 => LEDR(0) <= '0';
				if    (KEY(2 downto 0) = "110") then  PEstado <= ES2;
				elsif (KEY(2 downto 0) = "111") then  PEstado <= C1; 
				else  				    			  PEstado <= fechado;
				end if;
			
			when ES2 => LEDR(0) <= '0';
				if (KEY(0)='1') then PEstado<=C2;
				else 				 PEstado<=ES2;
				end if;
			
			when C2 => LEDR(0) <= '0';
				if 	  (KEY(2 downto 0) = "101") then PEstado <= aberto;
				elsif (KEY(2 downto 0) = "111") then PEstado <= C2;
				else				   				 PEstado <= fechado;
				end if;

			when fechado => LEDR(0) <= '0';
			
			when aberto => LEDR(0) <= '1';
			
			end case;
		end process;
	end CofreArch;