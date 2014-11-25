----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:26:16 11/28/2013 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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

entity ROM is
   Port (
		addr : in	std_logic_vector(17 downto 0);
      data : out	std_logic_vector(15 downto 0)
	);
end ROM;

architecture Behavioral of ROM is
signal data_out : std_logic_vector(15 downto 0);
begin
	process(addr)
		begin
		--if addr="000000000000000000" then
		--	data_out <= "0110100000000011";
		--elsif addr="000000000000000001" then
		--	data_out <= "0110100100000011";
		case addr(17 downto 0) is
			--when"000000000000000000"=>data_out<="0110100000001000";		--LI R0 8
			--when"000000000000000001"=>data_out<="0111000000001000";		--CMPI R0 8
			--when"000000000000000010"=>data_out<="0110000000000110";		--BTEQZ 6
			--when"000000000000000011"=>data_out<="0110100000000000";		--LI R0 0
			--when"000000000000000100"=>data_out<="0000100000000000";		--NOP
			--when"000000000000000101"=>data_out<="0111000000001000";		--CMPI R0 8
			--when"000000000000000110"=>data_out<="0110000000000010";		--BTEQZ 2
			--when"000000000000000111"=>data_out<="0000100000000000";
			--when"000000000000001000"=>data_out<="0000100000000000";
			--when"000000000000001001"=>data_out<="0110100000000001";		--LI R0 1
			--when"000000000000001010"=>data_out<="0000100000000000";
			--when"000000000000001011"=>data_out<="0000100000000000";
			--when"000000000000001100"=>data_out<="0111000000000001";		--CMPI R0 1
			--when"000000000000001101"=>data_out<="0110000000000110";		--BTEQZ 6
			--when others					=>data_out<="0000000000000000";
			
			
			--when"000000000000000001"=>data_out<="0110100100000001";		--LI R1 1
			--when"000000000000000010"=>data_out<="0110101000000011";		--LI R2 3
			--when"000000000000000011"=>data_out<="0110101100000000";		--LI R3 0
			--when"000000000000000100"=>data_out<="1101100101000000";		--SW R1 R2 0
			--when"000000000000000101"=>data_out<="1001100101100000";		--LW R1 R3 0
			--when"000000000000000110"=>data_out<="0010001111111010";		--BEQZ R3 -6
			--when others					=>data_out<="0000100000000000";
			
			
			--when"000000000000000000"=>data_out<="0000100000000000";	--nop		
			--when"000000000000000001"=>data_out<="0110111010111111";	--li	
			--when"000000000000000010"=>data_out<="0011011011000000";	--sll	
			--when"000000000000000011"=>data_out<="0100111000000001";	--addiu
			--when"000000000000000100"=>data_out<="1001111000000000";	--lw	
			--when"000000000000000101"=>data_out<="0110111000000001";	--li read	
			--when"000000000000000110"=>data_out<="1110100011001100";	--and		
			--when"000000000000000111"=>data_out<="0010000011111000";	--beqz
			--when"000000000000001000"=>data_out<="0000100000000000";	--nop
			--when"000000000000001001"=>data_out<="0110111010111111";
			--when"000000000000001010"=>data_out<="0011011011000000";
			--when"000000000000001011"=>data_out<="1001111000100001";
			--when"000000000000001100"=>data_out<="0111000101000100";	--cmpi 44 r1
			--when"000000000000001100"=>data_out<="0100100110111100";
			--when"000000000000001101"=>data_out<="0010100111110010";
			
			--when others => data_out<="0000100000000000";
			when "00"&x"0001"=>data_out <=x"0000";
			when "00"&x"0002"=>data_out <=x"0000";
			when "00"&x"0003"=>data_out <=x"0800";
			when "00"&x"0004"=>data_out <=x"1044";
			when "00"&x"0005"=>data_out <=x"0800";
			when "00"&x"0006"=>data_out <=x"0800";
			when "00"&x"0007"=>data_out <=x"0800";
			when "00"&x"0008"=>data_out <=x"0800";
			when "00"&x"0009"=>data_out <=x"6ebf";
			when "00"&x"000A"=>data_out <=x"36c0";
			when "00"&x"000B"=>data_out <=x"4e10";
			when "00"&x"000C"=>data_out <=x"de00";
			when "00"&x"000D"=>data_out <=x"de21";
			when "00"&x"000E"=>data_out <=x"de42";
			when "00"&x"000F"=>data_out <=x"9100";
			when "00"&x"0010"=>data_out <=x"6301";
			when "00"&x"0011"=>data_out <=x"68ff";
			when "00"&x"0012"=>data_out <=x"e90c";
			when "00"&x"0013"=>data_out <=x"9200";
			when "00"&x"0014"=>data_out <=x"6301";
			when "00"&x"0015"=>data_out <=x"63ff";
			when "00"&x"0016"=>data_out <=x"d300";
			when "00"&x"0017"=>data_out <=x"63ff";
			when "00"&x"0018"=>data_out <=x"d700";
			when "00"&x"0019"=>data_out <=x"6b0f";
			when "00"&x"001A"=>data_out <=x"ef40";
			when "00"&x"001B"=>data_out <=x"4f03";
			when "00"&x"001C"=>data_out <=x"0800";
			when "00"&x"001D"=>data_out <=x"108a";
			when "00"&x"001E"=>data_out <=x"0800";
			when "00"&x"001F"=>data_out <=x"6ebf";
			when "00"&x"0020"=>data_out <=x"36c0";
			when "00"&x"0021"=>data_out <=x"de60";
			when "00"&x"0022"=>data_out <=x"0800";
			when "00"&x"0023"=>data_out <=x"ef40";
			when "00"&x"0024"=>data_out <=x"4f03";
			when "00"&x"0025"=>data_out <=x"0800";
			when "00"&x"0026"=>data_out <=x"1081";
			when "00"&x"0027"=>data_out <=x"0800";
			when "00"&x"0028"=>data_out <=x"6ebf";
			when "00"&x"0029"=>data_out <=x"36c0";
			when "00"&x"002A"=>data_out <=x"de20";
			when "00"&x"002B"=>data_out <=x"0800";
			when "00"&x"002C"=>data_out <=x"6b0f";
			when "00"&x"002D"=>data_out <=x"ef40";
			when "00"&x"002E"=>data_out <=x"4f03";
			when "00"&x"002F"=>data_out <=x"0800";
			when "00"&x"0030"=>data_out <=x"1077";
			when "00"&x"0031"=>data_out <=x"0800";
			when "00"&x"0032"=>data_out <=x"6ebf";
			when "00"&x"0033"=>data_out <=x"36c0";
			when "00"&x"0034"=>data_out <=x"de60";
			when "00"&x"0035"=>data_out <=x"0800";
			when "00"&x"0036"=>data_out <=x"42c0";
			when "00"&x"0037"=>data_out <=x"f300";
			when "00"&x"0038"=>data_out <=x"6880";
			when "00"&x"0039"=>data_out <=x"3000";
			when "00"&x"003A"=>data_out <=x"eb0d";
			when "00"&x"003B"=>data_out <=x"6fbf";
			when "00"&x"003C"=>data_out <=x"37e0";
			when "00"&x"003D"=>data_out <=x"4f10";
			when "00"&x"003E"=>data_out <=x"9f00";
			when "00"&x"003F"=>data_out <=x"9f21";
			when "00"&x"0040"=>data_out <=x"9f42";
			when "00"&x"0041"=>data_out <=x"9700";
			when "00"&x"0042"=>data_out <=x"6301";
			when "00"&x"0043"=>data_out <=x"6301";
			when "00"&x"0044"=>data_out <=x"0800";
			when "00"&x"0045"=>data_out <=x"f301";
			when "00"&x"0046"=>data_out <=x"ee00";
			when "00"&x"0047"=>data_out <=x"93ff";
			when "00"&x"0048"=>data_out <=x"0800";
			when "00"&x"0049"=>data_out <=x"6807";
			when "00"&x"004A"=>data_out <=x"f001";
			when "00"&x"004B"=>data_out <=x"68bf";
			when "00"&x"004C"=>data_out <=x"3000";
			when "00"&x"004D"=>data_out <=x"4810";
			when "00"&x"004E"=>data_out <=x"6400";
			when "00"&x"004F"=>data_out <=x"0800";
			when "00"&x"0050"=>data_out <=x"6ebf";
			when "00"&x"0051"=>data_out <=x"36c0";
			when "00"&x"0052"=>data_out <=x"4e10";
			when "00"&x"0053"=>data_out <=x"6800";
			when "00"&x"0054"=>data_out <=x"de00";
			when "00"&x"0055"=>data_out <=x"de01";
			when "00"&x"0056"=>data_out <=x"de02";
			when "00"&x"0057"=>data_out <=x"de03";
			when "00"&x"0058"=>data_out <=x"de04";
			when "00"&x"0059"=>data_out <=x"de05";
			when "00"&x"005A"=>data_out <=x"ef40";
			when "00"&x"005B"=>data_out <=x"4f03";
			when "00"&x"005C"=>data_out <=x"0800";
			when "00"&x"005D"=>data_out <=x"104a";
			when "00"&x"005E"=>data_out <=x"6ebf";
			when "00"&x"005F"=>data_out <=x"36c0";
			when "00"&x"0060"=>data_out <=x"684f";
			when "00"&x"0061"=>data_out <=x"de00";
			when "00"&x"0062"=>data_out <=x"0800";
			when "00"&x"0063"=>data_out <=x"ef40";
			when "00"&x"0064"=>data_out <=x"4f03";
			when "00"&x"0065"=>data_out <=x"0800";
			when "00"&x"0066"=>data_out <=x"1041";
			when "00"&x"0067"=>data_out <=x"6ebf";
			when "00"&x"0068"=>data_out <=x"36c0";
			when "00"&x"0069"=>data_out <=x"684b";
			when "00"&x"006A"=>data_out <=x"de00";
			when "00"&x"006B"=>data_out <=x"0800";
			when "00"&x"006C"=>data_out <=x"ef40";
			when "00"&x"006D"=>data_out <=x"4f03";
			when "00"&x"006E"=>data_out <=x"0800";
			when "00"&x"006F"=>data_out <=x"1038";
			when "00"&x"0070"=>data_out <=x"6ebf";
			when "00"&x"0071"=>data_out <=x"36c0";
			when "00"&x"0072"=>data_out <=x"680a";
			when "00"&x"0073"=>data_out <=x"de00";
			when "00"&x"0074"=>data_out <=x"0800";
			when "00"&x"0075"=>data_out <=x"ef40";
			when "00"&x"0076"=>data_out <=x"4f03";
			when "00"&x"0077"=>data_out <=x"0800";
			when "00"&x"0078"=>data_out <=x"102f";
			when "00"&x"0079"=>data_out <=x"6ebf";
			when "00"&x"007A"=>data_out <=x"36c0";
			when "00"&x"007B"=>data_out <=x"680d";
			when "00"&x"007C"=>data_out <=x"de00";
			when "00"&x"007D"=>data_out <=x"0800";
			when "00"&x"007E"=>data_out <=x"ef40";
			when "00"&x"007F"=>data_out <=x"4f03";
			when "00"&x"0080"=>data_out <=x"0800";
			when "00"&x"0081"=>data_out <=x"1031";
			when "00"&x"0082"=>data_out <=x"0800";
			when "00"&x"0083"=>data_out <=x"6ebf";
			when "00"&x"0084"=>data_out <=x"36c0";
			when "00"&x"0085"=>data_out <=x"9e20";
			when "00"&x"0086"=>data_out <=x"6eff";
			when "00"&x"0087"=>data_out <=x"e9cc";
			when "00"&x"0088"=>data_out <=x"0800";
			when "00"&x"0089"=>data_out <=x"6852";
			when "00"&x"008A"=>data_out <=x"e82a";
			when "00"&x"008B"=>data_out <=x"6032";
			when "00"&x"008C"=>data_out <=x"0800";
			when "00"&x"008D"=>data_out <=x"6844";
			when "00"&x"008E"=>data_out <=x"e82a";
			when "00"&x"008F"=>data_out <=x"604d";
			when "00"&x"0090"=>data_out <=x"0800";
			when "00"&x"0091"=>data_out <=x"6841";
			when "00"&x"0092"=>data_out <=x"e82a";
			when "00"&x"0093"=>data_out <=x"600e";
			when "00"&x"0094"=>data_out <=x"0800";
			when "00"&x"0095"=>data_out <=x"6855";
			when "00"&x"0096"=>data_out <=x"e82a";
			when "00"&x"0097"=>data_out <=x"6007";
			when "00"&x"0098"=>data_out <=x"0800";
			when "00"&x"0099"=>data_out <=x"6847";
			when "00"&x"009A"=>data_out <=x"e82a";
			when "00"&x"009B"=>data_out <=x"6009";
			when "00"&x"009C"=>data_out <=x"0800";
			when "00"&x"009D"=>data_out <=x"17e0";
			when "00"&x"009E"=>data_out <=x"0800";
			when "00"&x"009F"=>data_out <=x"0800";
			when "00"&x"00A0"=>data_out <=x"10c0";
			when "00"&x"00A1"=>data_out <=x"0800";
			when "00"&x"00A2"=>data_out <=x"0800";
			when "00"&x"00A3"=>data_out <=x"1082";
			when "00"&x"00A4"=>data_out <=x"0800";
			when "00"&x"00A5"=>data_out <=x"0800";
			when "00"&x"00A6"=>data_out <=x"1103";
			when "00"&x"00A7"=>data_out <=x"0800";
			when "00"&x"00A8"=>data_out <=x"0800";
			when "00"&x"00A9"=>data_out <=x"6ebf";
			when "00"&x"00AA"=>data_out <=x"36c0";
			when "00"&x"00AB"=>data_out <=x"4e01";
			when "00"&x"00AC"=>data_out <=x"9e00";
			when "00"&x"00AD"=>data_out <=x"6e01";
			when "00"&x"00AE"=>data_out <=x"e8cc";
			when "00"&x"00AF"=>data_out <=x"20f8";
			when "00"&x"00B0"=>data_out <=x"0800";
			when "00"&x"00B1"=>data_out <=x"ef00";
			when "00"&x"00B2"=>data_out <=x"0800";
			when "00"&x"00B3"=>data_out <=x"0800";
			when "00"&x"00B4"=>data_out <=x"6ebf";
			when "00"&x"00B5"=>data_out <=x"36c0";
			when "00"&x"00B6"=>data_out <=x"4e01";
			when "00"&x"00B7"=>data_out <=x"9e00";
			when "00"&x"00B8"=>data_out <=x"6e02";
			when "00"&x"00B9"=>data_out <=x"e8cc";
			when "00"&x"00BA"=>data_out <=x"20f8";
			when "00"&x"00BB"=>data_out <=x"0800";
			when "00"&x"00BC"=>data_out <=x"ef00";
			when "00"&x"00BD"=>data_out <=x"0800";
			when "00"&x"00BE"=>data_out <=x"6906";
			when "00"&x"00BF"=>data_out <=x"6a06";
			when "00"&x"00C0"=>data_out <=x"68bf";
			when "00"&x"00C1"=>data_out <=x"3000";
			when "00"&x"00C2"=>data_out <=x"4810";
			when "00"&x"00C3"=>data_out <=x"e22f";
			when "00"&x"00C4"=>data_out <=x"e061";
			when "00"&x"00C5"=>data_out <=x"9860";
			when "00"&x"00C6"=>data_out <=x"ef40";
			when "00"&x"00C7"=>data_out <=x"4f03";
			when "00"&x"00C8"=>data_out <=x"0800";
			when "00"&x"00C9"=>data_out <=x"17de";
			when "00"&x"00CA"=>data_out <=x"0800";
			when "00"&x"00CB"=>data_out <=x"6ebf";
			when "00"&x"00CC"=>data_out <=x"36c0";
			when "00"&x"00CD"=>data_out <=x"de60";
			when "00"&x"00CE"=>data_out <=x"3363";
			when "00"&x"00CF"=>data_out <=x"ef40";
			when "00"&x"00D0"=>data_out <=x"4f03";
			when "00"&x"00D1"=>data_out <=x"0800";
			when "00"&x"00D2"=>data_out <=x"17d5";
			when "00"&x"00D3"=>data_out <=x"0800";
			when "00"&x"00D4"=>data_out <=x"6ebf";
			when "00"&x"00D5"=>data_out <=x"36c0";
			when "00"&x"00D6"=>data_out <=x"de60";
			when "00"&x"00D7"=>data_out <=x"49ff";
			when "00"&x"00D8"=>data_out <=x"0800";
			when "00"&x"00D9"=>data_out <=x"29e6";
			when "00"&x"00DA"=>data_out <=x"0800";
			when "00"&x"00DB"=>data_out <=x"17a2";
			when "00"&x"00DC"=>data_out <=x"0800";
			when "00"&x"00DD"=>data_out <=x"ef40";
			when "00"&x"00DE"=>data_out <=x"4f03";
			when "00"&x"00DF"=>data_out <=x"0800";
			when "00"&x"00E0"=>data_out <=x"17d2";
			when "00"&x"00E1"=>data_out <=x"0800";
			when "00"&x"00E2"=>data_out <=x"6ebf";
			when "00"&x"00E3"=>data_out <=x"36c0";
			when "00"&x"00E4"=>data_out <=x"9ea0";
			when "00"&x"00E5"=>data_out <=x"6eff";
			when "00"&x"00E6"=>data_out <=x"edcc";
			when "00"&x"00E7"=>data_out <=x"0800";
			when "00"&x"00E8"=>data_out <=x"ef40";
			when "00"&x"00E9"=>data_out <=x"4f03";
			when "00"&x"00EA"=>data_out <=x"0800";
			when "00"&x"00EB"=>data_out <=x"17c7";
			when "00"&x"00EC"=>data_out <=x"0800";
			when "00"&x"00ED"=>data_out <=x"6ebf";
			when "00"&x"00EE"=>data_out <=x"36c0";
			when "00"&x"00EF"=>data_out <=x"9e20";
			when "00"&x"00F0"=>data_out <=x"6eff";
			when "00"&x"00F1"=>data_out <=x"e9cc";
			when "00"&x"00F2"=>data_out <=x"0800";
			when "00"&x"00F3"=>data_out <=x"3120";
			when "00"&x"00F4"=>data_out <=x"e9ad";
			when "00"&x"00F5"=>data_out <=x"ef40";
			when "00"&x"00F6"=>data_out <=x"4f03";
			when "00"&x"00F7"=>data_out <=x"0800";
			when "00"&x"00F8"=>data_out <=x"17ba";
			when "00"&x"00F9"=>data_out <=x"0800";
			when "00"&x"00FA"=>data_out <=x"6ebf";
			when "00"&x"00FB"=>data_out <=x"36c0";
			when "00"&x"00FC"=>data_out <=x"9ea0";
			when "00"&x"00FD"=>data_out <=x"6eff";
			when "00"&x"00FE"=>data_out <=x"edcc";
			when "00"&x"00FF"=>data_out <=x"0800";
			when "00"&x"0100"=>data_out <=x"ef40";
			when "00"&x"0101"=>data_out <=x"4f03";
			when "00"&x"0102"=>data_out <=x"0800";
			when "00"&x"0103"=>data_out <=x"17af";
			when "00"&x"0104"=>data_out <=x"0800";
			when "00"&x"0105"=>data_out <=x"6ebf";
			when "00"&x"0106"=>data_out <=x"36c0";
			when "00"&x"0107"=>data_out <=x"9e40";
			when "00"&x"0108"=>data_out <=x"6eff";
			when "00"&x"0109"=>data_out <=x"eacc";
			when "00"&x"010A"=>data_out <=x"0800";
			when "00"&x"010B"=>data_out <=x"3240";
			when "00"&x"010C"=>data_out <=x"eaad";
			when "00"&x"010D"=>data_out <=x"9960";
			when "00"&x"010E"=>data_out <=x"ef40";
			when "00"&x"010F"=>data_out <=x"4f03";
			when "00"&x"0110"=>data_out <=x"0800";
			when "00"&x"0111"=>data_out <=x"1796";
			when "00"&x"0112"=>data_out <=x"0800";
			when "00"&x"0113"=>data_out <=x"6ebf";
			when "00"&x"0114"=>data_out <=x"36c0";
			when "00"&x"0115"=>data_out <=x"de60";
			when "00"&x"0116"=>data_out <=x"3363";
			when "00"&x"0117"=>data_out <=x"ef40";
			when "00"&x"0118"=>data_out <=x"4f03";
			when "00"&x"0119"=>data_out <=x"0800";
			when "00"&x"011A"=>data_out <=x"178d";
			when "00"&x"011B"=>data_out <=x"0800";
			when "00"&x"011C"=>data_out <=x"6ebf";
			when "00"&x"011D"=>data_out <=x"36c0";
			when "00"&x"011E"=>data_out <=x"de60";
			when "00"&x"011F"=>data_out <=x"4901";
			when "00"&x"0120"=>data_out <=x"4aff";
			when "00"&x"0121"=>data_out <=x"0800";
			when "00"&x"0122"=>data_out <=x"2aea";
			when "00"&x"0123"=>data_out <=x"0800";
			when "00"&x"0124"=>data_out <=x"1759";
			when "00"&x"0125"=>data_out <=x"0800";
			when "00"&x"0126"=>data_out <=x"ef40";
			when "00"&x"0127"=>data_out <=x"4f03";
			when "00"&x"0128"=>data_out <=x"0800";
			when "00"&x"0129"=>data_out <=x"1789";
			when "00"&x"012A"=>data_out <=x"0800";
			when "00"&x"012B"=>data_out <=x"6ebf";
			when "00"&x"012C"=>data_out <=x"36c0";
			when "00"&x"012D"=>data_out <=x"9ea0";
			when "00"&x"012E"=>data_out <=x"6eff";
			when "00"&x"012F"=>data_out <=x"edcc";
			when "00"&x"0130"=>data_out <=x"0800";
			when "00"&x"0131"=>data_out <=x"ef40";
			when "00"&x"0132"=>data_out <=x"4f03";
			when "00"&x"0133"=>data_out <=x"0800";
			when "00"&x"0134"=>data_out <=x"177e";
			when "00"&x"0135"=>data_out <=x"0800";
			when "00"&x"0136"=>data_out <=x"6ebf";
			when "00"&x"0137"=>data_out <=x"36c0";
			when "00"&x"0138"=>data_out <=x"9e20";
			when "00"&x"0139"=>data_out <=x"6eff";
			when "00"&x"013A"=>data_out <=x"e9cc";
			when "00"&x"013B"=>data_out <=x"0800";
			when "00"&x"013C"=>data_out <=x"3120";
			when "00"&x"013D"=>data_out <=x"e9ad";
			when "00"&x"013E"=>data_out <=x"6800";
			when "00"&x"013F"=>data_out <=x"e82a";
			when "00"&x"0140"=>data_out <=x"601d";
			when "00"&x"0141"=>data_out <=x"0800";
			when "00"&x"0142"=>data_out <=x"ef40";
			when "00"&x"0143"=>data_out <=x"4f03";
			when "00"&x"0144"=>data_out <=x"0800";
			when "00"&x"0145"=>data_out <=x"176d";
			when "00"&x"0146"=>data_out <=x"0800";
			when "00"&x"0147"=>data_out <=x"6ebf";
			when "00"&x"0148"=>data_out <=x"36c0";
			when "00"&x"0149"=>data_out <=x"9ea0";
			when "00"&x"014A"=>data_out <=x"6eff";
			when "00"&x"014B"=>data_out <=x"edcc";
			when "00"&x"014C"=>data_out <=x"0800";
			when "00"&x"014D"=>data_out <=x"ef40";
			when "00"&x"014E"=>data_out <=x"4f03";
			when "00"&x"014F"=>data_out <=x"0800";
			when "00"&x"0150"=>data_out <=x"1762";
			when "00"&x"0151"=>data_out <=x"0800";
			when "00"&x"0152"=>data_out <=x"6ebf";
			when "00"&x"0153"=>data_out <=x"36c0";
			when "00"&x"0154"=>data_out <=x"9e40";
			when "00"&x"0155"=>data_out <=x"6eff";
			when "00"&x"0156"=>data_out <=x"eacc";
			when "00"&x"0157"=>data_out <=x"0800";
			when "00"&x"0158"=>data_out <=x"3240";
			when "00"&x"0159"=>data_out <=x"eaad";
			when "00"&x"015A"=>data_out <=x"d940";
			when "00"&x"015B"=>data_out <=x"0800";
			when "00"&x"015C"=>data_out <=x"17c9";
			when "00"&x"015D"=>data_out <=x"0800";
			when "00"&x"015E"=>data_out <=x"0800";
			when "00"&x"015F"=>data_out <=x"171e";
			when "00"&x"0160"=>data_out <=x"0800";
			when "00"&x"0161"=>data_out <=x"ef40";
			when "00"&x"0162"=>data_out <=x"4f03";
			when "00"&x"0163"=>data_out <=x"0800";
			when "00"&x"0164"=>data_out <=x"174e";
			when "00"&x"0165"=>data_out <=x"0800";
			when "00"&x"0166"=>data_out <=x"6ebf";
			when "00"&x"0167"=>data_out <=x"36c0";
			when "00"&x"0168"=>data_out <=x"9ea0";
			when "00"&x"0169"=>data_out <=x"6eff";
			when "00"&x"016A"=>data_out <=x"edcc";
			when "00"&x"016B"=>data_out <=x"0800";
			when "00"&x"016C"=>data_out <=x"ef40";
			when "00"&x"016D"=>data_out <=x"4f03";
			when "00"&x"016E"=>data_out <=x"0800";
			when "00"&x"016F"=>data_out <=x"1743";
			when "00"&x"0170"=>data_out <=x"0800";
			when "00"&x"0171"=>data_out <=x"6ebf";
			when "00"&x"0172"=>data_out <=x"36c0";
			when "00"&x"0173"=>data_out <=x"9e20";
			when "00"&x"0174"=>data_out <=x"6eff";
			when "00"&x"0175"=>data_out <=x"e9cc";
			when "00"&x"0176"=>data_out <=x"0800";
			when "00"&x"0177"=>data_out <=x"3120";
			when "00"&x"0178"=>data_out <=x"e9ad";
			when "00"&x"0179"=>data_out <=x"ef40";
			when "00"&x"017A"=>data_out <=x"4f03";
			when "00"&x"017B"=>data_out <=x"0800";
			when "00"&x"017C"=>data_out <=x"1736";
			when "00"&x"017D"=>data_out <=x"0800";
			when "00"&x"017E"=>data_out <=x"6ebf";
			when "00"&x"017F"=>data_out <=x"36c0";
			when "00"&x"0180"=>data_out <=x"9ea0";
			when "00"&x"0181"=>data_out <=x"6eff";
			when "00"&x"0182"=>data_out <=x"edcc";
			when "00"&x"0183"=>data_out <=x"0800";
			when "00"&x"0184"=>data_out <=x"ef40";
			when "00"&x"0185"=>data_out <=x"4f03";
			when "00"&x"0186"=>data_out <=x"0800";
			when "00"&x"0187"=>data_out <=x"172b";
			when "00"&x"0188"=>data_out <=x"0800";
			when "00"&x"0189"=>data_out <=x"6ebf";
			when "00"&x"018A"=>data_out <=x"36c0";
			when "00"&x"018B"=>data_out <=x"9e40";
			when "00"&x"018C"=>data_out <=x"6eff";
			when "00"&x"018D"=>data_out <=x"eacc";
			when "00"&x"018E"=>data_out <=x"0800";
			when "00"&x"018F"=>data_out <=x"3240";
			when "00"&x"0190"=>data_out <=x"eaad";
			when "00"&x"0191"=>data_out <=x"9960";
			when "00"&x"0192"=>data_out <=x"ef40";
			when "00"&x"0193"=>data_out <=x"4f03";
			when "00"&x"0194"=>data_out <=x"0800";
			when "00"&x"0195"=>data_out <=x"1712";
			when "00"&x"0196"=>data_out <=x"0800";
			when "00"&x"0197"=>data_out <=x"6ebf";
			when "00"&x"0198"=>data_out <=x"36c0";
			when "00"&x"0199"=>data_out <=x"de60";
			when "00"&x"019A"=>data_out <=x"3363";
			when "00"&x"019B"=>data_out <=x"ef40";
			when "00"&x"019C"=>data_out <=x"4f03";
			when "00"&x"019D"=>data_out <=x"0800";
			when "00"&x"019E"=>data_out <=x"1709";
			when "00"&x"019F"=>data_out <=x"0800";
			when "00"&x"01A0"=>data_out <=x"6ebf";
			when "00"&x"01A1"=>data_out <=x"36c0";
			when "00"&x"01A2"=>data_out <=x"de60";
			when "00"&x"01A3"=>data_out <=x"4901";
			when "00"&x"01A4"=>data_out <=x"4aff";
			when "00"&x"01A5"=>data_out <=x"0800";
			when "00"&x"01A6"=>data_out <=x"2aea";
			when "00"&x"01A7"=>data_out <=x"0800";
			when "00"&x"01A8"=>data_out <=x"16d5";
			when "00"&x"01A9"=>data_out <=x"0800";
			when "00"&x"01AA"=>data_out <=x"ef40";
			when "00"&x"01AB"=>data_out <=x"4f03";
			when "00"&x"01AC"=>data_out <=x"0800";
			when "00"&x"01AD"=>data_out <=x"1705";
			when "00"&x"01AE"=>data_out <=x"0800";
			when "00"&x"01AF"=>data_out <=x"6ebf";
			when "00"&x"01B0"=>data_out <=x"36c0";
			when "00"&x"01B1"=>data_out <=x"9ea0";
			when "00"&x"01B2"=>data_out <=x"6eff";
			when "00"&x"01B3"=>data_out <=x"edcc";
			when "00"&x"01B4"=>data_out <=x"0800";
			when "00"&x"01B5"=>data_out <=x"ef40";
			when "00"&x"01B6"=>data_out <=x"4f03";
			when "00"&x"01B7"=>data_out <=x"0800";
			when "00"&x"01B8"=>data_out <=x"16fa";
			when "00"&x"01B9"=>data_out <=x"0800";
			when "00"&x"01BA"=>data_out <=x"6ebf";
			when "00"&x"01BB"=>data_out <=x"36c0";
			when "00"&x"01BC"=>data_out <=x"9e40";
			when "00"&x"01BD"=>data_out <=x"6eff";
			when "00"&x"01BE"=>data_out <=x"eacc";
			when "00"&x"01BF"=>data_out <=x"0800";
			when "00"&x"01C0"=>data_out <=x"3240";
			when "00"&x"01C1"=>data_out <=x"eaad";
			when "00"&x"01C2"=>data_out <=x"42c0";
			when "00"&x"01C3"=>data_out <=x"6fbf";
			when "00"&x"01C4"=>data_out <=x"37e0";
			when "00"&x"01C5"=>data_out <=x"4f10";
			when "00"&x"01C6"=>data_out <=x"9fa5";
			when "00"&x"01C7"=>data_out <=x"63ff";
			when "00"&x"01C8"=>data_out <=x"d500";
			when "00"&x"01C9"=>data_out <=x"f500";
			when "00"&x"01CA"=>data_out <=x"6980";
			when "00"&x"01CB"=>data_out <=x"3120";
			when "00"&x"01CC"=>data_out <=x"ed2d";
			when "00"&x"01CD"=>data_out <=x"9f00";
			when "00"&x"01CE"=>data_out <=x"9f21";
			when "00"&x"01CF"=>data_out <=x"9f42";
			when "00"&x"01D0"=>data_out <=x"9f63";
			when "00"&x"01D1"=>data_out <=x"9f84";
			when "00"&x"01D2"=>data_out <=x"ef40";
			when "00"&x"01D3"=>data_out <=x"4f04";
			when "00"&x"01D4"=>data_out <=x"f501";
			when "00"&x"01D5"=>data_out <=x"ee00";
			when "00"&x"01D6"=>data_out <=x"9500";
			when "00"&x"01D7"=>data_out <=x"0800";
			when "00"&x"01D8"=>data_out <=x"0800";
			when "00"&x"01D9"=>data_out <=x"6301";
			when "00"&x"01DA"=>data_out <=x"6fbf";
			when "00"&x"01DB"=>data_out <=x"37e0";
			when "00"&x"01DC"=>data_out <=x"4f10";
			when "00"&x"01DD"=>data_out <=x"df00";
			when "00"&x"01DE"=>data_out <=x"df21";
			when "00"&x"01DF"=>data_out <=x"df42";
			when "00"&x"01E0"=>data_out <=x"df63";
			when "00"&x"01E1"=>data_out <=x"df84";
			when "00"&x"01E2"=>data_out <=x"dfa5";
			when "00"&x"01E3"=>data_out <=x"f000";
			when "00"&x"01E4"=>data_out <=x"697f";
			when "00"&x"01E5"=>data_out <=x"3120";
			when "00"&x"01E6"=>data_out <=x"6aff";
			when "00"&x"01E7"=>data_out <=x"e94d";
			when "00"&x"01E8"=>data_out <=x"e82c";
			when "00"&x"01E9"=>data_out <=x"f001";
			when "00"&x"01EA"=>data_out <=x"6907";
			when "00"&x"01EB"=>data_out <=x"ef40";
			when "00"&x"01EC"=>data_out <=x"4f03";
			when "00"&x"01ED"=>data_out <=x"0800";
			when "00"&x"01EE"=>data_out <=x"16b9";
			when "00"&x"01EF"=>data_out <=x"0800";
			when "00"&x"01F0"=>data_out <=x"6ebf";
			when "00"&x"01F1"=>data_out <=x"36c0";
			when "00"&x"01F2"=>data_out <=x"de20";
			when "00"&x"01F3"=>data_out <=x"168a";
			when "00"&x"01F4"=>data_out <=x"0800";
			when others=>data_out <= "0000100000000000"; --NOP
		end case;
		--end if;
	end process;
	data<=data_out;
end Behavioral;

