----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:10:09 12/04/2013 
-- Design Name: 
-- Module Name:    MemoryController - Behavioral 
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

entity MemoryController is
   Port ( 
		--外部接口
		PCaddr		: in		std_logic_vector(17 downto 0);
		inputaddr	: in		std_logic_vector(17 downto 0);
		inputdata	: in		std_logic_vector(15 downto 0);
		outputdata	: out		std_logic_vector(15 downto 0);
		outputins	: out		std_logic_vector(15 downto 0);
		enread		: in		std_logic;
		enwrite		: in		std_logic;
		en				: in		std_logic;
		
		--对内存的操作接口
		ramaddr		: out		std_logic_vector(17 downto 0);
		ramdata		: inout	std_logic_vector(15 downto 0);
		ramoe			: out		std_logic;
		ramen			: out		std_logic;
		ramwe			: out		std_logic;
		
		--对串口的操作接口
		rdn			: out		std_logic;
		wrn			: out		std_logic;
		tbre			: in		std_logic;
		tsre			: in		std_logic;
		data_ready	: in		std_logic;
		
		--时钟信号
		clk			: in		std_logic;
		rst			: in		std_logic
	);
end MemoryController;

architecture Behavioral of MemoryController is

procedure ram_write(
	signal state	:	inout	std_logic_vector(1 downto 0);
	signal data		:	in 	std_logic_vector(15 downto 0);
	signal data_ram:	inout std_logic_vector(15 downto 0);
	signal oe		:	out 	std_logic;
	signal we		:	out 	std_logic;
	signal en		:	out 	std_logic
) is
begin
	case state is
		when"00"=>
			oe <= '1';
			en <= '0';
			we <= '1';
			data_ram <= data;
			state <= "01";
		when"01"=>
			we <= '0';
			state <= "10";
		when"10"=>
			we <= '1';
			state <= "11";
		when others=>
	end case;
end procedure;

procedure ram_read(
	signal state 	:	inout std_logic_vector(1 downto 0);
	signal data_out:	out 	std_logic_vector(15 downto 0);
	signal data_ram:	inout std_logic_vector(15 downto 0);
	signal oe 		:	out 	std_logic;
	signal we 		:	out 	std_logic;
	signal en 		:	out 	std_logic
)is
begin
	 case state is
	 	when "00"=>
	 		en <= '0';
	 		oe <= '0';
	 		we <= '1';
	 		data_ram <= "ZZZZZZZZZZZZZZZZ";
	 		state <= "01";
	 	when "01"=>
	 		data_out <= data_ram;
	 		state <= "10";
		when others=>
	 end case;
end procedure;

signal state:std_logic_vector(1 downto 0):="00";
signal input:std_logic_vector(15 downto 0):="0000000000000000";
shared variable cnt : integer range 0 to 5 := 0;

signal ser_rd_state : integer range 0 to 7 := 0; --读串口时序
signal ser_wr_state : integer range 0 to 7 := 0; --写串口时序

--BF00和BF01内存数据
signal addr_BF00 : std_logic_vector(15 downto 0) := (others=>'0');
signal addr_BF01 : std_logic_vector(15 downto 0) := (others=>'0');

begin
--ramaddr
process(en)
begin
	if en='0' then
		ramaddr<=inputaddr;
	else
		ramaddr<=PCaddr;
	end if;
end process;

process(clk, rst)
begin
	if rst='0' then
		outputdata <= "0000000000000000";
		state<="00";
		ramoe <= '1';
		ramwe <= '1';
		ramen <= '1';
		rdn <= '1';
		wrn <= '1';
		cnt := 0;
	elsif rising_edge(clk) then		--无法既对上升沿敏感又对下降沿敏感>.<
		if cnt /= 5 then
			if en='0' then
				if enread='0' then
					--LW BF01指令
					if inputaddr = "001011111100000001" then
						case state is
							when "00" =>
								outputdata <= addr_BF01;
								--如果串口可读可写（状态为空）进入串口读写状态
								if (ser_rd_state = 0 and ser_wr_state = 0 and tbre = '1' and tsre = '1') then
									ser_rd_state <= 1;
									ser_wr_state <= 1;
								end if;
								state <= "01";
							when others =>
						end case;
					elsif inputaddr = "001011111100000000" then
						case state is
							when "00" =>
								outputdata <= addr_BF00;
								if ser_rd_state = 5 then
									ser_rd_state <= 6;
								end if;
							when others =>
						end case;
					else
						ram_read(state,outputdata,ramdata,ramoe,ramwe,ramen);
					end if;

				elsif enwrite='0' then
					if inputaddr = "001011111100000000" then
						case state is
							when "00" =>
								addr_BF00 <= inputdata;
								if ser_wr_state = 2 then
									ser_wr_state <= 3;
								end if;
							when others =>
						end case;
					else
						ram_write(state,inputdata,ramdata,ramoe,ramwe,ramen);
					end if;
				end if;
				
				case ser_rd_state is
					when 0 =>
						addr_BF01(1) <= '0';
					when 1 =>
						ramoe <= '1';
						ramwe <= '1';
						ramen <= '1';
						ser_rd_state <= 2;
					when 2 =>
						rdn <= '1';
						ramdata <= (others => 'Z');
						ser_rd_state <= 3;
					when 3 =>
						if data_ready = '1' then
							ser_rd_state <= 4;
							rdn <= '0';
						else
							ser_rd_state <= 2;
						end if;
					when 4 =>
						addr_BF00 <= ramdata;
						addr_BF01(1) <= '1';
						rdn <= '1';
						ser_rd_state <= 5; --在执行LW BF00时，根据时序跳转到状态5
					when 6 =>
						ser_rd_state <= 0;
						ser_wr_state <= 0;
						addr_BF01(1) <= '0';
						addr_BF01(0) <= '0';
					when others =>
				end case;

				case ser_wr_state is
					when 0 =>
						addr_BF01(0) <= '0';
					when 1 =>
						ramoe <= '1';
						ramwe <= '1';
						ramen <= '1';
						addr_BF01(0) <= '1';
						ser_wr_state <= 2; --在执行SW BF00时，根据时序跳转到状态2
					when 3 =>
						rdn <= '1';
						ser_rd_state <= 0;
						addr_BF01(1) <= '0';
						ser_wr_state <= 4;
					when 4 =>
						ramdata <= addr_BF00;
						wrn <= '0';
						ser_wr_state <= 5;
					when 5 =>
						wrn <= '1';
						addr_BF01(0) <= '0';
						ser_wr_state <= 0;
					when others =>
				end case;
				
			else
				ram_read(state,outputins,ramdata,ramoe,ramwe,ramen);
			end if;
			cnt := cnt + 1;

		else
			cnt := 0;
			state <= "00";

		end if;
	
	end if;
end process;

end Behavioral;

