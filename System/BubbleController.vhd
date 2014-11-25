----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:58:10 11/25/2013 
-- Design Name: 
-- Module Name:    BubbleController - Behavioral 
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

--插入气泡控制器
entity BubbleController is
   Port (
		next_PC	: in	std_logic_vector(15 downto 0);
		order_PC	: in	std_logic_vector(15 downto 0);
		bubble	: out std_logic
	);
end BubbleController;

architecture Behavioral of BubbleController is
shared variable number:integer range 0 to 4:=0;

begin
process(next_PC,order_PC)
	begin
	if next_PC=order_PC then
		bubble<='0';				--不插气泡
	else
		bubble<='1';				--插上气泡
	end if;
end process;

end Behavioral;
