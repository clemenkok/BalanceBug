-- Legal Notice: (C)2006 Altera Corporation. All rights reserved.  Your
-- use of Altera Corporation's design tools, logic functions and other
-- software and tools, and its AMPP partner logic functions, and any
-- output files any of the foregoing (including device programming or
-- simulation files), and any associated documentation or information are
-- expressly subject to the terms and conditions of the Altera Program
-- License Subscription Agreement or other applicable license agreement,
-- including, without limitation, that your use is for the sole purpose
-- of programming logic devices manufactured by Altera and sold by Altera
-- or its authorized distributors.  Please refer to the applicable
-- agreement for further details.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE STD.textio.ALL;

entity alt_cusp150_sync is 
port (
    signal reset : IN STD_LOGIC;
    signal clk : IN STD_LOGIC;
    signal data_in : IN STD_LOGIC;
    signal data_out : OUT STD_LOGIC
);
end entity;

architecture cusp of alt_cusp150_sync is
    signal data_in_d1 :  STD_LOGIC;
    attribute ALTERA_ATTRIBUTE : string;
    attribute ALTERA_ATTRIBUTE of data_in_d1 : signal is "MAX_DELAY=100ns ; PRESERVE_REGISTER=ON";
    attribute ALTERA_ATTRIBUTE of data_out : signal is "PRESERVE_REGISTER=ON";
begin
    process (clk, reset)
    begin
        if reset = '1' then
            data_in_d1 <= std_logic'('0');
        elsif Rising_edge(clk) then
            data_in_d1 <= data_in;
        end if;
    end process;

    process (clk, reset)
    begin
        if reset = '1' then
            data_out <= std_logic'('0');
        elsif Rising_edge(clk) then
            data_out <= data_in_d1;
        end if;
    end process;
end;

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE STD.textio.ALL;

entity alt_cusp150_sync_vec is 
generic (
    WIDTH : INTEGER := 2
);
port (
    signal reset : IN STD_LOGIC;
    signal clk : IN STD_LOGIC;
    signal data_in : IN STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    signal data_out : OUT STD_LOGIC_VECTOR(WIDTH-1 downto 0)
);
end entity;

architecture cusp of alt_cusp150_sync_vec is
    signal data_in_d1 : STD_LOGIC_VECTOR(WIDTH-1 downto 0);
    attribute ALTERA_ATTRIBUTE : string;
    attribute ALTERA_ATTRIBUTE of data_in_d1 : signal is "MAX_DELAY=100ns ; PRESERVE_REGISTER=ON";
    attribute ALTERA_ATTRIBUTE of data_out : signal is "PRESERVE_REGISTER=ON";
begin
    process (clk, reset)
    begin
        if reset = '1' then
            data_in_d1 <= (others => '0');
        elsif Rising_edge(clk) then
            data_in_d1 <= data_in;
        end if;
    end process;

    process (clk, reset)
    begin
        if reset = '1' then
            data_out <= (others => '0');
        elsif Rising_edge(clk) then
            data_out <= data_in_d1;
        end if;
    end process;
end;

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE STD.textio.ALL;    

entity alt_cusp150_edge_to_pulse is 
port (
    signal reset : IN STD_LOGIC;
    signal clk : IN STD_LOGIC;
    signal data_in : IN STD_LOGIC;
    signal data_out : OUT STD_LOGIC
);
end entity;

architecture cusp of alt_cusp150_edge_to_pulse is
    signal data_in_d1 :  STD_LOGIC;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            data_in_d1 <= std_logic'('0');
        elsif Rising_edge(clk) then
            data_in_d1 <= data_in;
       end if;
  end process;

  data_out <= data_in XOR data_in_d1;
end;

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE STD.textio.ALL;    

entity alt_cusp150_trigger_to_synced_pulse is 
port (
    signal reset : IN STD_LOGIC;
    signal clk : IN STD_LOGIC;
    signal sync_reset : IN STD_LOGIC;
    signal sync_clk : IN STD_LOGIC;
    signal trigger : IN STD_LOGIC;
    signal return_pulse : IN STD_LOGIC;
    signal synced_pulse : OUT STD_LOGIC
);
end entity;

architecture cusp of alt_cusp150_trigger_to_synced_pulse is
    COMPONENT alt_cusp150_sync IS
	PORT (
		reset     : IN STD_LOGIC;
		clk       : IN STD_LOGIC;
		data_in   : IN STD_LOGIC;
        data_out  : OUT STD_LOGIC
	);
    END COMPONENT;
    
    COMPONENT alt_cusp150_edge_to_pulse IS
	PORT (
		reset     : IN STD_LOGIC;
		clk       : IN STD_LOGIC;
		data_in   : IN STD_LOGIC;
        data_out  : OUT STD_LOGIC
	);
    END COMPONENT;

    signal trigger_pulse : STD_LOGIC;
    signal trigger_reg : STD_LOGIC;
    signal toggle : STD_LOGIC;
    signal synced : STD_LOGIC;
begin
    trigger_pulse <= (trigger AND NOT trigger_reg) OR (trigger AND return_pulse);

    write_int_regs: PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            trigger_reg <= '0';
            toggle <= '0';
        ELSIF Rising_edge(clk) THEN
            trigger_reg <= trigger;                  
            toggle <= trigger_pulse XOR toggle;
    	END IF;              
    END PROCESS;
              
    synced_toggle: alt_cusp150_sync
        PORT MAP (clk=>sync_clk, reset=>sync_reset, data_in=>toggle, data_out=>synced);
    synced_trigger: alt_cusp150_edge_to_pulse
        PORT MAP (clk=>sync_clk, reset=>sync_reset, data_in=>synced, data_out=>synced_pulse);
end;
