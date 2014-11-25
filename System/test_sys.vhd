--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:30:20 12/02/2013
-- Design Name:   
-- Module Name:   D:/ISE_workspace/System/test_sys.vhd
-- Project Name:  System
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: System
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_sys IS
END test_sys;
 
ARCHITECTURE behavior OF test_sys IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT System
    PORT(
         ramaddr : OUT  std_logic_vector(17 downto 0);
         ramdata : INOUT  std_logic_vector(15 downto 0);
         ramoe : OUT  std_logic;
         ramen : OUT  std_logic;
         ramwe : OUT  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         out1 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';

	--BiDirs
   signal ramdata : std_logic_vector(15 downto 0);

 	--Outputs
   signal ramaddr : std_logic_vector(17 downto 0);
   signal ramoe : std_logic;
   signal ramen : std_logic;
   signal ramwe : std_logic;
   signal out1 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: System PORT MAP (
          ramaddr => ramaddr,
          ramdata => ramdata,
          ramoe => ramoe,
          ramen => ramen,
          ramwe => ramwe,
          clk => clk,
          rst => rst,
          out1 => out1
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
