----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:51:53 11/25/2013 
-- Design Name: 
-- Module Name:    MEM_WB - Behavioral 
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

--MEM-WBËø´æÆ÷
entity MEM_WB is
   Port ( 
		wb_in		: in	std_logic_vector(3 downto 0);
      --PC_in		: in	std_logic_vector(15 downto 0);
      --mem_in	: in	std_logic_vector(15 downto 0);
      --ALU_in	: in	std_logic_vector(15 downto 0);
      --IH_in		: in	std_logic_vector(15 downto 0);
      --r10_8_in	: in	std_logic_vector(2 downto 0);
      --r7_5_in	: in	std_logic_vector(2 downto 0);
      --r4_2_in	: in	std_logic_vector(2 downto 0);
		data_in	: in	std_logic_vector(15 downto 0);
		addr_in	: in	std_logic_vector(2 downto 0);
      wb_out	: out	std_logic_vector(3 downto 0);
      --PC_out 	: out	std_logic_vector(15 downto 0);
      --mem_out	: out	std_logic_vector(15 downto 0);
      --ALU_out	: out	std_logic_vector(15 downto 0);
      --IH_out	: out	std_logic_vector(15 downto 0);
      --r10_8_out: out	std_logic_vector(2 downto 0);
      --r7_5_out	: out	std_logic_vector(2 downto 0);
      --r4_2_out	: out	std_logic_vector(2 downto 0);
		data_out	: out	std_logic_vector(15 downto 0);
		addr_out	: out	std_logic_vector(2 downto 0);
      en			: in	std_logic;
      clk		: in	std_logic;
      rst		: in	std_logic
	);
end MEM_WB;

architecture Behavioral of MEM_WB is

begin
process(clk,rst)
begin
	if rst='0' then
		wb_out	<="0000";
		--PC_out	<="0000000000000000";
		--mem_out	<="0000000000000000";
		--ALU_out	<="0000000000000000";
		--IH_out	<="0000000000000000";
		--r10_8_out<="000";
		--r7_5_out	<="000";
		--r4_2_out	<="000";
		data_out	<="0000000000000000";
		addr_out	<="000";
	elsif rising_edge(clk) then
		if en='0' then
			wb_out	<=wb_in;
			--PC_out	<=PC_in;
			--mem_out	<=mem_in;
			--ALU_out	<=ALU_in;
			--IH_out	<=IH_in;
			--r10_8_out<=r10_8_in;
			--r7_5_out	<=r7_5_in;
			--r4_2_out	<=r4_2_in;
			data_out<=data_in;
			addr_out<=addr_in;
		end if;
	end if;
end process;

end Behavioral;

