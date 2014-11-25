--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package Define is

constant op_ADD:std_logic_vector(3 downto 0):="0000";
constant op_SUB:std_logic_vector(3 downto 0):="0001";
constant op_AND:std_logic_vector(3 downto 0):="0010";
constant op_OR	:std_logic_vector(3 downto 0):="0011";
constant op_XOR:std_logic_vector(3 downto 0):="0100";
constant op_NOT:std_logic_vector(3 downto 0):="0101";
constant op_SLL:std_logic_vector(3 downto 0):="0110";
constant op_SRL:std_logic_vector(3 downto 0):="0111";
constant op_SRA:std_logic_vector(3 downto 0):="1000";
constant op_ROL:std_logic_vector(3 downto 0):="1001";
constant op_IN1:std_logic_vector(3 downto 0):="1010";
constant op_IN2:std_logic_vector(3 downto 0):="1011";

--constant zero16:std_logic_vector(15 downto 0):="0000000000000000";

end Define;

package body Define is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end Define;
