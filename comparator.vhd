----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:54:58 11/28/2019 
-- Design Name: 
-- Module Name:    comparator - Behavioral 
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

entity comparator is
port(
A: in std_logic_vector(3 downto 0);
B: in std_logic_vector(3 downto 0);
result: out std_logic_vector(3 downto 0)
);
end comparator;

architecture Behavioral of comparator is
signal ag: std_logic;
signal bg: std_logic;
signal eq: std_logic;
begin
ag <= (A(2) and (not B(2)))
		or ((A(2) xnor B(2)) and ((A(1) and (not B(1)))
			or (A(0) and (not B(1)) and (not B(0)))
			or (A(0) and A(1) and (not B(0)))));
bg <= (B(2) and (not A(2)))
		or ((A(2) xnor B(2)) and ((B(1) and (not A(1)))
			or (B(0) and (not A(1)) and (not A(0)))
			or (B(0) and B(1) and (not A(0)))));
eq <= (A(2) xnor B(2))
and ((not (A(0) or A(1) or B(0) or B(1)))
		or (A(0) and A(1) and B(0) and B(1))
		or (A(0) and B(0) and (not B(1)) and (not A(1)))
		or (A(1) and B(1) and (not A(0)) and (not B(0))));
process
begin
if (ag = '1') then
			result <= x"1";
elsif (bg = '1') then
			result <= x"2";
else
			result <= x"3";
end if;

end process;

end Behavioral;

