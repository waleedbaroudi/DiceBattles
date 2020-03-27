
-- VHDL Instantiation Created from source file comparator.vhd -- 01:08:33 11/28/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT comparator
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);          
		result : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_comparator: comparator PORT MAP(
		A => ,
		B => ,
		result => 
	);


