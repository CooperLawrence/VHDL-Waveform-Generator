library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity counter is
port (
	en : in std_logic; --Enable
	clk : in std_logic; --Clock
	samples : in std_logic_vector(2 downto 0); --2^n samples per period (this might be wrong!)
	period : in std_logic_vector(9 downto 0); --Length of period (0 to 1023)
	address : out std_logic_vector(6 downto 0) --Address bus
	);
end counter;

architecture counterArch of counter is
  signal addresstmp: integer range 0 to 127;
begin
	--Count from 0 to 127, then roll over to 0
	process(clk, en, samples)
	begin
		if (en = '1') then
			if (clk'event and clk = '1') then
			  addresstmp <= addresstmp + (2 ** to_integer(unsigned(samples)));
				address <= std_logic_vector(to_unsigned(addresstmp, 7)); --Automatically rolls over from 127 to 0, and flips the carry bit
			end if;
		end if;
	end process;
end counterArch;