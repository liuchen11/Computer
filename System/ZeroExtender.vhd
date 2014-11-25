----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:17:25 11/25/2013 
-- Design Name: 
-- Module Name:    ZeroExtender - Behavioral 
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

--¡„¿©’π
entity ZeroExtender is
   Port ( 
		in7to0	: in	std_logic_vector(7 downto 0);
      in4to2	: in	std_logic_vector(4 downto 2);
      out7to0	: out	std_logic_vector(15 downto 0);
      out4to2	: out	std_logic_vector(15 downto 0)
	);
end ZeroExtender;

architecture Behavioral of ZeroExtender is

begin
	out7to0<="00000000"&in7to0(7 downto 0);
	out4to2<="0000000000000"&in4to2(4 downto 2);

end Behavioral;

