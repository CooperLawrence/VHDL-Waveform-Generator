library ieee;
use ieee.std_logic_1164.all;

entity datalatch is
	port (
		clk: in std_logic;
		d: in std_logic_vector(31 downto 0);

		q: out std_logic_vector(31 downto 0)
	);
end datalatch;

--32-bit d flip-flop
architecture datalatcharch of datalatch is
begin
	process(clk)
	begin
		if (clk'event and clk = '1') then
			q <= d;
		end if;
	end process;
end datalatcharch;