----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:35 11/24/2013 
-- Design Name: 
-- Module Name:    Adder - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--¼Ó·¨Æ÷
entity Adder is
   Port (
		inputA	: in	std_logic_vector(15 downto 0);
      inputB	: in	std_logic_vector(15 downto 0);
      output	: out	std_logic_vector(15 downto 0);
		en			: in	std_logic
	);
end Adder;

architecture Behavioral of Adder is

begin

	process(inputA,inputB,en)
	begin
		if en='0' then
			output<=inputA+inputB;
		end if;
	end process;
	
end Behavioral;

