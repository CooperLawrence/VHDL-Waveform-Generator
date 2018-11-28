library ieee;
use ieee.std_logic_1164.all;

entity FSM is
	port (
		clk: in std_logic;
		function: in std_logic_vector(3 downto 0);
		period : in std_logic_vector(9 downto 0) --Length of period (0 to 1023)
		operation: out std_logic_vector (1 downto 0);
		pulse: out std_logic
	);
end FSM;

architecture FSM_arch of FSM is
	type states is (Sine, Triangle, Square, Special);
	signal CS: states;

	signal clockcount: 
begin
	CS <= Sine;
	process (CS, function)
	begin
		case CS is
			when Sine =>
				if function = "0001" then CS <= Sine;
				elsif function = "0010" then CS <= Triangle;
				elsif function = "0100" then CS <= Square;
				elsif function = "1000" then CS <= Special;
				end if;

				operation <= "00";
			when Triangle =>
				if function = "0001" then CS <= Sine;
				elsif function = "0010" then CS <= Triangle;
				elsif function = "0100" then CS <= Square;
				elsif function = "1000" then CS <= Special;
				end if;

				operation <= "01";
			when Square =>
				if function = "0001" then CS <= Sine;
				elsif function = "0010" then CS <= Triangle;
				elsif function = "0100" then CS <= Square;
				elsif function = "1000" then CS <= Special;
				end if;

				operation <= "10";
			when Special =>
				if function = "0001" then CS <= Sine;
				elsif function = "0010" then CS <= Triangle;
				elsif function = "0100" then CS <= Square;
				elsif function = "1000" then CS <= Special;
				end if;

				operation <= "11";
		end case;
	end process;

	process (pulse)
	begin
		pulse <= not pulse after period/2 ms; --Manipulate the waveform period
	end process;
end FSM_arch;