----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:01:13 11/25/2013 
-- Design Name: 
-- Module Name:    IF_ID - Behavioral 
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

--IF-IDËø´æÆ÷
entity IF_ID is
   Port ( 
		PC_in		: in	std_logic_vector(15 downto 0);
      ins_in	: in	std_logic_vector(15 downto 0);
      PC_out	: out	std_logic_vector(15 downto 0);
      ins_out	: out	std_logic_vector(15 downto 0):="0000000000000000";
      en			: in	std_logic;
      clk		: in	std_logic;
      rst		: in	std_logic
	);
end IF_ID;

architecture Behavioral of IF_ID is

begin
process(clk,rst)
begin
	if rst='0' then
		PC_out<="0000000000000000";
		ins_out<="0000000000000000";
	elsif rising_edge(clk) then
		if en='0' then
			PC_out<=PC_in;
			ins_out<=ins_in;
		else
			PC_out<=PC_in;
			ins_out<="0000100000000000";
		end if;
	end if;
end process;

end Behavioral;

