
-- VHDL Instantiation Created from source file display_controller.vhd -- 03:33:41 11/29/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT display_controller
	PORT(
		sClk : IN std_logic;
		P1S : IN std_logic_vector(3 downto 0);
		P2S : IN std_logic_vector(3 downto 0);
		P1T : IN std_logic_vector(3 downto 0);
		P2T : IN std_logic_vector(3 downto 0);
		HS : IN std_logic_vector(3 downto 0);
		mode : IN std_logic;          
		dA : OUT std_logic_vector(3 downto 0);
		dB : OUT std_logic_vector(3 downto 0);
		dC : OUT std_logic_vector(3 downto 0);
		dD : OUT std_logic_vector(3 downto 0);
		dE : OUT std_logic_vector(3 downto 0);
		dF : OUT std_logic_vector(3 downto 0);
		dG : OUT std_logic_vector(3 downto 0);
		dH : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_display_controller: display_controller PORT MAP(
		sClk => ,
		P1S => ,
		P2S => ,
		P1T => ,
		P2T => ,
		HS => ,
		dA => ,
		dB => ,
		dC => ,
		dD => ,
		dE => ,
		dF => ,
		dG => ,
		mode => ,
		dH => 
	);


