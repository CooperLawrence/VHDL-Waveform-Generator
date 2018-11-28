library ieee;
use ieee.std_logic_1164.all;

entity top is
	port (
		clock_50: in std_logic; --Clock
		sw: in std_logic_vector(17 downto 0);
		key: in std_logic_vector(3 downto 0);

		vout: out std_logic_vector(31 downto 0) --find altera dac pin(s)
	);
end top;

architecture toparch is
	signal functionbus: std_logic_vector(1 downto 0);
	singnal addressbus: std_logic_vector(6 downto 0);
	signal databus: std_logic_vector(31 downto 0);
	signal counterclk: std_logic;
	
	component fsm
		port (
			function: in std_logic_vector(1 downto 0);
			operation: out std_logic_vector(1 downto 0)
		);
	end component;

	component counter
		port (
			en: in std_logic;
			clk: in std_logic;
			samples: in std_logic_vector(2 downto 0);
			period: in std_logic_vector(9 downto 0);
			address: out std_logic_vector(6 downto 0)
		);
	end component;

	component memory
		port (
			function: in std_logic_vector(1 downto 0);
			address: in std_logic_vector(6 downto 0);
			data: out std_logic_vector(31 downto 0);
		);
	end component;

	component datalatch
		port (
			clk: in std_logic;
			d: in std_logic_vector(31 downto 0);
			q: out std_logic_vector(31 downto 0)
		);
	end component;

begin
	c1: fsm port map(clock_50, key(3 downto 0), sw(12 downto 3), functionbus(1 downto 0), counterclock);
	c2: counter port map(sw(17), counterclock, sw(2 downto 0), addressbus);
	c3: memory port map(functionbus(1 downto 0), addressbus(6 downto 0), databus(31 downto 0));
	c4: datalatch port map(counterclk, databus(31 downto 0), vout(31 downto 0));
end toparch;