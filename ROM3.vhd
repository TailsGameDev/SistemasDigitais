library ieee;
use ieee.std_logic_1164.all;


entity ROM3 is
  port ( 
	address : in std_logic_vector(3 downto 0);
	data : out std_logic_vector(7 downto 0) );
end entity ROM3;



architecture behavioral of ROM3 is

type mem is array (0 to 9) of std_logic_vector(7 downto 0);

constant my_rom : mem := (
	
	0 => "00110000", -- 30
	1 => "10111011", -- BB
        2 => "01010100", -- 54
	3 => "00011000", -- 18
	4 => "10000101", -- 85
	5 => "01111111", -- 7F
	6 => "11101110", -- EE
	7 => "11000000", -- C0
	8 => "10100100", -- A4
	9 => "01111010");-- 7A

begin
   process (address)

	begin
     case address is
       
		when "0000" => data <= my_rom(0);

		when "0001" => data <= my_rom(1);

		when "0010" => data <= my_rom(2);

		when "0011" => data <= my_rom(3);

		when "0100" => data <= my_rom(4);

		when "0101" => data <= my_rom(5);

		when "0110" => data <= my_rom(6);

		when "0111" => data <= my_rom(7);

		when "1000" => data <= my_rom(8);

		when "1001" => data <= my_rom(9);

		when others => data <= "00000000";

	end case;

end process;

end architecture behavioral;
