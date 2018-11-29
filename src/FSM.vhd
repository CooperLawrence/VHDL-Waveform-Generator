library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM is
	port (
		clk: in std_logic;
		selection: in std_logic_vector(3 downto 0);
		period : in std_logic_vector(9 downto 0); --Length of period (0 to 1023)
		operation: out std_logic_vector (1 downto 0);
		pulse: out std_logic
	);
end FSM;

architecture FSM_arch of FSM is
	type states is (Sine, Triangle, Square, Special);
	signal CS: states;
	signal pulsetmp: std_logic;

begin
	--CS <= Sine;
	pulsetmp <= '0';
	
	process (CS, selection)
	begin
		case CS is
			when Sine =>
				if selection = "0001" then CS <= Sine;
				elsif selection = "0010" then CS <= Triangle;
				elsif selection = "0100" then CS <= Square;
				elsif selection = "1000" then CS <= Special;
				end if;

				operation <= "00";
			when Triangle =>
				if selection = "0001" then CS <= Sine;
				elsif selection = "0010" then CS <= Triangle;
				elsif selection = "0100" then CS <= Square;
				elsif selection = "1000" then CS <= Special;
				end if;

				operation <= "01";
			when Square =>
				if selection = "0001" then CS <= Sine;
				elsif selection = "0010" then CS <= Triangle;
				elsif selection = "0100" then CS <= Square;
				elsif selection = "1000" then CS <= Special;
				end if;

				operation <= "10";
			when Special =>
				if selection = "0001" then CS <= Sine;
				elsif selection = "0010" then CS <= Triangle;
				elsif selection = "0100" then CS <= Square;
				elsif selection = "1000" then CS <= Special;
				end if;
				
				operation <= "11";
			when others =>
			  if selection = "0001" then CS <= Sine;
				elsif selection = "0010" then CS <= Triangle;
				elsif selection = "0100" then CS <= Square;
				elsif selection = "1000" then CS <= Special;
				end if;

				operation <= "00";
		end case;
	end process;

	process (pulsetmp)
	begin
		pulsetmp <= not pulsetmp after (to_integer(unsigned(period)) / 2) * 1ms; --Manipulate the waveform period
		
		pulse <= pulsetmp;
	end process;
end FSM_arch;