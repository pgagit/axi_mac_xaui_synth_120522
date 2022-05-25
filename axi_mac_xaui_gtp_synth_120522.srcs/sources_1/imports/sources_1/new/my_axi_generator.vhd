----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04/14/2022 12:38:28 PM
-- Design Name:
-- Module Name: MY_AXI_GEN_MASTER_TOP - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
------------------------------
-- AXI -Generator
------------------------------
ENTITY MY_AXI_GEN_MASTER_TOP IS
    PORT (
        m_axis_gen_tkeep_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- whic lane is valid
        m_axis_tvalid_o : OUT STD_LOGIC;
        m_axis_gen_tdata_o : OUT STD_LOGIC_VECTOR(63 DOWNTO 0); -- 4 byte
        m_axis_gen_tlast_o : OUT STD_LOGIC;
        ---
        m_axis_gen_tready_in : IN STD_LOGIC; -- is mac ready to receive?
        --
        m_axis_gen_clk_i : IN STD_LOGIC;
        axi_gen_start_i : IN STD_LOGIC;
        axi_gen_reset_in : IN STD_LOGIC;
        --
        axi_modus_gen_i : IN STD_LOGIC; -- 0 is normal 1 is const
        axi_gen_ether_type_in : IN unsigned (15 DOWNTO 0);
        AXI_CRC_CHECK_ENABLE : IN STD_LOGIC;
        interframe_gap_delay_clk_cycles : IN unsigned (7 DOWNTO 0);
        insert_error_by_wrong_crc : IN STD_LOGIC;
        axi_gen_max_frames_in : IN unsigned (31 DOWNTO 0)
    );
END MY_AXI_GEN_MASTER_TOP;

ARCHITECTURE Behavioral OF MY_AXI_GEN_MASTER_TOP IS
    ----## CONSTANTS for FSM

    CONSTANT NUMBER_4 : unsigned (3 DOWNTO 0) := "0100";
    CONSTANT NUMBER_3 : unsigned (3 DOWNTO 0) := "0011";
    CONSTANT NUMBER_2 : unsigned (3 DOWNTO 0) := "0010";
    CONSTANT NUMBER_1 : unsigned (3 DOWNTO 0) := "0001";
    CONSTANT NUMBER_0 : unsigned (3 DOWNTO 0) := "0000";
    --
    CONSTANT PACKET_LEN_8 : NATURAL := 8;
    CONSTANT PACKET_W_4 : NATURAL := 4;
    --
    SIGNAL ETHERNET_TYPE : unsigned (15 DOWNTO 0) := X"0806";
    CONSTANT DEST_MAC_ADD : unsigned (47 DOWNTO 0) := X"DAD0D1D2D3D4";
    CONSTANT SRC_MAC_ADD : unsigned (47 DOWNTO 0) := X"5A5051525354";
    -- amount of frames in general
    SIGNAL MAX_FRAMES_TO_SEND : unsigned (31 DOWNTO 0) := X"000005DC"; -- 1500 
    SIGNAL MIN_FRAMES_TO_SEND : unsigned (31 DOWNTO 0) := X"0000002e"; --46 Bytes
    SIGNAL interframe_gap_delay_clk_cycles_intern : unsigned (7 DOWNTO 0) := X"0A";

    --### FSM: Define the states of state machine
    SIGNAL AXI_GEN_MODUS : STD_LOGIC := '0'; -- 0 = standard , 1 = constat values ,, can decide which mode should be used
    TYPE state IS (IDLE, SEND_STREAM, SEND_PRE_P1, SEND_PRE_P2, SEND_AXI_DATA, SEND_CRC);
    SIGNAL current_state : state := IDLE;
    SIGNAL next_state : state := IDLE;
    --## AXI - STATUS
    -- data
    SIGNAL data : unsigned(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL axi_data_intern : unsigned(63 DOWNTO 0) := (OTHERS => '0'); -- my data---
    SIGNAL axi_data_content : unsigned(63 DOWNTO 0) := (OTHERS => '0');
    --------------------------------------------
    -- COUNTER:
    ----- COLUMN Counter
    SIGNAL sent_column_total_cnt : unsigned(15 DOWNTO 0) := (OTHERS => '0'); -- counts all axi columns, sums up all sent frames.
    SIGNAL sent_cur_column_cnt : unsigned(15 DOWNTO 0) := (OTHERS => '0'); -- counts sent axi columns of current frame
    SIGNAL interframe_gap_delay : unsigned (15 DOWNTO 0) := (OTHERS => '0');
    ----- FRAME Counter
    SIGNAL sent_frame_cnt : unsigned (31 DOWNTO 0) := (OTHERS => '0'); --counts the sent/ axi initiated ethernet frames!
    -- single bytes for one frame
    SIGNAL total_data_bytes_for_cur_frame : unsigned(31 DOWNTO 0) := X"0000002E"; -- start with 46 each frame one byte more...
    SIGNAL left_frame_data_bytes_to_send_cnt : unsigned (31 DOWNTO 0) := X"0000002E"; -- decremnted
    SIGNAL prev_left_frame_data_bytes_to_send_cnt : unsigned (31 DOWNTO 0); -- decremnted
    SIGNAL CRC_CHECK_ENABLE : STD_LOGIC := '1';
    SIGNAL crc_sent : STD_LOGIC := '0';
    --
    SIGNAL r_Shift1 : STD_LOGIC_VECTOR(7 DOWNTO 0) := "11111111";
    SIGNAL special_crc_flag : STD_LOGIC := '0';
    SIGNAL m_axis_tlast_intern : STD_LOGIC;

    --### crc generator
    SIGNAL clk_tb : STD_LOGIC;
    SIGNAL data_tb : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL LOAD_INIT_tb : STD_LOGIC := '1';
    SIGNAL calc_tb : STD_LOGIC := '0';
    SIGNAL d_valid_tb : STD_LOGIC := '0';
    SIGNAL reset_tb : STD_LOGIC;
    SIGNAL byte_crc_cnt : unsigned (15 DOWNTO 0) := X"0000";
    SIGNAL enable_test : STD_LOGIC := '0';
    SIGNAL CRC_REG_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL m_axis_tvalid_crc_in : STD_LOGIC := '0';
    --
    SIGNAL m_axis_tlast_crc_in : STD_LOGIC := '0';
    SIGNAL m_axis_reset_crc_in : STD_LOGIC := '1'; -- needs a reset first to set correct intit
    SIGNAL crc_data_in : STD_LOGIC_VECTOR(63 DOWNTO 0);
    SIGNAL enable_crc_calculation_step_in : STD_LOGIC := '0';
    ------
    SIGNAL m_axis_tlast : STD_LOGIC := '0';
    SIGNAL m_axis_tvalid : STD_LOGIC := '0';
    SIGNAL send_next_column_the_crc : STD_LOGIC := '0';

    ----- crc generator 64 bit
    COMPONENT crc IS
        PORT (
            data_in : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
            crc_en, rst, clk : IN STD_LOGIC;
            crc_out : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
        );
    END COMPONENT crc;
    ------------------------------
    -- BEGIN ARCHITECTURE
    ------------------------------
BEGIN
    --- general stuff:

    m_axis_gen_tlast_o <= m_axis_tlast;
    m_axis_tvalid_o <= m_axis_tvalid;
    ETHERNET_TYPE <= axi_gen_ether_type_in; -- passing the ethertype
    MAX_FRAMES_TO_SEND <= axi_gen_max_frames_in;
    CRC_CHECK_ENABLE <= AXI_CRC_CHECK_ENABLE; -- passing mode
    interframe_gap_delay_clk_cycles_intern <= interframe_gap_delay_clk_cycles;
    AXI_GEN_MODUS <= axi_modus_gen_i;
    --- general stuff
    m_axis_tvalid_crc_in <= m_axis_tvalid;
    enable_crc_calculation_step_in <= m_axis_tvalid AND m_axis_gen_tready_in;
    ----- 64 Bit- CRC generator
    -- should calculate the crc of the whole ETHERNET-FRAME!
    -- 1 column = 64 Bit
    -- lsfr calculates each clk until tlast
    -- @ tlast (last column with valid data) it only should only calculate the last valid data of the frame
    CRC_tb : CRC

    PORT MAP(
        clk => m_axis_gen_clk_i,
        rst => m_axis_reset_crc_in, -- needs a reset=1 first to set correct intit
        data_in => STD_LOGIC_VECTOR (axi_data_content), --- attention: the last frame may content the crc itself so this case must be checked, crc also needs to be resettet after one frame is sent!
        crc_en => enable_crc_calculation_step_in,
        crc_out => CRC_REG_tb
    );
    ---
    -- Control state machine implementation
    -- for reset
    --FSM: AXI RESET
    SYNC_PROC : PROCESS (m_axis_gen_clk_i)
    BEGIN
        IF rising_edge (m_axis_gen_clk_i) THEN
            IF (axi_gen_reset_in = '1') THEN
                --current_state <= IDLE; -- its like reset
                m_axis_reset_crc_in <= '1';

            ELSE
                --current_state <= next_state;
                m_axis_reset_crc_in <= '0' OR m_axis_tlast; -- tlast will reset it..
                crc_data_in <= STD_LOGIC_VECTOR (axi_data_content);

            END IF;
        END IF;
    END PROCESS SYNC_PROC;

    -- connect data
    axi_data_intern (63 DOWNTO 0) <= axi_data_content(63 DOWNTO 0); -- axi data
    m_axis_gen_tdata_o <= STD_LOGIC_VECTOR(axi_data_intern); -- data is converted to std logic vector and layed onto signal!
    ------------------------------------------------
    --- FSM:
    sm_pr : PROCESS (axi_gen_reset_in, m_axis_gen_clk_i, next_state, axi_gen_start_i, m_axis_gen_tready_in)
    BEGIN
        IF axi_gen_reset_in = '1' THEN
            next_state <= IDLE;
        END IF;

        IF AXI_GEN_MODUS = '0' THEN

            IF (rising_edge (m_axis_gen_clk_i) AND m_axis_gen_tready_in = '1') THEN
                CASE (next_state) IS
                        ---
                    WHEN IDLE => -- its like reset
                        --special_crc_flag <= '0';
                        interframe_gap_delay <= interframe_gap_delay + 1;

                        axi_data_content <= (OTHERS => '0');
                        m_axis_gen_tkeep_o <= (OTHERS => '0'); -- no lane activated
                        m_axis_tvalid <= '0'; -- nothin valid
                        m_axis_tlast <= '0'; -- won't be the last
                        crc_sent <= '0';
                        --left_bytes_to_send <= X"0000002e";
                        -- start sending .. but maybe first wait until MAC ready?

                        IF (axi_gen_start_i = '1' AND m_axis_gen_tready_in = '1' AND interframe_gap_delay > interframe_gap_delay_clk_cycles_intern) THEN
                            next_state <= SEND_PRE_P1;

                            -- max_data_in_frame
                            left_frame_data_bytes_to_send_cnt <= total_data_bytes_for_cur_frame;--- starts with 46 Bytes goes up to MAX
                            sent_cur_column_cnt <= (OTHERS => '0'); -- reset column counter at begin of frame
                        ELSE

                        END IF;

                        --########################## First fix part of preamble..
                    WHEN SEND_PRE_P1 =>
                        --axi status lanes
                        interframe_gap_delay <= (OTHERS => '0');
                        m_axis_tvalid <= '1'; -- valid data on line!
                        m_axis_tlast <= '0'; -- won't be the last one!
                        m_axis_gen_tkeep_o <= X"FF"; -- all lanes have vaild data
                        -- axi data lanes

                        axi_data_content (47 DOWNTO 0) <= DEST_MAC_ADD(47 DOWNTO 0);-- 6 Bytes = 48 elements
                        axi_data_content (63 DOWNTO 48) <= SRC_MAC_ADD(47 DOWNTO 32);-- 2 Bytes = 47- 32 = 16 elements

                        IF (m_axis_gen_tready_in = '1') -- only go to next state if MAC is ready..
                            THEN
                            next_state <= SEND_PRE_P2;
                            -- increase sent counter
                            sent_cur_column_cnt <= sent_cur_column_cnt + 1;
                            sent_column_total_cnt <= sent_column_total_cnt + 1; -- counts new sent AXI tdata columns
                        ELSE

                            -- stay here
                        END IF;
                        --########################## Second fix part of preamble..TYPE-field and 2 Byte data
                    WHEN SEND_PRE_P2 =>
                        --axi status lanes
                        m_axis_tlast <= '0'; -- won't be the last one!
                        m_axis_tvalid <= '1'; -- valid data on line!
                        m_axis_gen_tkeep_o <= X"FF"; -- all lanes have vaild data
                        -- axi data lanes
                        axi_data_content (31 DOWNTO 0) <= SRC_MAC_ADD(31 DOWNTO 0); -- 4 Bytes = 32 elements
                        axi_data_content (47 DOWNTO 32) <= ETHERNET_TYPE;--X"0806"; -- TYPE 0x0800 Ethertype -- Attention check the order-- check if its right set
                        axi_data_content (63 DOWNTO 48) <= X"0000"; -- The first axi tdata 0x0000
                        sent_column_total_cnt <= sent_column_total_cnt + 1; -- counts new sent AXI tdata columns
                        IF (m_axis_gen_tready_in = '1') -- only go to next state if MAC is ready..
                            THEN
                            next_state <= SEND_AXI_DATA; -- start with stream data...
                            crc_sent <= '0';
                            -- counter
                            left_frame_data_bytes_to_send_cnt <= left_frame_data_bytes_to_send_cnt - 2; -- decrease 2 Bytes because it sent 2 Bytes DATA!
                            sent_cur_column_cnt <= sent_cur_column_cnt + 1;
                            sent_column_total_cnt <= sent_column_total_cnt + 1; -- counts new sent AXI tdata columns
                        ELSE
                        END IF;
                        --########################## Send column: with only data

                    WHEN SEND_AXI_DATA =>
                        -- First check if MAC is ready to receive data
                        -- attention what should happen if m_axis is not ready?
                        -- answer: nothing
                        IF (m_axis_gen_tready_in = '1') THEN

                            --  AXI-DATA:
                            --  calculate the new data 
                            --  Put new data onto lines: l7 ... l0
                            --  8 Byte
                            axi_data_content(15 DOWNTO 0) <= resize(((sent_cur_column_cnt - X"2") * NUMBER_4 + NUMBER_0 + 1), 16);
                            axi_data_content(31 DOWNTO 16) <= resize(((sent_cur_column_cnt - X"2") * NUMBER_4 + NUMBER_1 + 1), 16);
                            axi_data_content(47 DOWNTO 32) <= resize(((sent_cur_column_cnt - X"2") * NUMBER_4 + NUMBER_2 + 1), 16);
                            axi_data_content(63 DOWNTO 48) <= resize(((sent_cur_column_cnt - X"2") * NUMBER_4 + NUMBER_3 + 1), 16);

                            -- * tvalid (= are there valid data)
                            -- * tkeep (= shows which line is valid)
                            -- shift a 8 Bit 1 vector with amount of left bytes for this string
                            --- 
                            IF (left_frame_data_bytes_to_send_cnt(31 DOWNTO 0) > 8) --
                                THEN
                                -- if more than 8 Byte remain to be sent
                                -- write the new calculated axi
                                -- tkeep all
                                --         
                                m_axis_gen_tkeep_o <= X"FF";
                                --send_next_column_the_crc <= '1';
                                m_axis_tlast <= '0';

                            ELSE
                                --- if it is last data column with less than 64 bit data
                                --- code can be reduced later
                                ---e.g. only 5-Bytes are left to send: shift right(0x11111111) by 8-4 = 4 >>>> 0x00001111
                                -- Update: following line was helpful for first detailed tests but for a simpler test it is commented out
                                -- m_axis_tkeep <= STD_LOGIC_VECTOR(shift_right(unsigned (r_Shift1), 8 - to_integer(left_frame_data_bytes_to_send_cnt)));

                                ----------------
                                -- update

                                -- IF CRC_CHECK_ENABLE = '1' THEN
                                ---- prev_left_frame_data_bytes_to_send_cnt will remember the amount of left drame before one clk cycle..
                                --- bad naming but, it worked
                                prev_left_frame_data_bytes_to_send_cnt <= left_frame_data_bytes_to_send_cnt; --
                                --------------------------------------------------- append crc
                                CASE (to_integer(left_frame_data_bytes_to_send_cnt)) IS
                                    WHEN 8 =>
                                        --- when 8 bytes remain, next should be the crc
                                        m_axis_gen_tkeep_o <= X"FF";
                                        send_next_column_the_crc <= '1';
                                        m_axis_tlast <= '0';
                                    WHEN 7 =>
                                        -- send 7 column taxis data bytes
                                        axi_data_content(63 DOWNTO 56) <= (OTHERS => '0');--unsigned(CRC_REG_tb(7 downto 0)); --X"98";--- crc_out
                                        --m_axis_tkeep <= X"7F";
                                        m_axis_gen_tkeep_o <= X"FF";
                                        m_axis_tlast <= '0'; -- because @ next column soemthing is coming
                                        send_next_column_the_crc <= '1';

                                    WHEN 6 =>
                                        -- send 6 column taxis data bytes
                                        axi_data_content(63 DOWNTO 48) <= (OTHERS => '0');--unsigned(CRC_REG_tb(15 downto 0));---
                                        --m_axis_tkeep <= X"3F";
                                        m_axis_gen_tkeep_o <= X"FF";
                                        m_axis_tlast <= '0';-- because @ next column soemthing is coming
                                        -- calc and send_next_column_the_crc
                                        send_next_column_the_crc <= '1';
                                    WHEN 5 =>
                                        axi_data_content(63 DOWNTO 40) <= (OTHERS => '0');--unsigned(CRC_REG_tb(23 downto 0));---
                                        m_axis_gen_tkeep_o <= X"FF";
                                        --m_axis_tkeep <= X"1F";
                                        m_axis_tlast <= '0'; -- because @ next column soemthing is coming!!!
                                        -- calc and send_next_column_the_crc
                                        ------------
                                        send_next_column_the_crc <= '1';
                                        m_axis_tlast <= '0';
                                    WHEN 4 =>
                                        -- send 4 data bytes
                                        axi_data_content(63 DOWNTO 32) <= (OTHERS => '0');-- unsigned(CRC_REG_tb(31 downto 0));
                                        --m_axis_tkeep <= X"0F";
                                        m_axis_gen_tkeep_o <= X"FF";
                                        --m_axis_tlast <= '1';-- next frame is not more needed
                                        --crc_sent<= '1';
                                        -- calc and send_next_column_the_crc

                                        send_next_column_the_crc <= '1';
                                        m_axis_tlast <= '0';
                                    WHEN 3 =>
                                        -- send only 3 data bytes! 5 set to 0
                                        axi_data_content(63 DOWNTO 24) <= (OTHERS => '0');--unsigned(CRC_REG_tb(31 downto 0));
                                        m_axis_gen_tkeep_o <= X"FF";
                                        --m_axis_tkeep <= X"07";
                                        -- m_axis_tlast <= '1';-- next frame is not more needed
                                        -- crc_sent<= '1';
                                        -- calc and send_next_column_the_crc
                                        send_next_column_the_crc <= '1';
                                        m_axis_tlast <= '0';
                                    WHEN 2 =>
                                        --send 2 data bytes in colum - set rest 0
                                        axi_data_content(63 DOWNTO 16) <= (OTHERS => '0');-- unsigned(CRC_REG_tb(31 downto 0));
                                        --m_axis_tkeep <= X"03";
                                        m_axis_gen_tkeep_o <= X"FF";
                                        -- m_axis_tlast <= '1'; -- next frame is not more needed
                                        --crc_sent<= '1';
                                        -- calc and send_next_column_the_crc
                                        m_axis_tlast <= '0';
                                        send_next_column_the_crc <= '1';
                                    WHEN 1 => -- full crc fits to the last frame
                                        axi_data_content(63 DOWNTO 8) <= (OTHERS => '0');--unsigned(CRC_REG_tb(31 downto 0));
                                        --m_axis_tkeep <= X"1F";
                                        m_axis_gen_tkeep_o <= X"FF";
                                        -- m_axis_tlast <= '1';-- next frame is not more needed
                                        --crc_sent<= '1';
                                        m_axis_tlast <= '0';
                                        -- calc and send_next_column_the_crc
                                        send_next_column_the_crc <= '1';
                                    WHEN OTHERS =>

                                END CASE;
                            END IF;
                            -- calc remaining bytes:
                            ---------------------
                            -- Decrease the amount of bytes put on the lane: 
                            -- checks if less than 0 (by overflow because its unsigned..) 400000 is just a high value
                            IF left_frame_data_bytes_to_send_cnt - X"8" > 40000 THEN
                                ---if overflow will occure set counter to 0
                                left_frame_data_bytes_to_send_cnt <= (OTHERS => '0'); --correct overflow to 0
                            ELSIF left_frame_data_bytes_to_send_cnt - X"8" >= 0 THEN
                                -- if 8 or more bytes remain 
                                -- if no overflow and bigger than 8 Bytes left, just decrease by 8
                                left_frame_data_bytes_to_send_cnt <= left_frame_data_bytes_to_send_cnt - X"8"; -- decrease those 8 Bytes
                            ELSE
                                -- less then 8 bytes remain
                                left_frame_data_bytes_to_send_cnt <= left_frame_data_bytes_to_send_cnt - X"1"; ---- If not all lanes are used dont decrease so much

                            END IF;

                            -- ##########################################Check if FRAME is finished:

                            ----- left frames bytes : should be between 0 and total_data_bytes_for_cur_frame
                            IF (to_integer(left_frame_data_bytes_to_send_cnt) >= 0 AND to_integer(left_frame_data_bytes_to_send_cnt) < to_integer(total_data_bytes_for_cur_frame)) -- only go to next state if MAC is ready..
                                THEN
                                -- if there are still remaining bytes to sent for this frame
                                ---* Send Next Byte if ready

                                -- next_state <= SEND_AXI_DATA; -- if frames are still left go again, stay in same state.
                                -- counter
                                sent_cur_column_cnt <= sent_cur_column_cnt + 1; -- can be done somewhere else..
                                sent_column_total_cnt <= sent_column_total_cnt + 1; -- can be done somewhere else counts new sent AXI tdata columns

                            ELSE
                            END IF;

                            --
                            -- check why there are to times the same commands...
                            --if (AXI_CRC_CHECK_ENABLE = '1' and crc_sent = '1') then
                            ------------------------------------------
                            --- but this normally only should be done if crc was sent...
                            --if to_integer(left_frame_data_bytes_to_send_cnt) < 8 then
                            IF to_integer(left_frame_data_bytes_to_send_cnt) <= 8 AND to_integer(left_frame_data_bytes_to_send_cnt) >= 0 THEN
                                -- Counter
                                sent_frame_cnt <= sent_frame_cnt + 1; -- increment because this means end of frame!
                                sent_cur_column_cnt <= sent_cur_column_cnt + 1;
                                sent_column_total_cnt <= sent_column_total_cnt + 1; -- counts new sent AXI tdata columns
                                -- state:
                                ----
                                IF CRC_CHECK_ENABLE = '1' THEN
                                    next_state <= SEND_CRC; -- ...or go to send pre_
                                    -- m_axis_tlast <= '1';
                                    send_next_column_the_crc <= '1';
                                ELSE
                                    next_state <= IDLE;
                                END IF;
                                ----- AMOUNT OF FRAMES
                                ------ increment Ethernet-FRAME-Counter
                                IF to_integer(sent_frame_cnt) < to_integer(MAX_FRAMES_TO_SEND) THEN
                                    -- if not sent all:
                                    sent_frame_cnt <= sent_frame_cnt + 1; -- increment frame counter
                                    total_data_bytes_for_cur_frame <= total_data_bytes_for_cur_frame + 1; -- add one for the amount bytes for the next frame
                                ELSE
                                    -- if sent all e.g. 1500 Frames:
                                    -- resetframe counter
                                    -- or put it in idle
                                    sent_frame_cnt <= X"00000000";--RESET counter of sent frames
                                    total_data_bytes_for_cur_frame <= MIN_FRAMES_TO_SEND;--starts with minum X"0000002E";

                                END IF;
                            END IF;
                        END IF;

                        --else
                        --end if;-- crc_sent
                    WHEN SEND_CRC =>
                        IF (send_next_column_the_crc = '1') THEN
                            -- user can also insert a wrong crc for debugging:
                            IF (insert_error_by_wrong_crc = '0') THEN
                                axi_data_content(31 DOWNTO 0) <= unsigned(CRC_REG_tb(31 DOWNTO 0));
                                axi_data_content(63 DOWNTO 32) <= (OTHERS => '0');
                            ELSIF insert_error_by_wrong_crc = '1' THEN
                                axi_data_content(31 DOWNTO 0) <= X"aaaaaaaa"; ---error insert 
                                axi_data_content(63 DOWNTO 32) <= (OTHERS => '0');
                            ELSE
                                --- 
                            END IF;
                            --m_axis_tkeep <= X"0F";
                            m_axis_gen_tkeep_o <= X"FF"; -- debugg
                            send_next_column_the_crc <= '0';
                            m_axis_tlast <= '1';
                            crc_sent <= '1';
                            next_state <= IDLE; -- ...or go to send pre_

                        ELSE
                        END IF;
                    WHEN OTHERS =>
                        next_state <= IDLE;
                END CASE;

            ELSE ----- if not tready!!

            END IF;
            ----------------------------------------------------
            ------------------------------------------------------
        ELSE -- -if another Generator-Mode was chosen:
            ---- SECOND FSM
            CASE (next_state) IS
                    ---
                WHEN IDLE => -- its like reset
                    sent_frame_cnt <= (OTHERS => '0');
                    interframe_gap_delay <= interframe_gap_delay + 1;

                    axi_data_content <= (OTHERS => '0');
                    m_axis_gen_tkeep_o <= (OTHERS => '0'); -- no lane activated
                    m_axis_tvalid <= '0'; -- nothin valid
                    m_axis_tlast <= '0'; -- won't be the last
                    crc_sent <= '0';
                    --left_bytes_to_send <= X"0000002e";
                    -- start sending .. but maybe first wait until MAC ready?

                    IF (axi_gen_start_i = '1' AND m_axis_gen_tready_in = '1' AND interframe_gap_delay > 10) THEN
                        next_state <= SEND_PRE_P1;
                    ELSE

                    END IF;

                    --########################## First fix part of preamble..
                WHEN SEND_PRE_P1 =>
                    interframe_gap_delay <= (OTHERS => '0'); -- reset interframe gap delay...
                    m_axis_tvalid <= '1'; -- valid data on line!
                    m_axis_tlast <= '0'; -- won't be the last one!
                    m_axis_gen_tkeep_o <= X"FF"; -- all lanes have vaild data
                    -- axi data lanes

                    axi_data_content (47 DOWNTO 0) <= DEST_MAC_ADD(47 DOWNTO 0);-- 6 Bytes = 48 elements
                    axi_data_content (63 DOWNTO 48) <= SRC_MAC_ADD(47 DOWNTO 32);-- 2 Bytes = 47- 32 = 16 elements

                    IF (m_axis_gen_tready_in = '1') -- only go to next state if MAC is ready..
                        THEN
                        next_state <= SEND_PRE_P2;
                    ELSE
                        -- stay here
                    END IF;

                WHEN SEND_PRE_P2 =>
                    --axi status lanes
                    m_axis_tlast <= '0'; -- won't be the last one!
                    m_axis_tvalid <= '1'; -- valid data on line!
                    m_axis_gen_tkeep_o <= X"FF"; -- all lanes have vaild data
                    -- axi data lanes
                    axi_data_content (31 DOWNTO 0) <= SRC_MAC_ADD(31 DOWNTO 0); -- 4 Bytes = 32 elements
                    axi_data_content (47 DOWNTO 32) <= X"0806"; -- TYPE 0x0800 Ethertype -- Attention check if its right set
                    axi_data_content (63 DOWNTO 48) <= X"0000"; -- The first axi tdata 0x0000
                    IF (m_axis_gen_tready_in = '1') -- only go to next state if MAC is ready..
                        THEN
                        next_state <= SEND_AXI_DATA; -- start with stream data...

                    ELSE
                    END IF;
                    --########################## Send column: with only data

                WHEN SEND_AXI_DATA =>
                    -- First check if MAC is ready to receive data
                    -- attention what should happen if m_axis is not ready?
                    -- answer: nothing
                    IF (m_axis_gen_tready_in = '1') THEN

                        -- Update AXI STATUS signals
                        -- if less or equal 8 Bytes to send: set tlast! tlast (= indicates last message)
                        -- if this is the last column of the frame set tlast!

                        --- AXI-DATA:
                        --- Put new data onto lines: l7 ... l0
                        axi_data_content(15 DOWNTO 0) <= X"0000";
                        axi_data_content(31 DOWNTO 16) <= X"1111";
                        axi_data_content(47 DOWNTO 32) <= X"2222";
                        axi_data_content(63 DOWNTO 48) <= X"3333";
                        sent_frame_cnt <= sent_frame_cnt + 1;
                        IF sent_frame_cnt > 50 THEN
                            next_state <= IDLE;
                            m_axis_tlast <= '1';
                        ELSE
                        END IF;
                    ELSE
                    END IF;
                WHEN OTHERS =>
            END CASE;
        END IF; ---
    END PROCESS sm_pr;

    reset_p : PROCESS
    BEGIN
        -- LOAD_INIT_tb <= '1';
        enable_test <= '0';
        reset_tb <= '1';
        WAIT FOR 20 ns;
        reset_tb <= '0';
        WAIT FOR 100 ns;
        LOAD_INIT_tb <= '0';
        -- while CRC_REG_tb < X"FFFFFFFF" loop
        -- wait for 10 ns;
        -- end loop;

        WAIT FOR 100 ns;
        enable_test <= '1';
        WAIT;
    END PROCESS;
END Behavioral;

--