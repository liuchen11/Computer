----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:43 12/02/2013 
-- Design Name: 
-- Module Name:    EXE_bubble - Behavioral 
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

entity EXE_bubble is
   Port (
		mem_in	: in	std_logic_vector(11 downto 0);
      wb_in		: in	std_logic_vector(3 downto 0);
      mem_out	: out	std_logic_vector(11 downto 0);
      wb_out	: out	std_logic_vector(3 downto 0);
      bubble	: in	std_logic
	);
end EXE_bubble;

architecture Behavioral of EXE_bubble is

begin
process(mem_in,wb_in,bubble)
begin
	if bubble='0' then
		mem_out	<=mem_in;
		wb_out	<=wb_in;
	else
		mem_out	<="111000000000";
		wb_out	<="1111";
	end if;
end process;

end Behavioral;

