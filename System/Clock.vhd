----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:41 11/27/2013 
-- Design Name: 
-- Module Name:    Clock - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clock is
   Port ( 
		clk_in : in  std_logic;
      clk_out : out  std_logic
	);
end Clock;

architecture Behavioral of Clock is
signal value:std_logic:='0';

begin
process (clk_in)
variable frac:integer range 0 to 5:=0;
begin
	if rising_edge(clk_in) then
		if frac=5 then
			value<=not value;
			clk_out<=not value;
			frac:=0;
		else
			frac:=frac+1;
		end if;
	end if;
end process;

end Behavioral;

