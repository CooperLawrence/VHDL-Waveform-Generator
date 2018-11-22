library ieee;
use ieee.std_logic_1164.all;

entity counter is
port (
	en : in std_logic; --Enable
	clk : in std_logic; --Clock
	samples : in std_logic_vector(2 downto 0) --Number of samples per period
	period : in std_logic_vector(9 downto 0) --Length of period
	address : out std_logic_vector(6 downto 0) --Address bus
	);
end counter

architecture counterArch is
begin
	--Count from 0 to 127, then roll over to 0
	process(clk, en)
	begin
		if (en = '1') then
			if (clk'event and clk = '1') then
				address <= address + (2 ** samples) after period ms --Automatically rolls over from 127 to 0, and flips the carry bit
				end if;
			end if;
		end if;
	end process;
end counterArch;