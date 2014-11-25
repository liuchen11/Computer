----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:55:26 11/29/2013 
-- Design Name: 
-- Module Name:    Jumper - Behavioral 
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

entity Jumper is
   Port ( 
		tojump_ins 	: in	std_logic_vector(15 downto 0);
      order_ins 	: in	std_logic_vector(15 downto 0);
      return_ins 	: in	std_logic_vector(15 downto 0);
      data 			: in	std_logic_vector(15 downto 0);
      T_flag 		: in	std_logic_vector(15 downto 0);
		control		: in	std_logic_vector(3 downto 0);
      next_ins 	: out	std_logic_vector(15 downto 0)
	);
end Jumper;

architecture Behavioral of Jumper is

begin
process(tojump_ins,order_ins,return_ins,data,T_flag,control)
begin
	case control(3 downto 2) is
		when"00"=>
			case control(1 downto 0) is
				when"00"=>next_ins<=order_ins;
				when"01"=>next_ins<=return_ins;
				when"10"=>next_ins<=tojump_ins;
				when others=>next_ins<=data;
			end case;
		when"01"=>
			if data="0000000000000000" then
				next_ins<=tojump_ins;
			else
				next_ins<=order_ins;
			end if;
		when"10"=>
			if data="0000000000000000" then
				next_ins<=order_ins;
			else
				next_ins<=tojump_ins;
			end if;
		when others=>
			if T_flag="0000000000000000" then
				next_ins<=tojump_ins;
			else
				next_ins<=order_ins;
			end if;
	end case;
end process;

end Behavioral;

