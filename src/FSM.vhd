library ieee;
use ieee.std_logic_1164.all;

entity FSM is
	port (
		selection: in std_logic_vector(1 downto 0);
		operation: out std_logic_vector (1 downto 0);
	);
end FSM;

architecture FSM_arch of FSM is
	type states is (Sine, Triangle, Square, Special);
	signal CS, NS: states;
	signal sel: std_logic_vector(1 downto 0);
begin
CS <= Sine;	
process (CS) 
begin
	case CS is
		when Sine =>
			if sel = '00' then NS <= Sine;
			elsif sel = '01' then NS <= Triangle;
			elsif sel= '10' then NS <= Square;
			else NS <= Special;
			end if;
			operation <= '00';
		when Triangle =>
			if sel = '00' then NS <= Sine;
			elsif sel = '01' then NS <= Triangle;
			elsif sel= '10' then NS <= Square;
			else NS <= Special;
			end if;
			operation <= '01';
		when Square =>
			if sel = '00' then NS <= Sine;
			elsif sel = '01' then NS <= Triangle;
			elsif sel= '10' then NS <= Square;
			else NS <= Special;
			end if;
			operation <= '10';
		when Special =>
			if sel = '00' then NS <= Sine;
			elsif sel = '01' then NS <= Triangle;
			elsif sel= '10' then NS <= Square;
			else NS <= Special;
			end if;
			operation <= '11';
	end case;
end process;
end FSM_arch;
			
			

	
