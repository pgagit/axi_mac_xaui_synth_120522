-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Fri May 13 13:06:04 2022
-- Host        : pc-140-151-2 running 64-bit Ubuntu 20.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/alexander.kohn/MYREPO2/axi_mac_xaui_GTP_synth/axi_mac_xaui_GTP_synth.srcs/sources_1/ip/ila_1/ila_1_stub.vhdl
-- Design      : ila_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tifbv676-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ila_1 is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe7 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe8 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe9 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    probe10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe11 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe12 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe13 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe14 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe15 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe16 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe17 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe18 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe19 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    probe20 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe21 : in STD_LOGIC_VECTOR ( 25 downto 0 );
    probe22 : in STD_LOGIC_VECTOR ( 29 downto 0 );
    probe23 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe24 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe25 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe26 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe27 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe28 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe29 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe30 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe31 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe32 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe33 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe34 : in STD_LOGIC_VECTOR ( 79 downto 0 );
    probe35 : in STD_LOGIC_VECTOR ( 79 downto 0 );
    probe36 : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end ila_1;

architecture stub of ila_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[7:0],probe1[5:0],probe2[7:0],probe3[6:0],probe4[63:0],probe5[0:0],probe6[0:0],probe7[0:0],probe8[7:0],probe9[63:0],probe10[0:0],probe11[0:0],probe12[0:0],probe13[2:0],probe14[0:0],probe15[0:0],probe16[0:0],probe17[0:0],probe18[7:0],probe19[63:0],probe20[7:0],probe21[25:0],probe22[29:0],probe23[0:0],probe24[0:0],probe25[1:0],probe26[1:0],probe27[1:0],probe28[1:0],probe29[1:0],probe30[1:0],probe31[1:0],probe32[1:0],probe33[0:0],probe34[79:0],probe35[79:0],probe36[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ila,Vivado 2019.1";
begin
end;
