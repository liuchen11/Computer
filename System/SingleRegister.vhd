----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:16:06 11/25/2013 
-- Design Name: 
-- Module Name:    Register - Behavioral 
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

--特殊单个寄存器
entity Singleregister is
	Port (
		input	: in	std_logic_vector(15 downto 0);
      output: out	std_logic_vector(15 downto 0);
      en		: in	std_logic;
		r_en	: in	std_logic;
		w_en	: in	std_logic;
      clk	: in	std_logic;
      rst	: in	std_logic
	);
end Singleregister;

architecture Behavioral of Singleregister is

signal value:std_logic_vector(15 downto 0):="0000000000000000";

begin
	process(clk,rst)
	begin
		if en='0' then
			if rst='0' then
				value<="0000000000000000";
				output<="0000000000000000";
			elsif falling_edge(clk) then 		--下降沿触发!!
				--if w_en='0' then
					--value<=input;
				--end if;
				--if r_en='0' then
					--output<=value;
				--end if;
				if w_en='0' then
					if r_en='0' then
						value<=input;
						output<=input;
					else
						value<=input;
					end if;
				elsif r_en='0' then
					output<=value;
				end if;
			end if;
		end if;
	end process;

end Behavioral;