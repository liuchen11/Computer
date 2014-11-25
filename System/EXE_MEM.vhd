----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:44:33 11/25/2013 
-- Design Name: 
-- Module Name:    EXE_MEM - Behavioral 
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

--EXE-MEMËø´æÆ÷
entity EXE_MEM is
   Port ( 
		wb_in		: in	std_logic_vector(3 downto 0);
      mem_in	: in	std_logic_vector(11 downto 0);
      adder_in	: in	std_logic_vector(15 downto 0);
      PC_in		: in	std_logic_vector(15 downto 0);
      T_in		: in	std_logic_vector(15 downto 0);
      ALU_in	: in	std_logic_vector(15 downto 0);
      data1_in	: in	std_logic_vector(15 downto 0);
      data2_in	: in	std_logic_vector(15 downto 0);
      RA_in		: in	std_logic_vector(15 downto 0);
      IH_in		: in	std_logic_vector(15 downto 0);
      r10_8_in	: in	std_logic_vector(2 downto 0);
      r7_5_in	: in	std_logic_vector(2 downto 0);
      r4_2_in	: in	std_logic_vector(2 downto 0);
      wb_out	: out	std_logic_vector(3 downto 0);
      mem_out	: out	std_logic_vector(11 downto 0);
      adder_out: out	std_logic_vector(15 downto 0);
      PC_out	: out	std_logic_vector(15 downto 0);
      T_out		: out	std_logic_vector(15 downto 0);
      ALU_out	: out	std_logic_vector(15 downto 0);
      data1_out: out	std_logic_vector(15 downto 0);
      data2_out: out	std_logic_vector(15 downto 0);
      RA_out	: out	std_logic_vector(15 downto 0);
      IH_out	: out	std_logic_vector(15 downto 0);
      r10_8_out: out	std_logic_vector(2 downto 0);
      r7_5_out	: out	std_logic_vector(2 downto 0);
      r4_2_out	: out	std_logic_vector(2 downto 0);
      en			: in	std_logic;
      clk		: in	std_logic;
      rst		: in	std_logic
	);
end EXE_MEM;

architecture Behavioral of EXE_MEM is
signal old_T	:	std_logic_vector(15 downto 0):="0000000000000000";

begin
process(clk,rst)
begin
	if rst='0' then
		wb_out	<="0000";
		mem_out	<="000000000000";
		adder_out<="0000000000000000";
		PC_out	<="0000000000000000";
		T_out		<="0000000000000000";
		ALU_out	<="0000000000000000";
		data1_out<="0000000000000000";
		data2_out<="0000000000000000";
		RA_out	<="0000000000000000";
		IH_out	<="0000000000000000";
		r10_8_out<="000";
		r7_5_out	<="000";
		r4_2_out	<="000";
	elsif rising_edge(clk) then
		if en='0' then
			wb_out<=wb_in;
			mem_out<=mem_in;
			adder_out<=adder_in;
			PC_out<=PC_in;
			old_T<=T_in;
			T_out<=old_T;
			ALU_out<=ALU_in;
			data1_out<=data1_in;
			data2_out<=data2_in;
			RA_out<=RA_in;
			IH_out<=IH_in;
			r10_8_out<=r10_8_in;
			r7_5_out<=r7_5_in;
			r4_2_out<=r4_2_in;
		end if;
	end if;
end process;

end Behavioral;

