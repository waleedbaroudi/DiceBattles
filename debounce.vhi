
-- VHDL Instantiation Created from source file debounce.vhd -- 00:32:30 11/28/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT debounce
	PORT(
		clk : IN std_logic;
		button : IN std_logic;          
		result : OUT std_logic
		);
	END COMPONENT;

	Inst_debounce: debounce PORT MAP(
		clk => ,
		button => ,
		result => 
	);


