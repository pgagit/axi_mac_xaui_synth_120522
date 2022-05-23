----------------------------------------------------------------------------------
-- Company:
-- Engineer: A
-- Create Date: 04/14/2022 12:38:28 PM
-- Module Name: AXI CHECKER - Behavioral
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

------------------------------
-- AXI -Checker
-- should check the generator data
------------------------------
ENTITY AXI_CHECKER IS
	PORT (
		m_axis_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- whic lane is valid
		m_axis_tvalid : IN STD_LOGIC;
		m_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0); -- 4
		m_axis_tready : OUT STD_LOGIC; -- not needed - mac dont cares about state of client
		m_axis_clk : IN STD_LOGIC;
		axi_start : IN STD_LOGIC;
		axi_reset : IN STD_LOGIC;
		m_axis_tlast : IN STD_LOGIC;
		axi_crc_check_ok : out std_logic
	);
END AXI_CHECKER;

ARCHITECTURE Behavioral OF AXI_CHECKER IS
	----## CONSTANTS
	SIGNAL testinteger : INTEGER;
	CONSTANT NUMBER_4 : unsigned (3 DOWNTO 0) := "0100";
	CONSTANT NUMBER_3 : unsigned (3 DOWNTO 0) := "0011";
	CONSTANT NUMBER_2 : unsigned (3 DOWNTO 0) := "0010";
	CONSTANT NUMBER_1 : unsigned (3 DOWNTO 0) := "0001";
	CONSTANT NUMBER_0 : unsigned (3 DOWNTO 0) := "0000";
	CONSTANT PACKET_LEN_8 : NATURAL := 8;
 
	CONSTANT PACKET_W_4 : NATURAL := 4;
	CONSTANT DEST_MAC_ADD : unsigned (47 DOWNTO 0) := X"DAD0D1D2D3D4";
	CONSTANT SRC_MAC_ADD : unsigned (47 DOWNTO 0) := X"5A5051525354";
	--
	CONSTANT FRAME_PART1 : STD_LOGIC_VECTOR (63 DOWNTO 0) := X"5a50dad0d1d2d3d4";
	CONSTANT FRAME_PART2 : STD_LOGIC_VECTOR(63 DOWNTO 0) := X"0000008051525354";
	--
	-- For one frame
	CONSTANT MIN_DATA_BYTES_TO_SEND : unsigned (31 DOWNTO 0) := X"0000002E"; -- 46 Bytes
	-- amount of frames in general
	CONSTANT MAX_FRAMES_TO_SEND : NATURAL := 1500;
	CONSTANT MIN_FRAMES_TO_SEND : unsigned (31 DOWNTO 0) := X"0000002e";

	--## FSM: Define the states of state machine
	TYPE state IS (IDLE, CHECK_ADR1, CHECK_ADR2, CHECK_DATA);
	SIGNAL current_state : state := IDLE;
	SIGNAL current_state2 : state := IDLE;
	SIGNAL next_state : state := IDLE;

	SIGNAL axi_data_intern : std_logic_vector(63 DOWNTO 0) := (OTHERS => '0');
	--------------------------------------------
	------ COUNTER:
	--- COLUMN Counter
	SIGNAL received_column_all_cnt : unsigned(15 DOWNTO 0) := (OTHERS => '0'); -- counts all axi columns, sums up all sent frames.
	SIGNAL received_cur_framecolumn_cnt : unsigned(15 DOWNTO 0) := (OTHERS => '0'); -- counts sent axi columns of current frame
	SIGNAL column_data_correct_cnt : unsigned (15 DOWNTO 0) := (OTHERS => '0');-- counts correct received data columns in a frame
	--
	SIGNAL column_data_correct_cnt2 : unsigned (15 DOWNTO 0) := (OTHERS => '0');-- counts correct received data columns in a frame
	--- FRAME Counter
	SIGNAL received_frame_cnt : unsigned (15 DOWNTO 0) := (OTHERS => '0'); --counts the sent/ axi initiated ethernet frames!
	SIGNAL received_frame_cnt2 : unsigned (15 DOWNTO 0) := (OTHERS => '0'); --counts the sent/ axi initiated ethernet frames!

	SIGNAL received_correct_frames_cnt : unsigned(15 DOWNTO 0) := (OTHERS => '0');
	----- Expected Data:
	--single bytes for one frame
	SIGNAL expected_total_cur_framebytes : unsigned(31 DOWNTO 0) := X"0000002E"; --expected bytes for frame
	SIGNAL expected_left_cur_framebytes : unsigned (31 DOWNTO 0) := X"0000002E"; -- decremnted
	---- expected frames:
	SIGNAL expected_col_data : STD_LOGIC_VECTOR (63 DOWNTO 0) := (OTHERS => '0');
	SIGNAL expected_col_data2 : STD_LOGIC_VECTOR (63 DOWNTO 0) := (OTHERS => '0');
 
	---- Detection Flags-
	SIGNAL DETECTED_ADR1 : std_logic := '0';
	SIGNAL DETECTED_ADR2 : std_logic := '0';
	SIGNAL checkByte : std_logic := '0';
	SIGNAL byteCheckResult : std_logic_vector (7 DOWNTO 0) := (OTHERS => '0'); -- One -satus-bit for each axi lane!
	SIGNAL frame_data_correct : std_logic := '0'; -- just for debug
	SIGNAL column_data_correct : std_logic := '0'; -- just for debug
	SIGNAL column_data_correct_fsm : std_logic := '0'; -- just for debug

	SIGNAL error_flag : std_logic := '0';

	SIGNAL error_flag_otherfsm : std_logic := '0';
	SIGNAL check_flag_otherfsm : std_logic := '0';

	SIGNAL getOldStatus : std_logic;
 
	--
	SIGNAL m_axis_tvalid_crc_in : std_logic := '0';
	SIGNAL CRC_REG_tb : std_logic_vector (31 DOWNTO 0);
		SIGNAL CRC_CHECK_OUT : std_logic_vector (31 DOWNTO 0);

	SIGNAL crc_calc_enabled : std_logic := '0';
	SIGNAL crc_reset : std_logic := '1';
	SIGNAL last_column : std_logic_vector (63 DOWNTO 0);
	signal crc_axi_column_in : std_logic_vector (63 DOWNTO 0);
	SIGNAL crc_ok : std_logic := '0';
	SIGNAL prev_CRC_REG_tb : std_logic_vector (31 DOWNTO 0);
	SIGNAL prev_prev_CRC_REG_tb : std_logic_vector (31 DOWNTO 0);
	SIGNAL cnt : unsigned (0 DOWNTO 0) := "0";
	SIGNAL identic_crc_in_frame_cnt : std_logic_vector (10 DOWNTO 0) := (OTHERS => '0');
		SIGNAL not_identic_crc_in_frame_cnt : std_logic_vector (10 DOWNTO 0) := (OTHERS => '0');

	SIGNAL testcnt : unsigned (3 DOWNTO 0) := X"0";
	SIGNAL error_flag_crc : std_logic := '0';
 
	----- crc generator 64 bit
	COMPONENT crc IS
		PORT (
			data_in : IN std_logic_vector (63 DOWNTO 0);
			crc_en, rst, clk : IN std_logic;
			crc_out : OUT std_logic_vector (31 DOWNTO 0)
		);
	END COMPONENT crc;
	------------------------------ ------------------------------
	-- BEGIN ARCHITECTURE
	------------------------------
BEGIN
	----- 64 Bit- CRC generator for checking the incoming message
	-- should calculate the crc of the whole ETHERNET-FRAME!
	CRC_tb : CRC

	PORT MAP(
		clk => m_axis_clk, 
		rst => crc_reset, 
		data_in => std_logic_vector (crc_axi_column_in), --- attentionm, the last frame may content the crc itself so this case must be checked, crc also needs to be resettet after one frame is sent!
		crc_en => crc_calc_enabled, 
		crc_out => CRC_CHECK_OUT
	);
	axi_data_intern <= m_axis_tdata;
	axi_data_intern <= m_axis_tdata;
	axi_crc_check_ok <=crc_ok; -- status of last crc check ...
	------------------------------
	-----FSM: AXI:
	-- Control state machine implementation
	-- Reset Logic
	-- state register:
	-- todo: check only the tkeep data
	-- mask it with tkeep...
	column_data_correct <= '1' WHEN expected_col_data = m_axis_tdata ELSE '0';

	--- what does sync proc2 do?
	--
--	SYNC_PROC2 : PROCESS (m_axis_clk)
--	BEGIN
--		IF rising_edge(m_axis_clk) THEN

--			IF (axi_reset = '1') THEN
--				-- reset..
--				current_state <= IDLE;
--				--received_frame_cnt <= (others => '0');

--			ELSE
--				-- normal mode
 
--				current_state <= next_state;
--                -- what is this?
--                --  resets counter of counting correct columns 
--                -- this is because the fsm is here in the first state and hasnt received any columns
--				IF (current_state = CHECK_ADR1) THEN
--					column_data_correct_cnt <= (OTHERS => '0');
--				ELSE
--				END IF;
--                -- increment if a new column was received
--				IF (m_axis_tvalid = '1' AND to_integer(unsigned(m_axis_tkeep)) > 0) THEN

--					received_cur_framecolumn_cnt <= received_cur_framecolumn_cnt + 1; -- only after 1 cycle it will be effective propageded to out !
--					-- not up to date anymore
--					IF column_data_correct = '1' THEN
--						-- add up a counter..
--						error_flag <= '0';
--					ELSE
--						---
--						---error
--						error_flag <= '1';
--					END IF;
--				ELSE
--					-- nothing
--				END IF;

--				--- # check for last frame
--				--- reset the column counter if it was the last...
--				IF (m_axis_tlast = '1') THEN
--					received_cur_framecolumn_cnt <= (OTHERS => '0');

--				ELSE
--					-- nothing
--				END IF;
--			END IF;

--		ELSE
--			-- if no clock
--		END IF;
--	END PROCESS;
	---------------------------------------------
	-- Next state & Output logic:
	-- What does it do: it describes what should be done e.g. after finding a ETHERNET FRAME Start!
	---------------------------------------------
	NEXT_STATE_DECODE : PROCESS (m_axis_clk,axi_data_intern, m_axis_tkeep, m_axis_tvalid, current_state, next_state)
	BEGIN
		--##### check case
IF rising_edge(m_axis_clk) THEN

		CASE (next_state) IS
 
			WHEN IDLE => 
            testcnt<=testcnt +1;			 
			 if testcnt = 0 then
			 	crc_reset <= '1'; --reset crc
			 	crc_calc_enabled <= '0';
			 elsif testcnt = 3 then
			         crc_reset <= '0'; --reset crc
			       --  crc_calc_enabled <= '0';
			 		 next_state <= CHECK_ADR1; -- go to next Mode to check for a new incoming Ethernet Adress
                        testcnt <= to_unsigned (0,4);
			 else
			 end if;
				-- ### IDLE: Before start to check a new frame
				--- pass information about expected next framedata:
				expected_total_cur_framebytes <= MIN_DATA_BYTES_TO_SEND; -- 46 Bytes for first frame
				expected_left_cur_framebytes <= MIN_DATA_BYTES_TO_SEND;--X"0000002E"; -- 46 Bytes! left for first frame
				--CRC-checker module can be resetted to be ready for calculating the next frame
				--
				
				
				crc_ok <= '0';
				-- status
				 DETECTED_ADR1 <= '0';
				 DETECTED_ADR2 <= '0';
 
			WHEN CHECK_ADR1 => 
				-- ### CHECK_ADR1: Checks if column contains first address
				-- reset?
				crc_ok <= '0';
                --- STORE PREVIOUS SIGNAL
                
				-- Attention if ADRESS not send in one column it wont be detected!
                 -- if column is valid check for CONST given address   
                 --- because this is how the test frame adress looks like
				
				IF (m_axis_tvalid = '1' AND m_axis_tkeep = X"FF") THEN
				last_column <= m_axis_tdata;

					IF (FRAME_PART1 = axi_data_intern)
					 then
					 -- If Destination Adress was detected, set flag!
					 DETECTED_ADR1 <= '1';
					 --crc
					 -- that means crc should be calculated for this column one cycle:
					 crc_calc_enabled <= '1';
					 crc_reset <= '0'; --reset crc
					 crc_axi_column_in <= m_axis_tdata; -- start with this column...
					 --last_column <= axi_data_intern;
					 next_state <= CHECK_ADR2;
					 else
                        -- not same adress..stay in this state
                        next_state <= CHECK_ADR1;
                        DETECTED_ADR1 <= '0';
					 end if;
                 ELSE
                 --- no valid column - stay in this state:
                  next_state <= CHECK_ADR1;
				 END IF;
				 --- ### CHECK_ADR2: Checks if column contains second address+ TYPE + 2 Byte DATA
			 WHEN CHECK_ADR2 => 
				  last_column <= m_axis_tdata;
				 --- check if tvalid data are there and if they are all keep
				 --- because this is how the test frame adress looks like
				 				 crc_calc_enabled <= '0';

				 IF (m_axis_tvalid = '1' AND m_axis_tkeep = X"FF") THEN
						if (FRAME_PART2 = m_axis_tdata) then
						  crc_axi_column_in <= m_axis_tdata; -- start with this column...
						 expected_left_cur_framebytes <= expected_left_cur_framebytes - 2;
						 crc_calc_enabled <= '1';
						 next_state <= CHECK_DATA;
						 DETECTED_ADR2 <= '1';
						 else
							 next_state <= CHECK_ADR2; -- <--- was right format but not right adress
						 end if;
					 ELSE
 
						 next_state <= CHECK_ADR2; -- <-- doesnt contain adress in the right format... 

					 END IF;
					 -- ###
			 WHEN CHECK_DATA => 
						 --- Check tdata only if tvalid = 1 , because tvalid means MAC wants to send valid data
						 IF m_axis_tvalid = '0' THEN
								expected_col_data(15 DOWNTO 0) <= (OTHERS => '0'); -- nothing expected
								next_state <= CHECK_DATA;
								crc_calc_enabled <= '0';
						 ELSIF m_axis_tvalid = '1' then
						  
						       
								
								--- this can be processed by the CRC-CHECKER
							--
								-- ok here take care because of CRC stop calculation.
								-- the CRC must be parsed from the frame
								-- the until here calclulated CRC must be compared
								
								       --- crc
								cnt <= cnt + 1;
								last_column <= m_axis_tdata;
								crc_axi_column_in <= m_axis_tdata;
								crc_calc_enabled <= '1';
								
								
								-- if it was the same return 1 else 0.
								-- Last Frame Data?
								-- Then wait for new address:
 
								IF (m_axis_tlast = '1') THEN
									next_state <= IDLE;--- that means the FRAME is finished and new one can be expected
									
									 
									--- ##### CRC CHECK: COMPARE THE LAST 4 BYTES 
									--- now check if the last column has the same CRC as it was calculated by the CRC checker:
									-- ( it was calculated before two clocks)
									IF (m_axis_tdata(31 DOWNTO 0) = CRC_CHECK_OUT(31 DOWNTO 0)) THEN
										--- CRC WAS SAME AS CALCULATED
										crc_ok <= '1';
										error_flag_crc <= '0';
										identic_crc_in_frame_cnt <= identic_crc_in_frame_cnt + '1';
										--testcnt <= testcnt + 3;
									ELSE 
									---- CRC was NOT same!
										crc_ok <= '0';
										error_flag_crc <= '1';
										not_identic_crc_in_frame_cnt <= not_identic_crc_in_frame_cnt + '1'; 
									END IF;
								ELSIF m_axis_tlast = '0' THEN
								    ---- if it was not the last column store it
								    --- it will/ should be available when the last column contains the CRC!
									prev_prev_CRC_REG_tb <= CRC_REG_tb;
									next_state <= CHECK_DATA;
									-- not the last
								END IF;
								--
							END IF; -- tvalid check
			WHEN OTHERS => 
								next_state <= IDLE;
					END CASE;
		else
		end if;			

				END PROCESS;
 
 

END Behavioral;