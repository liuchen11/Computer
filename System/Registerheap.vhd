----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:38:48 11/24/2013 
-- Design Name: 
-- Module Name:    RegisterHeap - Behavioral 
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

--¼Ä´æÆ÷¶Ñ
entity RegisterHeap is
   Port(
		readreg1	: in	std_logic_vector(2 downto 0);
      readreg2	: in	std_logic_vector(2 downto 0);
      writereg	: in	std_logic_vector(2 downto 0);
      writedata: in	std_logic_vector(15 downto 0);
      dataout1	: out	std_logic_vector(15 downto 0);
      dataout2	: out	std_logic_vector(15 downto 0);
		en			: in	std_logic;
		en_write	: in	std_logic;
		en_read	: in	std_logic;
      clk		: in	std_logic;
      rst		: in	std_logic
	);
end RegisterHeap;

architecture Behavioral of RegisterHeap is
signal write_data:std_logic_vector(15 downto 0):="0000000000000000";
type RegisterType is array(0 to 7) of std_logic_vector(15 downto 0);
signal registers:RegisterType;
begin

process(clk,rst)
begin
	if en='0' then
		if rst='0' then
			for i in 0 to 7 loop
				registers(i)<="0000000000000000";
			end loop;
		elsif falling_edge(clk) then
			--if en_write='0' then
				--registers(conv_integer(writereg))<=writedata;
			--end if;
			--if en_read='0' then
				--dataout1<=registers(conv_integer(readreg1));
				--dataout2<=registers(conv_integer(readreg2));
			--end if;
			if en_write='0' then
				registers(conv_integer(writereg))<=writedata;
				if en_read='0' then
					if readreg1=writereg then
						dataout1<=writedata;
					else
						dataout1<=registers(conv_integer(readreg1));
					end if;
					if readreg2=writereg then
						dataout2<=writedata;
					else
						dataout2<=registers(conv_integer(readreg2));
					end if;
				end if;
			elsif en_read='0' then
				dataout1<=registers(conv_integer(readreg1));
				dataout2<=registers(conv_integer(readreg2));
			end if;
		end if;
	end if;
end process;

end Behavioral;