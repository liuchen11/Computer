----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:28:02 11/24/2013 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use work.Define.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--‘ÀÀ„∆˜
entity ALU is
   Port ( 
		inputA	: in	std_logic_vector(15 downto 0);
      inputB	: in	std_logic_vector(15 downto 0);
      op			: in	std_logic_vector(3 downto 0);
      output 	: out	std_logic_vector(15 downto 0);
      signflag	: out	std_logic;
		zeroflag	: out std_logic
	);
end ALU;

architecture Behavioral of ALU is
signal result:std_logic_vector(15 downto 0);
begin

	output<=result;
	
	process (inputA,inputB,op)
		begin
		case op is
			when op_ADD=>	result<=inputA+inputB;
			when op_SUB=>	result<=inputA-inputB;
			when op_AND=>	result<=inputA and inputB;
			when op_OR =>	result<=inputA or inputB;
			when op_XOR=>	result<=inputA xor inputB;
			when op_NOT=>	result<=not inputB;	--!!
			when op_SLL=>
				if inputA="0000000000000000" then
					result<=std_logic_vector(unsigned(inputB) sll 8);
				else
					result<=std_logic_vector(unsigned(inputB) sll conv_integer(inputA));
				end if;
			when op_SRL=>
				if inputA="0000000000000000" then
					result<=std_logic_vector(unsigned(inputB) srl 8);
				else
					result<=std_logic_vector(unsigned(inputB) srl conv_integer(inputA));
				end if;
			when op_SRA=>
				if inputA="0000000000000000" then
					result<=to_stdlogicvector(to_bitvector(inputB) sra 8);
				else
					result<=to_stdlogicvector(to_bitvector(inputB) sra conv_integer(inputA));
				end if;
			when op_ROL=>
				if inputA="0000000000000000" then
					result<=std_logic_vector(unsigned(inputB) rol 8);
				else
					result<=std_logic_vector(unsigned(inputB) rol conv_integer(inputA));
				end if;
			when op_IN1=>	result<=inputA;
			when op_IN2=>	result<=inputB;
			when others=>	result<="0000000000000000";
		end case;
		if result="0000000000000000" then
			zeroflag<='0';
		else
			zeroflag<='1';
		end if;
		signflag<=result(15);
	end process;
end Behavioral;

