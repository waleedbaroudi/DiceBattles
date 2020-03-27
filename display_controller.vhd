----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:08:09 11/29/2019 
-- Design Name: 
-- Module Name:    display_controller - Behavioral 
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

entity display_controller is
port( 
		sClk: in std_logic;
		P1S: in std_logic_vector(3 downto 0);
		P2S: in std_logic_vector(3 downto 0);
		P1T: in std_logic_vector(3 downto 0);
		P2T: in std_logic_vector(3 downto 0);
		HS: in std_logic_vector(3 downto 0);
		dA: out std_logic_vector(3 downto 0);
		dB: out std_logic_vector(3 downto 0);
		dC: out std_logic_vector(3 downto 0);
		dD: out std_logic_vector(3 downto 0);
		dE: out std_logic_vector(3 downto 0);
		dF: out std_logic_vector(3 downto 0);
		dG: out std_logic_vector(3 downto 0);
		mode: integer:=1;
		dH: out std_logic_vector(3 downto 0)
		);
end display_controller;

architecture Behavioral of display_controller is
signal currentA: std_logic_vector(3 downto 0);
signal currentB: std_logic_vector(3 downto 0);
signal currentC: std_logic_vector(3 downto 0);
signal currentD: std_logic_vector(3 downto 0);
signal currentE: std_logic_vector(3 downto 0);
signal currentF: std_logic_vector(3 downto 0);
signal currentG: std_logic_vector(3 downto 0);
signal currentH: std_logic_vector(3 downto 0);
signal temp: integer:=0;
begin

process
begin
if(mode = 1) then
	currentA <= p1t;
	currentB <= p2t;
	currentC <= x"c";
	currentD <= p1s;
	currentE <= x"a";
	currentF <= p2s;
	currentG <= x"c";
	currentH <= HS;
	temp<=0;
else
	currentE <= x"f";
	if(mode = 2) then
		currentD <= x"1";
	else
		currentD <= x"2";
	end if;
	if(rising_edge(sClk)) then
		if(temp = 0) then
		currentA <= x"1";
		temp <= 1;
		end if;
		if(currentA = x"1") then
			currentA <= x"d";
		elsif(currentA = x"d") then
			currentA <= x"c";
			currentB <= x"d";
		elsif(currentB = x"d") then
			currentB <= x"c";
			currentC <= x"d";
		elsif(currentC = x"d") then
			currentC <= x"c";
			currentF <= x"d";
		elsif(currentF = x"d") then
			currentF <= x"c";
			currentG <= x"d";
		elsif(currentG = x"d") then
			currentG <= x"c";
			currentH <= x"d";
		elsif(currentH = x"d") then
			currentH <= x"b";
		elsif(currentH = x"b") then
			currentH <= x"e";
		elsif(currentH = x"e") then
			currentH <= x"c";
			currentG <= x"e";
		elsif(currentG = x"e") then
			currentG<= x"c";
			currentF <= x"e";
		elsif(currentF = x"e") then
			currentF <= x"c";
			currentC <= x"e";
		elsif(currentC = x"e") then
			currentC <= x"c";
			currentB <= x"e";
		elsif(currentB = x"e") then
			currentB <= x"c";
			currentA <= x"e";
		elsif(currentA = x"e") then
			currentA <= x"1";
		end if;
	end if;
end if;

dA <= currentA;
dB <= currentB;
dC <= currentC;
dD <= currentD;
dE <= currentE;
dF <= currentF;
dG <= currentG;
dH <= currentH;
end process;

end Behavioral;

