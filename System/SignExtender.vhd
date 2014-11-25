----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:14:37 11/25/2013 
-- Design Name: 
-- Module Name:    SignExtender - Behavioral 
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

--·ûºÅÀ©Õ¹
entity SignExtender is
   Port ( 
		in10to0	: in	std_logic_vector(10 downto 0);
      in7to0	: in	std_logic_vector(7 downto 0);
      in4to0	: in	std_logic_vector(4 downto 0);
      in3to0	: in	std_logic_vector(3 downto 0);
      out10to0	: out	std_logic_vector(15 downto 0);
      out7to0	: out	std_logic_vector(15 downto 0);
      out4to0	: out	std_logic_vector(15 downto 0);
      out3to0	: out	std_logic_vector(15 downto 0)
	);
end SignExtender;

architecture Behavioral of SignExtender is

begin

	process(in10to0,in7to0,in4to0,in3to0)
	begin
		if in10to0(10)='1' then
			out10to0<="11111"&in10to0(10 downto 0);
		else
			out10to0<="00000"&in10to0(10 downto 0);
		end if;
		if in7to0(7)='1' then
			out7to0<="11111111"&in7to0(7 downto 0);
		else
			out7to0<="00000000"&in7to0(7 downto 0);
		end if;
		if in4to0(4)='1' then
			out4to0<="11111111111"&in4to0(4 downto 0);
		else
			out4to0<="00000000000"&in4to0(4 downto 0);
		end if;
		if in3to0(3)='1' then
			out3to0<="111111111111"&in3to0(3 downto 0);
		else
			out3to0<="000000000000"&in3to0(3 downto 0);
		end if;
	end process;
end Behavioral;

