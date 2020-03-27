----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:30:07 11/27/2019 
-- Design Name: 
-- Module Name:    main - Behavioral 
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
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
	port(
clk: in std_logic;
highscore: in std_logic_vector(3 downto 0); 
player1b: in std_logic;
player2b: in std_logic;
reset: in std_logic;
SevenSegControlMod: out std_logic_vector (7 downto 0):=x"ff";
SevenSegBusMod: out std_logic_vector(7 downto 0)
);
end main;

architecture Behavioral of main is
-------------- SEVEN-SEGMENT COMPONENT-------------------------
	COMPONENT sevenSegment
		PORT(
			A : IN std_logic_vector(3 downto 0);
			B : IN std_logic_vector(3 downto 0);
			C : IN std_logic_vector(3 downto 0);
			D : IN std_logic_vector(3 downto 0);
			E : IN std_logic_vector(3 downto 0);
			F : IN std_logic_vector(3 downto 0);
			G : IN std_logic_vector(3 downto 0);
			H : IN std_logic_vector(3 downto 0);
			clk : IN std_logic;          
			SevenSegControl : OUT std_logic_vector(7 downto 0);
			SevenSegBus : OUT std_logic_vector(7 downto 0)
			);
	END COMPONENT;
-------------- CLOCK DIVIDER COMPONENT-------------------------
	COMPONENT clock_divider
	PORT(
		mclk : IN std_logic;
		mode : integer:=1;
		sclk : OUT std_logic
		);
	END COMPONENT;
-------------- SCORE DECODER COMPONENT-------------------------
	COMPONENT scoreDecoder
	PORT(
		newclk : IN std_logic;
		binaryScore : IN std_logic_vector(3 downto 0);          
		hexaScore : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
-------------- COMPARATOR COMPONENT-------------------------
	COMPONENT comparator
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);          
		result : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
-------------- DEBOUNCE COMPONENT-------------------------
		COMPONENT debounce
	PORT(
		clk : IN std_logic;
		button : IN std_logic;          
		result : OUT std_logic
		);
	END COMPONENT;
-------------- DISPLAY CONTROLLER COMPONENT-------------------------	
COMPONENT display_controller
	PORT(
		sClk : IN std_logic;
		P1S : IN std_logic_vector(3 downto 0);
		P2S : IN std_logic_vector(3 downto 0);
		P1T : IN std_logic_vector(3 downto 0);
		P2T : IN std_logic_vector(3 downto 0);
		HS : IN std_logic_vector(3 downto 0);
		mode: integer:=1;        
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
----------------------- SIGNAL -------------------------------
signal slowClock: std_logic;
signal slowerClock: std_logic;
signal victoryclk: std_logic;

signal player1throw: std_logic_vector(3 downto 0);
signal player2throw: std_logic_vector(3 downto 0);

signal player1score: std_logic_vector(3 downto 0);
signal player2score: std_logic_vector(3 downto 0);

signal player1button: std_logic;
signal player2button: std_logic;

signal rolling: std_logic:='0';
signal game_on_hold: std_logic;
signal game_over: integer:=0;
signal selected_mode: integer:=1;

signal display1: std_logic_vector(3 downto 0);
signal display2: std_logic_vector(3 downto 0);
signal display3: std_logic_vector(3 downto 0);
signal display4: std_logic_vector(3 downto 0);
signal display5: std_logic_vector(3 downto 0);
signal display6: std_logic_vector(3 downto 0);
signal display7: std_logic_vector(3 downto 0);
signal display8: std_logic_vector(3 downto 0);

signal higherscore: std_logic_vector(3 downto 0);
signal hexaHighScore: std_logic_vector(3 downto 0);
--------------------------------------------------------------
begin

process
begin

if(hexahighscore = x"c" or hexahighscore = x"0") then
	game_on_hold <= '1';
else
	game_on_hold <= '0';
end if;

if (rising_edge(slowClock)) then
if(reset='1') then
player1throw <= x"0";
player2throw <= x"0";
player1score <= x"0";
player2score <= x"0";
game_over <= 0;
selected_mode <= 1;
else
if(game_on_hold = '0') then
		if (player1score >= hexaHighScore) then
			game_over <= 2;
		elsif (player2score >= hexaHighScore) then
			game_over <= 3;
		else
			game_over <= 0;
		end if;
		if(game_over = 0) then
			selected_mode <= 1;
			if (player1button = '1') then
				if(player1throw = x"6") then
					player1throw <= x"1";
				else
					player1throw <= player1throw + x"1";
				end if;
			 end if;
			if (player2button = '1') then
				if(player2throw = x"6") then
					player2throw <= x"1";
				else
					player2throw <= player2throw + x"1";
				end if;
			 end if;
		---score increment-------
			if((rolling = '1') and ((player1button = '0') and (player2button = '0'))) then
				if(higherscore = x"1") then
					player1score <= player1score + x"1";
				elsif(higherscore = x"2") then
					player2score <= player2score + x"1";
				else
					player1score <= player1score + x"1";
					player2score <= player2score + x"1";
				end if;
				rolling <= '0';
			elsif((player1button = '1') or (player2button = '1')) then
				rolling <= '1';
				end if;
			if((player1score = hexahighscore - x"1") and (player2score = hexahighscore - x"1")) then
				player1score <= x"0";
				player2score <= x"0";
			end if;
		--------------------------
		elsif (game_over = 2)then
			selected_mode <= 2;
		elsif (game_over = 3)then
			selected_mode <= 3;
		end if;
	end if; 
end if;
end if;


end process;
--SEVEN SEGMNET INSTANCE
	sevensegment_instance: sevenSegment PORT MAP( 
		A => display1,
		B => display2,
		C => display3,
		D => display4,
		E => display5,
		F => display6,
		G => display7,
		H => display8,
		clk => clk,
		SevenSegControl => SevenSegControlMod,
		SevenSegBus => SevenSegBusMod
	);
--CLOCK DIVIDER INSTANCE
	Inst_clock_divider: clock_divider PORT MAP(
		mclk => clk,
		mode => 1,
		sclk => slowClock
	);
	flasher_clock_divider: clock_divider PORT MAP(
		mclk => clk,
		mode => 2,
		sclk => slowerClock
	);
	
	ending_clock_divider: clock_divider PORT MAP(
		mclk => clk,
		mode => 3,
		sclk => victoryclk
	);
--DEBOUNCE INSTANCES
	player1_debounce: debounce PORT MAP( --debouncing first player's button
		clk => clk,
		button => player1b,
		result => player1button
	);
	player2_debounce: debounce PORT MAP( --debouncing second player's button
		clk => clk,
		button => player2b,
		result => player2button
	);
--SCORE DECODER INSTANCE
	scoreDecoder_instance: scoreDecoder PORT MAP(
		newclk => slowerClock,
		binaryScore => highscore,
		hexaScore => hexaHighScore
	);
--COMPARATOR INSTANCE
	comparator_instance: comparator PORT MAP(
		A => player1throw,
		B => player2throw,
		result => higherscore
	);
--DISPLAY CONTROLLER INSTANCE
	Inst_display_controller: display_controller PORT MAP(
		sClk => victoryclk,
		P1S => player1score,
		P2S => player2score,
		P1T => player1throw,
		P2T => player2throw,
		HS => hexahighscore,
		mode => selected_mode,
		dA => display1,
		dB => display2,
		dC => display3,
		dD => display4,
		dE => display5,
		dF => display6,
		dG => display7,
		dH => display8
	);

end Behavioral;

