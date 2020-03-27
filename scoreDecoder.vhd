----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:42:01 11/27/2019 
-- Design Name: 
-- Module Name:    scoreDecoder - Behavioral 
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

entity scoreDecoder is
port(
newclk: in std_logic;
binaryScore: in std_logic_vector(3 downto 0);
hexaScore: out std_logic_vector(3 downto 0)
);
end scoreDecoder;

architecture Behavioral of scoreDecoder is
signal returned_score: std_logic_vector(3 downto 0);
signal temp: std_logic:= '0';
begin
process
begin

if (binaryScore = "0001") then
	returned_score <= x"1";
elsif (binaryScore = "0010") then
	returned_score <= x"2";
elsif (binaryScore = "0011") then
	returned_score <= x"3";
elsif (binaryScore = "0100") then
	returned_score <= x"4";
elsif (binaryScore = "0101") then
	returned_score <= x"5";
elsif (binaryScore = "0110") then
	returned_score <= x"6";
elsif (binaryScore = "0111") then
	returned_score <= x"7";
elsif (binaryScore = "1000") then
	returned_score <= x"8";
elsif (binaryScore = "1001") then
	returned_score <= x"9";
else
	if(rising_edge(newclk)) then
		if(temp = '1') then
			returned_score <= x"c";
		else
			returned_score <= x"0";
		end if;
	temp <= not temp;
	end if;
end if;

hexaScore <= returned_score;
end process;
end Behavioral;

