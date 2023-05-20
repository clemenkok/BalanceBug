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

LIBRARY IEEE, ALTERA;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE STD.textio.ALL;

-- Memory with a single port turned to the TTA side and the other exposed as an avalon memory slave
USE altera.ALT_CUSP150_PACKAGE.ALL;

ENTITY ALT_CUSP150_AVALON_MM_MEM_SLAVE IS
  GENERIC (
        NAME         : STRING := "";
        SIMULATION   : INTEGER := SIMULATION_OFF;
        OPTIMIZED    : INTEGER := OPTIMIZED_ON;
        FAMILY       : INTEGER := FAMILY_STRATIX;
        INIT_FILE : STRING := "UNUSED";
        WIDTH : INTEGER := 16;
        ADDRESS_WIDTH : INTEGER := 16;
        DEPTH : INTEGER := -1;
        INTERRUPT_USED : INTEGER := 1;
        DELAY_SLOTS : INTEGER := 0;
        LATENCY : INTEGER := 1;
        MODE : INTEGER := ALT_MEM_MODE_AUTO;
        CLOCKS_ARE_SYNC : INTEGER := 1
  );
  PORT (
        clock : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        ena   : IN STD_LOGIC := '1';
           
        addr     : IN  STD_LOGIC_VECTOR( ADDRESS_WIDTH-1 DOWNTO 0) := (others=>'0');
        addr_en  : IN  STD_LOGIC := '0';
        rdata    : OUT STD_LOGIC_VECTOR( WIDTH-1 DOWNTO 0);
        wdata    : IN  STD_LOGIC_VECTOR( WIDTH-1 DOWNTO 0) := (others=>'0');
        wdata_en : IN  STD_LOGIC := '0';
        setirq   : IN  STD_LOGIC := '0';
        setirq_en : IN  STD_LOGIC := '0';
        irqactive : IN  STD_LOGIC := '0';
        
        av_address   : IN  STD_LOGIC_VECTOR( ADDRESS_WIDTH-1 DOWNTO 0) := (others=>'0');
        av_writedata : IN  STD_LOGIC_VECTOR( WIDTH-1 DOWNTO 0)  := (others=>'0');
        av_readdata  : OUT STD_LOGIC_VECTOR( WIDTH-1 DOWNTO 0);
        av_clock     : IN  STD_LOGIC := '0';
        av_write     : IN  STD_LOGIC := '0';
        av_chipselect: IN  STD_LOGIC := '0';
        av_reset     : IN  STD_LOGIC := '0';
        av_waitrequest : OUT  STD_LOGIC := '0';
        av_interrupt : OUT  STD_LOGIC := '0'
  );
END;


ARCHITECTURE rtl OF ALT_CUSP150_AVALON_MM_MEM_SLAVE IS

	FUNCTION CALCDEPTH(AW : NATURAL; D : INTEGER) return NATURAL is
	BEGIN
		IF (D < 0 OR MODE = ALT_MEM_MODE_LE) THEN
			RETURN 2 ** AW;
		ELSE
			RETURN D;
		END IF;
	END FUNCTION CALCDEPTH;

	CONSTANT REAL_DEPTH : NATURAL := CALCDEPTH(ADDRESS_WIDTH, DEPTH);
	
  COMPONENT altsyncram
  GENERIC (
    operation_mode    : STRING;
    init_file : STRING;
    width_a   : NATURAL;
    widthad_a   : NATURAL;
    numwords_a    : NATURAL;
    width_b   : NATURAL;
    widthad_b   : NATURAL;
    numwords_b    : NATURAL;
    lpm_type    : STRING;
    width_byteena_a   : NATURAL;
    width_byteena_b   : NATURAL;
    outdata_reg_a   : STRING;
    outdata_reg_b   : STRING;
    indata_reg_b    : STRING;
    address_reg_b   : STRING;
    wrcontrol_wraddress_reg_b   : STRING;
    ram_block_type    : STRING;
    intended_device_family    : STRING
  );
  PORT (
      clocken0  : IN STD_LOGIC ;
      clocken1  : IN STD_LOGIC ;
      wren_a  : IN STD_LOGIC ;
      clock0  : IN STD_LOGIC ;
      wren_b  : IN STD_LOGIC ;
      clock1  : IN STD_LOGIC ;
      address_a : IN STD_LOGIC_VECTOR (widthad_a-1 DOWNTO 0);
      address_b : IN STD_LOGIC_VECTOR (widthad_a-1 DOWNTO 0);
      q_a : OUT STD_LOGIC_VECTOR (width_a-1 DOWNTO 0);
      q_b : OUT STD_LOGIC_VECTOR (width_a-1 DOWNTO 0);
      data_a  : IN STD_LOGIC_VECTOR (width_a-1 DOWNTO 0);
      data_b  : IN STD_LOGIC_VECTOR (width_a-1 DOWNTO 0)
  );
  END COMPONENT;
  
  COMPONENT alt_cusp150_trigger_to_synced_pulse IS
  PORT (
    reset           : IN STD_LOGIC;
	clk             : IN STD_LOGIC;
    sync_reset      : IN STD_LOGIC;
    sync_clk        : IN STD_LOGIC;
	trigger         : IN STD_LOGIC;
    return_pulse    : IN STD_LOGIC;
    synced_pulse      : OUT STD_LOGIC
  );
  END COMPONENT;

  SIGNAL do_avalon_write : STD_LOGIC;
  SIGNAL do_avalon_read : STD_LOGIC;
  
  SIGNAL do_avalon_req : STD_LOGIC;
  
  SIGNAL   av_address_int : STD_LOGIC_VECTOR( ADDRESS_WIDTH-1 DOWNTO 0);
  SIGNAL   av_address_write : STD_LOGIC_VECTOR( ADDRESS_WIDTH-1 DOWNTO 0);
  SIGNAL   addr_reg     : STD_LOGIC_VECTOR( ADDRESS_WIDTH-1 DOWNTO 0);
  SIGNAL   rdata_int    : STD_LOGIC_VECTOR( WIDTH-1 DOWNTO 0);
  
  SIGNAL   av_mux_select : STD_LOGIC_VECTOR( (2**ADDRESS_WIDTH)-1 DOWNTO 0);
  SIGNAL   mux_select : STD_LOGIC_VECTOR( (2**ADDRESS_WIDTH)-1 DOWNTO 0);
  SIGNAL   av_write_en : STD_LOGIC_VECTOR( REAL_DEPTH-1 DOWNTO 0);
  SIGNAL   av_write_bus : STD_LOGIC_VECTOR( REAL_DEPTH-1 DOWNTO 0);

  SIGNAL addr_en_d1 : STD_LOGIC;
  SIGNAL enable_int : STD_LOGIC;
  SIGNAL wdata_mask_en : STD_LOGIC;

  SIGNAL internal_write : STD_LOGIC;
  SIGNAL toggle : STD_LOGIC;
  SIGNAL toggle_pending : STD_LOGIC;

  type mux_type is array(0 to REAL_DEPTH-1) of Std_logic_vector(WIDTH-1 DOWNTO 0);
  signal regs : mux_type;
  signal regs_next : mux_type;
  
function binary_to_one_hot(binary : std_logic_vector) return std_logic_vector is
  variable one_hot : std_logic_vector((2**ADDRESS_WIDTH)-1 downto 0);
begin
  one_hot := (others => '1');
  for I in binary'range loop
    for J in one_hot'range loop
      if (((J / (2**I)) mod 2) = 0) then
        one_hot(J) := one_hot(J) and not binary(I);
      else
        one_hot(J) := one_hot(J) and binary(I);
      end if;
    end loop;
  end loop;

  return one_hot;
end function; 

  signal do_avalon_write_req : STD_LOGIC;
  signal do_avalon_read_req : STD_LOGIC;
  signal do_avalon_ack : STD_LOGIC;
  
  signal av_writedata_int : STD_LOGIC_VECTOR( WIDTH-1 DOWNTO 0);
BEGIN

 -- synopsys synthesis_off
watcher: process 
  variable rn : TTA_X_D_RN_T( 0 downto 0)  := 
      ( 
         new STRING'("rdata"), 
         others => null
      );
  variable rv : TTA_X_D_RV_T( 0 downto 0)  := 
      ( 
          new STD_LOGIC_VECTOR(rdata_int'high downto rdata_int'low), 
          others => null
      );
begin

  loop
    wait on rdata_int;
    rv(0).all := rdata_int;
    TTA_X_D_registerDump(NAME, rn, rv);
  end loop;
  --DEALLOCATE (rn(0));
  --DEALLOCATE (rv(0));
end process;
 -- synopsys synthesis_on

drive_rdata: rdata <= rdata_int;

compute_av_write: do_avalon_write <= av_chipselect and av_write; 

dserror: IF DELAY_SLOTS /= 1 AND DELAY_SLOTS /= 0 GENERATE
  process
  begin 
    assert false report "delays slots on ram must be 0 or 1" severity failure;
    wait;
  end process;
END GENERATE;

modeerror: IF MODE /= ALT_MEM_MODE_AUTO AND MODE /= ALT_MEM_MODE_LE GENERATE
  process
  begin 
    assert false report "mem mapped slave only supports auto or le modes" severity failure;
    wait;
  end process;
END GENERATE;

ds1: IF MODE = ALT_MEM_MODE_AUTO AND DELAY_SLOTS = 1 GENERATE

  enable_int_comb: enable_int <= ( addr_en_d1 or addr_en ) and ena;

  wdata_mask_en_comb: wdata_mask_en <= wdata_en and addr_en;
  
  rdata_en_d1_r: process ( clock, reset )
  begin
    IF reset = '1' THEN
      addr_en_d1 <= '0';
    ELSIF clock'EVENT AND clock = '1' THEN
      IF enable_int = '1' THEN
        addr_en_d1 <= addr_en;
      END IF;
    END IF;
  end process;

  altsyncram_component : altsyncram
  GENERIC MAP (
    operation_mode => "BIDIR_DUAL_PORT",
    init_file => INIT_FILE,
    
    width_a => WIDTH,
    widthad_a => ADDRESS_WIDTH,
    numwords_a => REAL_DEPTH,
    width_byteena_a => 1,
    outdata_reg_a => "CLOCK0",
    
    width_b => WIDTH,
    widthad_b =>  ADDRESS_WIDTH,
    numwords_b => REAL_DEPTH,
    width_byteena_b => 1,
    outdata_reg_b => "CLOCK1",
    indata_reg_b => "CLOCK1",
    address_reg_b => "CLOCK1",
    wrcontrol_wraddress_reg_b => "CLOCK1",


    lpm_type => "altsyncram",
    ram_block_type => "AUTO",
    intended_device_family => "Stratix"
  )
  PORT MAP (
    clocken0 => enable_int,
    wren_a => wdata_mask_en,
    clock0 => clock,
    address_a => addr,
    data_a => wdata,
    q_a => rdata_int,
    
    clocken1 => '1',
    wren_b => do_avalon_write,
    clock1 => av_clock,
    address_b => av_address,
    data_b => av_writedata,
    q_b => av_readdata
  );
  
  internal_write <= enable_int AND wdata_mask_en;

END GENERATE;


ds0: IF MODE = ALT_MEM_MODE_AUTO AND DELAY_SLOTS = 0 GENERATE

  enable_int_comb: enable_int <= addr_en and ena;

  altsyncram_component : altsyncram
  GENERIC MAP (
    operation_mode => "BIDIR_DUAL_PORT",
    init_file => INIT_FILE,
    
    width_a => WIDTH,
    widthad_a => ADDRESS_WIDTH,
    numwords_a => (2**ADDRESS_WIDTH),
    width_byteena_a => 1,
    outdata_reg_a => "UNREGISTERED",
    
    width_b => WIDTH,
    widthad_b =>  ADDRESS_WIDTH,
    numwords_b => REAL_DEPTH,
    width_byteena_b => 1,
    outdata_reg_b => "CLOCK1",
    indata_reg_b => "CLOCK1",
    address_reg_b => "CLOCK1",
    wrcontrol_wraddress_reg_b => "CLOCK1",
    
    lpm_type => "altsyncram",
    ram_block_type => "AUTO",
    intended_device_family => "Stratix"
  )
  PORT MAP (
    clocken0 => enable_int,
    wren_a => wdata_en,
    clock0 => clock,
    address_a => addr,
    data_a => wdata,
    q_a => rdata_int,
    
    clocken1 => '1',
    wren_b => do_avalon_write,
    clock1 => av_clock,
    address_b => av_address,
    data_b => av_writedata,
    q_b => av_readdata
  );

  internal_write <= enable_int AND wdata_en;

END GENERATE;

le: IF MODE = ALT_MEM_MODE_LE GENERATE
    av_capture: process(av_clock, av_reset)
    begin
        IF av_reset = '1' THEN
            av_address_int <= (others => '0'); 
        ELSIF Rising_Edge(av_clock) THEN
           IF av_chipselect = '1' THEN
              av_address_int <= av_address;
           END IF;
        END IF;
    end process;

    sync_clocks: IF (CLOCKS_ARE_SYNC = 1) GENERATE
        do_avalon_write_req <= do_avalon_write;
        do_avalon_read_req <= do_avalon_read;
        av_waitrequest <= '0';
        av_writedata_int <= av_writedata; 
        av_address_write <= av_address;
        
        compute_av_write: process(av_clock, av_reset)
        begin
            IF av_reset = '1' THEN
                do_avalon_read <= '0';
            ELSIF Rising_Edge(av_clock) THEN
                do_avalon_read <= av_chipselect;
            END IF;
        end process;
    END GENERATE;
    
    async_clocks: IF (CLOCKS_ARE_SYNC /= 1) GENERATE   
        do_avalon_read <= av_chipselect and not av_write; 
        av_address_write <= av_address_int;
    
        write_req_generation: alt_cusp150_trigger_to_synced_pulse
        	PORT MAP (clk=>av_clock, reset=>av_reset, sync_clk=>clock, sync_reset=>reset, trigger=>do_avalon_write, return_pulse=>do_avalon_ack, synced_pulse=>do_avalon_write_req);        
        read_req_generation: alt_cusp150_trigger_to_synced_pulse
        	PORT MAP (clk=>av_clock, reset=>av_reset, sync_clk=>clock, sync_reset=>reset, trigger=>do_avalon_read, return_pulse=>do_avalon_ack, synced_pulse=>do_avalon_read_req);
        
        do_avalon_req <= do_avalon_write_req OR do_avalon_read_req;
        
        ack_generation: alt_cusp150_trigger_to_synced_pulse
			PORT MAP (clk=>clock, reset=>reset, sync_clk=>av_clock, sync_reset=>av_reset, trigger=>do_avalon_req, return_pulse=>'1', synced_pulse=>do_avalon_ack);        
              
        av_waitrequest <= (av_write OR av_chipselect) AND NOT do_avalon_ack; 
        
        av_write_capture: process(av_clock, av_reset)
        begin
            IF av_reset = '1' THEN   
                av_writedata_int <= (others => '0'); 
            ELSIF Rising_Edge(av_clock) THEN
                IF do_avalon_write = '1' THEN
                    av_writedata_int <= av_writedata;
                END IF;
            END IF;
        end process;
    END GENERATE;

    av_mux_select <= binary_to_one_hot(av_address_write);
    mux_select <= binary_to_one_hot(addr);
    av_write_bus <= (others => do_avalon_write_req);
    av_write_en <=  av_mux_select AND av_write_bus;

    registers: for r in 0 to REAL_DEPTH - 1 generate
      reg_next: process (av_write_en, av_writedata_int, wdata)
      begin
        IF av_write_en(r) = '1' THEN
          regs_next(r) <= av_writedata_int;
        ELSE 
          regs_next(r) <= wdata;
        END IF; 
      end process;

      le_mem: process (clock, reset)
      begin
        IF reset = '1' THEN   
          regs(r) <= (others => '0');     
        ELSIF Rising_Edge(clock) THEN
          IF av_write_en(r) = '1' OR (mux_select(r) = '1' AND wdata_en = '1') THEN
		      regs(r) <= regs_next(r);
          END IF;
        END IF;
      end process;
    end generate;
    
    av_readdata_reg: process(clock, reset)
    begin
      IF reset = '1' THEN   
        av_readdata <= (others => '0');   
      ELSIF Rising_Edge(clock) THEN
        IF do_avalon_read_req = '1' THEN
            av_readdata <= regs(to_Integer(unsigned(av_address_int)));
        END IF;
      END IF;
    end process;
    
    ds0: IF DELAY_SLOTS = 0 GENERATE
      rdata_comb: process(addr, regs)
      begin  
        rdata_int <= regs(to_Integer(unsigned(addr)));
      end process;
    END GENERATE;

    ds1: IF DELAY_SLOTS = 1 GENERATE
      rdata_reg: process(clock, reset)
      begin
        IF reset = '1' THEN
          addr_reg <= (others => '0');   
          rdata_int <= (others => '0');
        ELSIF Rising_Edge(clock) THEN
          addr_reg <= addr; 
          rdata_int <= regs(to_Integer(unsigned(addr_reg)));
        END IF;
      end process;
    END GENERATE;

END GENERATE;

irq_generate: IF INTERRUPT_USED = 1 GENERATE
PROCESS(clock, reset)
BEGIN
  IF reset = '1' THEN
    av_interrupt <= '0';
  ELSIF clock'EVENT AND clock = '1' THEN
    IF (setirq AND setirq_en AND ena) = '1' THEN
      av_interrupt <= irqactive;
    END IF;
  END IF;
END PROCESS;
END GENERATE;

END ;
