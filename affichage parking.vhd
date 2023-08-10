LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY FSMB IS
END FSMB;
 
ARCHITECTURE rt4 OF FSMB IS 
 
    -- Component Declaration for the car parking system in VHDL
 
    COMPONENT FSMTB
    PORT(
        clk: in std_logic;
        reset: in std_logic;
        s_en: in std_logic;
        s_ex: in std_logic;
        count: inout integer;
        so_en: out std_logic;
        so_ex: out std_logic;
        Seven_Segment : out STD_LOGIC_VECTOR (6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   
   signal clk,reset,s_en,s_ex : std_logic := '0';
 
  
   --Outputs
   signal so_en:  std_logic;
   signal so_ex:  std_logic;
   signal Seven_Segment : STD_LOGIC_VECTOR (6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
 -- Instantiate the car parking system in VHDL
   Car_park_system: FSMTB PORT MAP (
            clk => clk,
            reset => reset,
            s_en => s_en,
            s_ex => s_ex,

            so_en => so_en,
            so_ex => so_ex,
            Seven_Segment => Seven_Segment
            );

   -- Clock process definitions
clk_process :process
  begin
        clk <= '0';
  wait for clk_period/2;
        clk <= '1';
  wait for clk_period/2;
end process;
   
   
   -- Stimulus process
   stim_proc: process
   begin  
        reset <= '0';
        s_en <= '0';
        s_ex <= '0';
  wait for clk_period*10;
        s_en <= '1';
  wait for clk_period*10;
        s_ex <= '1';
        s_en <= '0';
  wait for clk_period*10;
        s_en <= '1';
        s_ex <= '0';      
      wait;
   end process stim_proc;

END rt4;