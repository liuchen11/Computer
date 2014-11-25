----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:49:41 12/05/2013 
-- Design Name: 
-- Module Name:    flash - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity flash is
port(
	reset 			: in std_logic;
	clk 				: in std_logic;
	data_ready 		: in std_logic;
	key 				: in std_logic;
	rdn,wrn 			: out std_logic;
	led				: out std_logic_vector(15 downto 0);
	data_ram1 		: inout std_logic_vector(15 downto 0);
	addr_ram1 		: inout std_logic_vector(16 downto 0);
			  
	ram1_en			: out std_logic;
	ram1_oe			: out std_logic;
	ram1_rw			: out std_logic;
	
	flash_byte 		: out std_logic;
	flash_vpen 		: out std_logic;
	flash_ce 		: out std_logic;
	flash_oe 		: out std_logic;
	flash_we 		: out std_logic;
	flash_rp 		: out std_logic;
	flash_addr 		: out std_logic_vector(22 downto 1);
	flash_data 		: inout std_logic_vector(15 downto 0);
	
	scan				: in std_logic;
	R					: out std_logic_vector(2 downto 0);
	G					: out std_logic_vector(2 downto 0);
	B					: out std_logic_vector(2 downto 0);
	Hs					: out std_logic;
	Vs					: out std_logic
);
end flash;

architecture Behavioral of flash is

	component VGA is
		Port (
			clk	: in	std_logic;
			rst	: in	std_logic;
			R		: out	std_logic_vector(2 downto 0);
			G		: out	std_logic_vector(2 downto 0);
			B		: out	std_logic_vector(2 downto 0);
			Hs		: out	std_logic;
			Vs		: out	std_logic
		);
	end component;

	signal clk_flash, clock: std_logic;
	signal ctl_read : std_logic;
	signal flash_addr_input : std_logic_vector(22 downto 1);
	signal flash_data_output : std_logic_vector(15 downto 0);
	
	signal response : std_logic_vector(7 downto 0);
	signal high : std_logic;
	signal blockaddr : std_logic_vector(5 downto 0);
	
	signal staddr: std_logic_vector(23 downto 0) := "000000000000000000000000";
	signal edaddr: std_logic_vector(23 downto 0) := "000000000000000111110011";
	
	signal data_tmp : std_logic_vector(15 downto 0);
	
	signal stdscan	: std_logic:='0';
	shared variable col:integer range 0 to 800:=0;
	shared variable row:integer range 0 to 525:=0;
	
	type main_state is (
		waiting, doit,
		writeramA0, writeramA1, writeramA2,
		done
	);
	signal state : main_state := waiting;

	component flash_io
    Port ( addr : in  STD_LOGIC_VECTOR (22 downto 1);
           data_out : out  STD_LOGIC_VECTOR (15 downto 0);
			  clk : in std_logic;
			  reset : in std_logic;
			  
			  flash_byte : out std_logic;
			  flash_vpen : out std_logic;
			  flash_ce : out std_logic;
			  flash_oe : out std_logic;
			  flash_we : out std_logic;
			  flash_rp : out std_logic;
			  flash_addr : out std_logic_vector(22 downto 1);
			  flash_data : inout std_logic_vector(15 downto 0);
			  
           ctl_read : in  STD_LOGIC
	);
	end component;
	
	component clk_1152
    Port ( clk : in  STD_LOGIC;
	        clk_flash : out std_logic;
           clk5000 : out  STD_LOGIC
		);
	end component;
begin
	VGA_part: VGA PORT MAP(
		scan,reset,R,G,B,Hs,Vs
	);

	clk_producer: clk_1152 PORT MAP (
		clk => clk,
		clk_flash => clock,
		clk5000 => clk_flash);
		
	flash : flash_io PORT MAP (
		addr => flash_addr_input,
		data_out => flash_data_output,
		clk => clk_flash,
		reset => reset,
		flash_byte => flash_byte,
		flash_vpen => flash_vpen,
		flash_ce => flash_ce,
		flash_oe => flash_oe,
		flash_we => flash_we,
		flash_rp => flash_rp,
		flash_addr => flash_addr,
		flash_data => flash_data,
		ctl_read => ctl_read
	);
		
	ram1_en <= '0';

	process(clock,reset,key)
	begin
		--reset
		if(reset = '0') then
			state <= waiting;
			wrn <= '1';
			rdn <= '1';
			ram1_rw <= '1';
			ram1_oe <= '1';
			led <= (others => '0');
		--clk
		elsif( key = '0') then
			if(state = waiting) then
				state <= writeramA0;
			end if;
		--load
		elsif (clock'event and clock = '1') then
			case state is
				when writeramA0 =>
					flash_addr_input <= staddr(21 downto 0);
					addr_ram1 <= staddr(16 downto 0) - 1;
					high <= '1';
					state <= writeramA1;
				when writeramA1 =>
					ram1_rw <= '1';
						if (high = '1') then
							addr_ram1 <= addr_ram1 + 1;
							high <= '0';
						else
							high <= '1';
						end if;
					rdn <= '0';
					ctl_read <= not ctl_read;
					state <= writeramA2;
					led(15 downto 1) <= flash_data_output(15 downto 1);
					led(0) <= data_ready;
				when writeramA2 =>
					rdn <= '1';
					if (high = '0') then
						data_tmp(7 downto 0) <= flash_data_output(15 downto 8);
					else
						data_ram1(15 downto 8) <= data_tmp(7 downto 0);
						data_ram1(7 downto 0) <= flash_data_output(7 downto 0);
						flash_addr_input <= flash_addr_input + 1;
						ram1_rw <= '0';
					end if;
					if (addr_ram1 = edaddr(16 downto 0) and high = '1') then
						state <= done;
					else
						state <= writeramA1;
					end if;	
				when others =>
					state <= waiting;
					wrn <= '1';
					rdn <= '1';
					ram1_rw <= '1';
					ram1_oe <= '1';
			end case;
		end if;
	end process;
	
end Behavioral;

