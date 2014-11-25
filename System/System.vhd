----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:33:54 11/25/2013 
-- Design Name: 
-- Module Name:    System - Behavioral 
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

--系统顶层
entity System is
   Port ( 
		--insaddr	: out		std_logic_vector(17 downto 0);	--指令地址
      --insdata	: inout	std_logic_vector(15 downto 0);	--指令数据
      --insoe		: out		std_logic;								--指令控制使能
      --insen		: out		std_logic;
      --inswe		: out		std_logic;
      ramaddr		: out		std_logic_vector(17 downto 0);	--内存地址
      ramdata		: inout	std_logic_vector(15 downto 0);	--内存数据
      ramoe			: out		std_logic;								--内存控制使能
      ramen			: out		std_logic;
      ramwe			: out		std_logic;
		rdn			: out		std_logic;
		wrn			: out		std_logic;
		tbre			: in		std_logic;
		tsre			: in		std_logic;
		data_ready	: in		std_logic;
      clk			: in		std_logic;								--时钟1
		--clk2		: in		std_logic;								--时钟2
      rst			: in		std_logic;								--重置
		
		scan			: in		std_logic;
		R				: out		std_logic_vector(2 downto 0);
		G				: out		std_logic_vector(2 downto 0);
		B				: out		std_logic_vector(2 downto 0);
		Hs				: out		std_logic;
		Vs				: out		std_logic;
		--for test--
		out1			: out		std_logic_vector(15 downto 0)
		--out2		: out		std_logic_vector(15 downto 0)
	);
end System;

architecture Behavioral of System is

--运算器
component ALU is
   Port ( 
		inputA	: in	std_logic_vector(15 downto 0);
      inputB	: in	std_logic_vector(15 downto 0);
      op			: in	std_logic_vector(3 downto 0);
      output 	: out	std_logic_vector(15 downto 0);
		signflag	: out std_logic;
      zeroflag	: out	std_logic
	);
end component;

--加法器
component Adder is
   Port ( 
		inputA	: in	std_logic_vector(15 downto 0);
      inputB	: in	std_logic_vector(15 downto 0);
      output	: out	std_logic_vector(15 downto 0);
		en			: in	std_logic
	);
end component;

--插入气泡控制器
component BubbleController is
   Port (
		next_PC	: in	std_logic_vector(15 downto 0);
		order_PC	: in	std_logic_vector(15 downto 0);
		bubble	: out std_logic
	);
end component;

--分频工具
component Clock is
	Port(
		clk_in	: in	std_logic;
		clk_out	: out	std_logic
	);
end component;

--生成控制信号
component Decoder is
   Port ( 
		input	: in	std_logic_vector(15 downto 0);
      exe	: out	std_logic_vector(10 downto 0);
      mem	: out	std_logic_vector(11 downto 0);
      wb		: out	std_logic_vector(3 downto 0)
	);
end component;

--解决数据冲突而采用的旁路
component Feedback is
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
end component;

--跳转选择器
component Jumper is
   Port (
		tojump_ins 	: in	std_logic_vector(15 downto 0);
      order_ins 	: in	std_logic_vector(15 downto 0);
      return_ins 	: in	std_logic_vector(15 downto 0);
      data 			: in	std_logic_vector(15 downto 0);
      T_flag 		: in	std_logic_vector(15 downto 0);
		control		: in	std_logic_vector(3 downto 0);
      next_ins 	: out	std_logic_vector(15 downto 0)
	);
end component;

--主存
component MemoryController is
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
end component;

--寄存器堆
component RegisterHeap is
   Port ( 
		readreg1	: in	std_logic_vector(2 downto 0);
      readreg2	: in	std_logic_vector(2 downto 0);
      writereg	: in	std_logic_vector(2 downto 0);
      writedata: in	std_logic_vector(15 downto 0);
      dataout1	: out	std_logic_vector(15 downto 0);
      dataout2	: out	std_logic_vector(15 downto 0);
      en			: in	std_logic;
		en_write	: in	std_logic;
		en_read	: in	std_logic;
      clk		: in	std_logic;
      rst		: in	std_logic
	);
end component;

--符号扩展
component SignExtender is
   Port ( 
		in10to0	: in	std_logic_vector(10 downto 0);
      in7to0	: in	std_logic_vector(7 downto 0);
      in4to0	: in	std_logic_vector(4 downto 0);
      in3to0	: in	std_logic_vector(3 downto 0);
      out10to0	: out	std_logic_vector(15 downto 0);
      out7to0	: out	std_logic_vector(15 downto 0);
      out4to0	: out	std_logic_vector(15 downto 0);
      out3to0	: out	std_logic_vector(15 downto 0)
	);
end component;

--特殊单个寄存器
component Singleregister is
	Port ( 
		input	: in	std_logic_vector(15 downto 0);
      output: out	std_logic_vector(15 downto 0);
      en		: in	std_logic;
		r_en	: in	std_logic;
		w_en	: in	std_logic;
      clk	: in	std_logic;
      rst	: in	std_logic
	);
end component;

--VGA--
component VGA is
   Port (
		clk : in  std_logic;
      rst : in  std_logic;
      R : out	std_logic_vector(2 downto 0);
      G : out  std_logic_vector(2 downto 0);
      B : out  std_logic_vector(2 downto 0);
      Hs : out  std_logic;
      Vs : out  std_logic
	);
end component;

--零扩展
component ZeroExtender is
   Port ( 
		in7to0	: in	std_logic_vector(7 downto 0);
      in4to2	: in	std_logic_vector(4 downto 2);
      out7to0	: out	std_logic_vector(15 downto 0);
      out4to2	: out	std_logic_vector(15 downto 0)
	);
end component;

--IF-ID锁存器
component IF_ID is
   Port ( 
		PC_in		: in	std_logic_vector(15 downto 0);
      ins_in	: in	std_logic_vector(15 downto 0);
      PC_out	: out	std_logic_vector(15 downto 0);
      ins_out	: out	std_logic_vector(15 downto 0);
      en			: in	std_logic;
      clk		: in	std_logic;
      rst		: in	std_logic
	);
end component;

--ID-EXE锁存器
component ID_EXE is
   Port ( 
		wb_in		: in	std_logic_vector(3 downto 0);
      mem_in	: in	std_logic_vector(11 downto 0);
      exe_in	: in	std_logic_vector(10 downto 0);
      PC_in		: in	std_logic_vector(15 downto 0);
      s10_0_in	: in	std_logic_vector(15 downto 0);
      z4_2_in	: in	std_logic_vector(15 downto 0);
      data1_in	: in	std_logic_vector(15 downto 0);
      data2_in	: in	std_logic_vector(15 downto 0);
      RA_in		: in	std_logic_vector(15 downto 0);
      SP_in		: in	std_logic_vector(15 downto 0);
      IH_in		: in	std_logic_vector(15 downto 0);
      z7_0_in	: in	std_logic_vector(15 downto 0);
      s7_0_in	: in	std_logic_vector(15 downto 0);
      s4_0_in	: in	std_logic_vector(15 downto 0);
      s3_0_in	: in	std_logic_vector(15 downto 0);
      r10_8_in	: in	std_logic_vector(2 downto 0);
      r7_5_in	: in	std_logic_vector(2 downto 0);
      r4_2_in	: in	std_logic_vector(2 downto 0);
      wb_out	: out	std_logic_vector(3 downto 0);
      mem_out	: out	std_logic_vector(11 downto 0);
      exe_out	: out	std_logic_vector(10 downto 0);
      PC_out	: out	std_logic_vector(15 downto 0);
      s10_0_out: out	std_logic_vector(15 downto 0);
      z4_2_out	: out	std_logic_vector(15 downto 0);
      data1_out: out	std_logic_vector(15 downto 0);
      data2_out: out	std_logic_vector(15 downto 0);
      RA_out	: out	std_logic_vector(15 downto 0);
      SP_out	: out	std_logic_vector(15 downto 0);
      IH_out	: out	std_logic_vector(15 downto 0);
      z7_0_out	: out	std_logic_vector(15 downto 0);
      s7_0_out	: out	std_logic_vector(15 downto 0);
      s4_0_out	: out	std_logic_vector(15 downto 0);
      s3_0_out	: out	std_logic_vector(15 downto 0);
      r10_8_out: out	std_logic_vector(2 downto 0);
      r7_5_out	: out	std_logic_vector(2 downto 0);
      r4_2_out	: out	std_logic_vector(2 downto 0);
      en			: in	std_logic;
      clk		: in	std_logic;
      rst		: in	std_logic
	);
end component;

--ID阶段插气泡
component ID_bubble is
   Port (
		exe_in 	: in	std_logic_vector(10 downto 0);
      mem_in 	: in	std_logic_vector(11 downto 0);
      wb_in 	: in	std_logic_vector(3 downto 0);
      exe_out 	: out	std_logic_vector(10 downto 0);
      mem_out 	: out	std_logic_vector(11 downto 0);
      wb_out 	: out	std_logic_vector(3 downto 0);
      bubble 	: in	std_logic
	);
end component;

--EXE-MEM锁存器
component EXE_MEM is
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
end component;

--EXE阶段插气泡
component EXE_bubble is
   Port (
		mem_in	: in	std_logic_vector(11 downto 0);
      wb_in		: in	std_logic_vector(3 downto 0);
      mem_out	: out	std_logic_vector(11 downto 0);
      wb_out	: out	std_logic_vector(3 downto 0);
      bubble	: in	std_logic
	);
end component;

--MEM-WB锁存器
component MEM_WB is
   Port ( 
		wb_in		: in	std_logic_vector(3 downto 0);
		data_in	: in	std_logic_vector(15 downto 0);
		addr_in	: in	std_logic_vector(2 downto 0);
      wb_out	: out	std_logic_vector(3 downto 0);
		data_out	: out	std_logic_vector(15 downto 0);
		addr_out	: out	std_logic_vector(2 downto 0);
      en			: in	std_logic;
      clk		: in	std_logic;
      rst		: in	std_logic
	);
end component;

--tmp--
component ROM is
	Port(
		addr	: in	std_logic_vector(17 downto 0);
		data	: out	std_logic_vector(15 downto 0)
	);
end component;

--general--
signal const1:		std_logic_vector(15 downto 0);
signal en_open:	std_logic:='1';
--clock--
signal clk1:		std_logic:='0';
--if--
signal PC_back:	std_logic_vector(15 downto 0):="0000000000000000";
signal PC:			std_logic_vector(15 downto 0);
signal ins_addr:	std_logic_vector(17 downto 0);
signal ins_if:		std_logic_vector(15 downto 0);
signal PC_if:		std_logic_vector(15 downto 0);

--id--
signal PC_id:		std_logic_vector(15 downto 0);
signal ins_id:		std_logic_vector(15 downto 0);
signal wbc:			std_logic_vector(3 downto 0);
signal memc:		std_logic_vector(11 downto 0);
signal exec:		std_logic_vector(10 downto 0);
signal wbc_id:		std_logic_vector(3 downto 0);
signal memc_id:	std_logic_vector(11 downto 0);
signal exec_id:	std_logic_vector(10 downto 0);
signal s10_0_id:	std_logic_vector(15 downto 0);
signal z4_2_id:	std_logic_vector(15 downto 0);
signal z7_0_id:	std_logic_vector(15 downto 0);
signal s3_0_id:	std_logic_vector(15 downto 0);
signal s4_0_id:	std_logic_vector(15 downto 0);
signal s7_0_id:	std_logic_vector(15 downto 0);
signal data1_id:	std_logic_vector(15 downto 0);
signal data2_id:	std_logic_vector(15 downto 0);
signal RA_id:		std_logic_vector(15 downto 0);
signal SP_id:		std_logic_vector(15 downto 0);
signal IH_id:		std_logic_vector(15 downto 0);

--exe--
signal wbc_e_in:	std_logic_vector(3 downto 0);
signal memc_e_in:	std_logic_vector(11 downto 0);
signal wbc_exe:	std_logic_vector(3 downto 0);
signal memc_exe:	std_logic_vector(11 downto 0);
signal exec_exe:	std_logic_vector(10 downto 0);
signal PC_exe:		std_logic_vector(15 downto 0);
signal s10_0_exe:	std_logic_vector(15 downto 0);
signal z4_2_exe:	std_logic_vector(15 downto 0);
signal data1_exe:	std_logic_vector(15 downto 0);
signal data2_exe:	std_logic_vector(15 downto 0);
signal RA_exe:		std_logic_vector(15 downto 0);
signal SP_exe:		std_logic_vector(15 downto 0);
signal IH_exe:		std_logic_vector(15 downto 0);
signal z7_0_exe:	std_logic_vector(15 downto 0);
signal s3_0_exe:	std_logic_vector(15 downto 0);
signal s4_0_exe:	std_logic_vector(15 downto 0);
signal s7_0_exe:	std_logic_vector(15 downto 0);
signal r10_8_exe:	std_logic_vector(2 downto 0);
signal r7_5_exe:	std_logic_vector(2 downto 0);
signal r4_2_exe:	std_logic_vector(2 downto 0);
signal bias:		std_logic_vector(15 downto 0);
signal jump_exe:	std_logic_vector(15 downto 0);
signal op_1:		std_logic_vector(15 downto 0);
signal op_2:		std_logic_vector(15 downto 0);
signal ALU_exe:	std_logic_vector(15 downto 0);
signal zflag:		std_logic;
signal sflag:		std_logic;
signal T_exe:		std_logic_vector(15 downto 0);	--认为T寄存器在exe_mem之间

signal data1_c:	std_logic_vector(1 downto 0);
signal data2_c:	std_logic_vector(1 downto 0);
signal RA_c:		std_logic_vector(1 downto 0);
signal IH_c:		std_logic_vector(1 downto 0);
signal SP_c:		std_logic_vector(1 downto 0);
signal data1_u:	std_logic_vector(15 downto 0);
signal data2_u:	std_logic_vector(15 downto 0);
signal RA_u:		std_logic_vector(15 downto 0);
signal IH_u:		std_logic_vector(15 downto 0);
signal SP_u:		std_logic_vector(15 downto 0);

--mem--
signal bubble:		std_logic:='0';
signal wbc_mem:	std_logic_vector(3 downto 0);
signal memc_mem:	std_logic_vector(11 downto 0);
signal jump_mem:	std_logic_vector(15 downto 0);
signal PC_mem:		std_logic_vector(15 downto 0);
signal T_mem:		std_logic_vector(15 downto 0);
signal ALU_mem:	std_logic_vector(15 downto 0);
signal data1_mem:	std_logic_vector(15 downto 0);
signal data2_mem:	std_logic_vector(15 downto 0);
signal RA_mem:		std_logic_vector(15 downto 0);
signal IH_mem:		std_logic_vector(15 downto 0);
signal r10_8_mem:	std_logic_vector(2 downto 0);
signal r7_5_mem:	std_logic_vector(2 downto 0);
signal r4_2_mem:	std_logic_vector(2 downto 0);
signal read_data:	std_logic_vector(15 downto 0);
signal write_data:std_logic_vector(15 downto 0);
signal ram_addr:	std_logic_vector(17 downto 0);
signal data_mem:	std_logic_vector(15 downto 0);
signal addr_mem:	std_logic_vector(2 downto 0);

--wb--
signal wbc_wb:		std_logic_vector(3 downto 0);
signal addr_wb:	std_logic_vector(2 downto 0);
signal data_wb:	std_logic_vector(15 downto 0);
--en--
signal en_PC:		std_logic:='0';
signal en_if_id:	std_logic:='0';
signal en_id_exe:	std_logic:='0';
signal en_exe_mem:std_logic:='0';
signal en_mem_wb:	std_logic:='0';

--test--
--signal fortest:	std_logic:='0';

begin


--for test--
--注意，以下代码是我们程序的灵魂--
--process (memc_mem)
--begin
	--if falling_edge(memc_mem(11)) then
		--fortest<='1';
		--fortest<='1';
		--fortest<='1';
	--end if;
--end process;

VGA_part: VGA port map(
	scan,rst,R,G,B,Hs,Vs
);

out1<=PC;--fortest&memc_mem(11 downto 9)&PC(11 downto 0);

gen_clock: Clock port map(
	clk,clk1
);

--const--
const1<="0000000000000001";
en_open<='0';

--if--
ins_addr<="00"&PC(15 downto 0);

PC_adder: Adder port map(
	const1,PC,PC_if,en_open
);

PC_register: Singleregister port map(
	PC_back,PC,not memc_mem(11),en_open,en_open,clk1,rst
);

	--tmp--
--ins_mem: ROM port map(
	--ins_addr,ins_if
--);

--if_id--
if_id_part: IF_ID port map(
	PC_if,ins_if,PC_id,ins_id,not memc_mem(11),clk1,rst
);

--id--
control:	Decoder port map(
	ins_id,exec,memc,wbc
);

id_bubble_control: ID_bubble port map(
	exec,memc,wbc,exec_id,memc_id,wbc_id,bubble
);

registers: RegisterHeap port map(
	ins_id(10 downto 8),ins_id(7 downto 5),addr_wb,data_wb,
	data1_id,data2_id,en_open,wbc_wb(0),en_open,clk1,rst
);

sign_extender: SignExtender port map(
	ins_id(10 downto 0),ins_id(7 downto 0),ins_id(4 downto 0),ins_id(3 downto 0),
	s10_0_id,s7_0_id,s4_0_id,s3_0_id
);

zero_extender: ZeroExtender port map(
	ins_id(7 downto 0),ins_id(4 downto 2),z7_0_id,z4_2_id
);

RA_register: Singleregister port map(
	data_wb,RA_id,en_open,en_open,wbc_wb(3),clk1,rst
);

SP_register: Singleregister port map(
	data_wb,SP_id,en_open,en_open,wbc_wb(1),clk1,rst
);

IH_register: Singleregister port map(
	data_wb,IH_id,en_open,en_open,wbc_wb(2),clk1,rst
);

--id_exe--
id_exe_part: ID_EXE port map(
	wbc_id,memc_id,exec_id,PC_id,s10_0_id,z4_2_id,data1_id,data2_id,RA_id,SP_id,IH_id,z7_0_id,s7_0_id,s4_0_id,s3_0_id,ins_id(10 downto 8),ins_id(7 downto 5),ins_id(4 downto 2),
	wbc_e_in,memc_e_in,exec_exe,PC_exe,s10_0_exe,z4_2_exe,data1_exe,data2_exe,RA_exe,SP_exe,IH_exe,z7_0_exe,s7_0_exe,s4_0_exe,s3_0_exe,r10_8_exe,r7_5_exe,r4_2_exe,
	en_id_exe,clk1,rst
);

--exe--
exe_bubble_controller: EXE_bubble port map(
	memc_e_in,wbc_e_in,memc_exe,wbc_exe,bubble
);

PC_jumper: Adder port map(
	PC_exe,bias,jump_exe,en_open
);

ALU_unit: ALU port map(
	op_1,op_2,exec_exe(3 downto 0),ALU_exe,sflag,zflag
);

bias_calc:process(s10_0_exe,s7_0_exe,exec_exe)
begin
	case exec_exe(10 downto 9) is
		when "00"=> 	bias<=s7_0_exe;
		when others=> 	bias<=s10_0_exe;
	end case;
end process;

mux1:process(data1_u,SP_u,z4_2_exe,exec_exe)
begin
	case exec_exe(8 downto 7) is
		when "00"=>	op_1<=data1_u;
		when "01"=> op_1<=SP_u;
		when "10"=> op_1<=z4_2_exe;
		when others=>op_1<="0000000000000000";
	end case;
end process;

mux2:process(data2_u,s3_0_exe,s4_0_exe,s7_0_exe,z7_0_exe,exec_exe)
begin
	case exec_exe(6 downto 4) is
		when "000"=> op_2<=data2_u;
		when "001"=> op_2<=s3_0_exe;
		when "010"=> op_2<=s4_0_exe;
		when "011"=> op_2<=s7_0_exe;
		when others=>op_2<=z7_0_exe;
	end case;
end process;

T_register:process(zflag)	--写入T寄存器
begin
	if zflag='0' then
		T_exe<="0000000000000000";
	else
		T_exe<="0000000000000001";
	end if;
end process;

--exe_mem--
exe_mem_part: EXE_MEM port map(
	wbc_exe,memc_exe,jump_exe,PC_exe,T_exe,ALU_exe,data1_u,data2_u,RA_u,IH_u,r10_8_exe,r7_5_exe,r4_2_exe,
	wbc_mem,memc_mem,jump_mem,PC_mem,T_mem,ALU_mem,data1_mem,data2_mem,RA_mem,IH_mem,r10_8_mem,r7_5_mem,r4_2_mem,
	en_exe_mem,clk1,rst
);

branch: Feedback port map(
	wbc_mem,addr_mem,wbc_wb,addr_wb,r10_8_exe,r7_5_exe,
	RA_c,SP_c,IH_c,data1_c,data2_c
);

data1_control:process(data1_c,data1_exe,data_mem,data_wb)
begin
	if data1_c(0)='0' then
		data1_u<=data_mem;
	elsif data1_c(1)='0' then
		data1_u<=data_wb;
	else
		data1_u<=data1_exe;
	end if;
end process;

data2_control:process(data2_c,data2_exe,data_mem,data_wb)
begin
	if data2_c(0)='0' then
		data2_u<=data_mem;
	elsif data2_c(1)='0' then
		data2_u<=data_wb;
	else
		data2_u<=data2_exe;
	end if;
end process;

RA_control:process(RA_c,RA_exe,data_mem,data_wb)
begin
	if RA_c(0)='0' then
		RA_u<=data_mem;
	elsif RA_c(1)='0' then
		RA_u<=data_wb;
	else
		RA_u<=RA_exe;
	end if;
end process;

IH_control:process(IH_c,IH_exe,data_mem,data_wb)
begin
	if IH_c(0)='0' then
		IH_u<=data_mem;
	elsif IH_c(1)='0' then
		IH_u<=data_wb;
	else
		IH_u<=IH_exe;
	end if;
end process;

SP_control:process(SP_c,SP_exe,data_mem,data_wb)
begin
	if SP_c(0)='0' then
		SP_u<=data_mem;
	elsif SP_c(1)='0' then
		SP_u<=data_wb;
	else
		SP_u<=SP_exe;
	end if;
end process;

--mem--
jump_controller: Jumper port map(
	jump_mem,PC_if,RA_mem,data1_mem,T_mem,memc_mem(7 downto 4),PC_back
);

bubble_control: BubbleController port map(
	PC_back,PC_if,bubble
);

ram_addr<="00"&ALU_mem;

--dataram: Memory port map(
--	ram_addr,write_data,read_data,memc_mem(9),memc_mem(10),memc_mem(11),
--	ramaddr,ramdata,ramoe,ramen,ramwe,rdn,wrn,tbre,tsre,data_ready,clk,rst		--时钟有待调整
--);

dataram: MemoryController port map(
	ins_addr,ram_addr,write_data,read_data,ins_if,memc_mem(9),memc_mem(10),memc_mem(11),
	ramaddr,ramdata,ramoe,ramen,ramwe,rdn,wrn,tbre,tsre,data_ready,clk,rst
);

choose_data:process(data1_mem,data2_mem,memc_mem)
begin
	if memc_mem(8)='1' then
		write_data<=data2_mem;
	else
		write_data<=data1_mem;
	end if;
end process;

choosen_data_back:process(ALU_mem,IH_mem,read_data,PC_mem,memc_mem)
begin
	case memc_mem(3 downto 2) is
		when"00"		=>data_mem<=ALU_mem;
		when"01"		=>data_mem<=IH_mem;
		when"10"		=>data_mem<=read_data;
		when others	=>data_mem<=PC_mem;
	end case;
end process;

choose_addr_back:process(r10_8_mem,r7_5_mem,r4_2_mem,memc_mem)
begin
	case memc_mem(1 downto 0) is
		when"00"		=>addr_mem<=r10_8_mem;
		when"01"		=>addr_mem<=r7_5_mem;
		when others	=>addr_mem<=r4_2_mem;
	end case;
end process;

--mem_wb--
mem_wb_part: MEM_WB port map(
	wbc_mem,data_mem,addr_mem,
	wbc_wb,data_wb,addr_wb,
	en_mem_wb,clk1,rst
);

end Behavioral;