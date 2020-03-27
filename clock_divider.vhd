library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
port(
mclk: in std_logic;
mode: integer;
sclk: out std_logic
);
end clock_divider;

architecture Behavioral of clock_divider is
signal temp: std_logic :='0';
signal increment: integer:=100;
signal clkCounter: integer:=0;
begin
Process_clk: process(mclk)
begin
if(mode = 1) then
increment <= 100;
elsif(mode = 2) then
increment <= 4;
else
increment <= 40;
end if;
if(rising_edge(mclk)) then
clkCounter <= clkCounter + increment;
	if (clkCounter = 50000000) then
		temp <= not temp;
		clkCounter <= 0;
	end if;
end if;
end process;
sclk <= temp;

end Behavioral;
