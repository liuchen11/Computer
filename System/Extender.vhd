----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:55:14 11/24/2013 
-- Design Name: 
-- Module Name:    Extender - Behavioral 
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

entity Extender is
    Port ( input10to0 : in  std_logic_vector(10 downto 0);
           input7to0 : in  std_logic_vector(7 downto 0);
           input4to2 : in  std_logic_vector(2 downto 0);
           input4to0 : in  std_logic_vector(4 downto 0);
           input3to0 : in  std_logic_vector(3 downto 0);
           output : out  std_logic_vector(15 downto 0);
           control : in  std_logic_vector(2 downto 0);
           sign : in  std_logic);
end Extender;

architecture Behavioral of Extender is

begin


end Behavioral;

