
-- VHDL Instantiation Created from source file scoreDecoder.vhd -- 00:51:32 11/29/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT scoreDecoder
	PORT(
		newclk : IN std_logic;
		binaryScore : IN std_logic_vector(3 downto 0);          
		hexaScore : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_scoreDecoder: scoreDecoder PORT MAP(
		newclk => ,
		binaryScore => ,
		hexaScore => 
	);


