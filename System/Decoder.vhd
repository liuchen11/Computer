----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:45:56 11/25/2013 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

--生成控制信号
entity Decoder is
   Port ( 
		input	: in	std_logic_vector(15 downto 0);
      exe	: out	std_logic_vector(10 downto 0);
      mem	: out	std_logic_vector(11 downto 0);
      wb		: out	std_logic_vector(3 downto 0)
	);
end Decoder;

architecture Behavioral of Decoder is

begin
	process(input)
	begin
	case input(15 downto 11) is
		when"00001"=>		--NOP
					exe<="00000000000";	mem<="111000000000";	wb<="1111";
		when"00010"=>		--B
					exe<="01000000000";	mem<="111000100000";	wb<="1111";
		when"00100"=>		--BEQZ
					exe<="00000000000";	mem<="111001100000";	wb<="1111";
		when"00101"=>		--BNEZ
					exe<="00000000000";	mem<="111010100000";	wb<="1111";
		when"00110"=>		--SLL/SRA
			case input(1 downto 0) is
				when"00"=>	--SLL
					exe<="00100000110";	mem<="111000000000";	wb<="1110";
				when"11"=>	--SRA
					exe<="00100001000";	mem<="111000000000";	wb<="1110";
				when others=> --nothing
					exe<="00000000000";	mem<="111000000000";	wb<="1111";
			end case;
		when"01000"=>		--ADDIU3
					exe<="00000010000";	mem<="111000000001";	wb<="1110";
		when"01001"=>		--ADDIU
					exe<="00000110000";	mem<="111000000000";	wb<="1110";--exe(6 downto 4)=000=>011
		when"01100"=>		--ADDSP BTEQZ MTSP
			case input(10 downto 8) is
				when"000"=>	--BTEQZ
					exe<="00000000000";	mem<="111011100000";	wb<="1111";
				when"011"=>	--ADDSP
					exe<="00010110000";	mem<="111000000000";	wb<="1101";
				when"100"=>	--MTSP
					exe<="00000001011";	mem<="111000000000";	wb<="1101";
				when others=> --nothing
					exe<="00000000000";	mem<="111000000000";	wb<="1111";
			end case;
		when"01101"=>		--LI
					exe<="00001001011";	mem<="111000000000";	wb<="1110";
		when"01110"=>		--CMPI
					exe<="00000110001";	mem<="111000000000";	wb<="1111";
		when"10010"=>		--LW_SP
					exe<="00010110000";	mem<="010000001000";	wb<="1110";
		when"10011"=>		--LW
					exe<="00000100000";	mem<="010000001001";	wb<="1110";
		when"11010"=>		--SW_SP
					exe<="00010110000";	mem<="001000000000";	wb<="1111";
		when"11011"=>		--SW
					exe<="00000100000";	mem<="001100000000";	wb<="1111";
		when"11100"=>		--ADDU SUBU
			case input(1 downto 0) is
				when"01"=>	--ADDU
					exe<="00000000000";	mem<="111000000010";	wb<="1110";
				when"11"=>	--SUBU
					exe<="00000000001";	mem<="111000000010";	wb<="1110";
				when others=> --nothing
					exe<="00000000000";	mem<="111000000000";	wb<="1111";
			end case;
		when"11101"=>		--AND CMP JR MFPC OR JALR NOT SRAV NEG
			case input(4 downto 0) is
				when"00000"=>--JR MFPC JALR
					case input(7 downto 5) is
						when"000"=>	--JR
							exe<="00000000000";	mem<="111000110000";	wb<="1111";
						when"010"=>	--MFPC
							exe<="00000000000";	mem<="111000001100";	wb<="1110";
						when"110"=>	--JALR
							exe<="00000000000";	mem<="111000111100";	wb<="0111";
						when others=>--nothing
							exe<="00000000000";	mem<="111000000000";	wb<="1111";
					end case;
				when"00111"=>--SRAV
					exe<="00000001000";	mem<="111000000001";	wb<="1110";
				when"01010"=>--CMP
					exe<="00000000001";	mem<="111000000000";	wb<="1111";
				when"01011"=>--NEG
					exe<="00110000001";	mem<="111000000000";	wb<="1110";
				when"01100"=>--AND
					exe<="00000000010";	mem<="111000000000";	wb<="1110";
				when"01101"=>--OR
					exe<="00000000011";	mem<="111000000000";	wb<="1110";
				when"01111"=>--NOT
					exe<="00000000101";	mem<="111000000000";	wb<="1110";
				when others=>--nothing
					exe<="00000000000";	mem<="111000000000";	wb<="1111";
			end case;
		when"11110"=>		--MFIH MTIH
			case input(4 downto 0) is
				when"00000"=>--MFIH
					exe<="00000000000";	mem<="111000000100";	wb<="1110";
				when"00001"=>--MTIH
					exe<="00000001010";	mem<="111000000000";	wb<="1011";
				when others=>--nothing
					exe<="00000000000";	mem<="111000000000";	wb<="1111";
			end case;
		when others=>		--nothing
			exe<="00000000000";	mem<="111000000000";	wb<="1111";
	end case;
	end process;

end Behavioral;