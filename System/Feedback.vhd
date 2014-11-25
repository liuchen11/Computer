----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:22:23 11/24/2013 
-- Design Name: 
-- Module Name:    feedback - Behavioral 
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

--解决数据冲突而采用的旁路
entity Feedback is
   Port (
		control_sign_mem	: in	std_logic_vector(3 downto 0);
      r_back_addr_mem	: in	std_logic_vector(2 downto 0);
		control_sign_wb	: in	std_logic_vector(3 downto 0);
      r_back_addr_wb		: in	std_logic_vector(2 downto 0);
      r_1_addr				: in	std_logic_vector(2 downto 0);
		r_2_addr				: in	std_logic_vector(2 downto 0);
		update_RA			: out	std_logic_vector(1 downto 0);
		update_SP			: out std_logic_vector(1 downto 0);
		update_IH			: out std_logic_vector(1 downto 0);
		update_r1			: out	std_logic_vector(1 downto 0);
		update_r2			: out	std_logic_vector(1 downto 0)
	);
end Feedback;

architecture Behavioral of Feedback is

begin
process(control_sign_mem,r_back_addr_mem,control_sign_wb,r_back_addr_wb,r_1_addr,r_2_addr)
begin
	case control_sign_mem(3 downto 0) is
		when"0111"=>
			update_RA(0)<='0'; update_SP(0)<='1'; update_IH(0)<='1'; update_r1(0)<='1'; update_r2(0)<='1';
		when"1011"=>
			update_RA(0)<='1'; update_SP(0)<='1'; update_IH(0)<='0'; update_r1(0)<='1'; update_r2(0)<='1';
		when"1101"=>
			update_RA(0)<='1'; update_SP(0)<='0'; update_IH(0)<='1'; update_r1(0)<='1'; update_r2(0)<='1';
		when"1110"=>
			update_RA(0)<='1'; update_SP(0)<='1'; update_IH(0)<='1';
			if r_back_addr_mem=r_1_addr then
				update_r1(0)<='0';
			else
				update_r1(0)<='1';
			end if;
			if r_back_addr_mem=r_2_addr then
				update_r2(0)<='0';
			else
				update_r2(0)<='1';
			end if;
		when others=>
			update_RA(0)<='1'; update_SP(0)<='1'; update_IH(0)<='1'; update_r1(0)<='1'; update_r2(0)<='1';
	end case;
	case control_sign_wb(3 downto 0) is
		when"0111"=>
			update_RA(1)<='0'; update_SP(1)<='1'; update_IH(1)<='1'; update_r1(1)<='1'; update_r2(1)<='1';
		when"1011"=>
			update_RA(1)<='1'; update_SP(1)<='1'; update_IH(1)<='0'; update_r1(1)<='1'; update_r2(1)<='1';
		when"1101"=>
			update_RA(1)<='1'; update_SP(1)<='0'; update_IH(1)<='1'; update_r1(1)<='1'; update_r2(1)<='1';
		when"1110"=>
			update_RA(1)<='1'; update_SP(1)<='1'; update_IH(1)<='1';
			if r_back_addr_wb=r_1_addr then
				update_r1(1)<='0';
			else
				update_r1(1)<='1';
			end if;
			if r_back_addr_wb=r_2_addr then
				update_r2(1)<='0';
			else
				update_r2(1)<='1';
			end if;
		when others=>
			update_RA(1)<='1'; update_SP(1)<='1'; update_IH(1)<='1'; update_r1(1)<='1'; update_r2(1)<='1';
	end case;
end process;
end Behavioral;

