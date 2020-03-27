
-- VHDL Instantiation Created from source file clock_divider.vhd -- 01:29:32 11/29/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT clock_divider
	PORT(
		mclk : IN std_logic;
		mode : IN std_logic;          
		sclk : OUT std_logic
		);
	END COMPONENT;

	Inst_clock_divider: clock_divider PORT MAP(
		mclk => ,
		mode => ,
		sclk => 
	);


