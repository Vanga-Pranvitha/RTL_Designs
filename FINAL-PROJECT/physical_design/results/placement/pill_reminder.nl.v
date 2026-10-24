module pill_reminder (ack_btn,
    buzzer,
    clk,
    led,
    missed_dose_flag,
    rst_n,
    tick_1min,
    interval_sel);
 input ack_btn;
 output buzzer;
 input clk;
 output led;
 output missed_dose_flag;
 input rst_n;
 input tick_1min;
 input [1:0] interval_sel;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire ack_prev;
 wire ack_s1;
 wire ack_s2;
 wire \blink_div[0] ;
 wire \blink_div[1] ;
 wire \blink_div[2] ;
 wire \interval_cnt[0] ;
 wire \interval_cnt[1] ;
 wire \interval_cnt[2] ;
 wire \interval_cnt[3] ;
 wire \interval_cnt[4] ;
 wire \interval_cnt[5] ;
 wire \interval_cnt[6] ;
 wire \interval_cnt[7] ;
 wire \interval_cnt[8] ;
 wire \interval_cnt[9] ;
 wire \state[0] ;
 wire \state[2] ;
 wire \window_cnt[0] ;
 wire \window_cnt[1] ;
 wire \window_cnt[2] ;
 wire \window_cnt[3] ;
 wire \window_cnt[4] ;
 wire \window_cnt[5] ;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;

 sky130_fd_sc_hd__nor4_1 _123_ (.A(\interval_cnt[5] ),
    .B(\interval_cnt[4] ),
    .C(\interval_cnt[6] ),
    .D(\interval_cnt[7] ),
    .Y(_089_));
 sky130_fd_sc_hd__and2b_1 _124_ (.A_N(\interval_cnt[1] ),
    .B(\interval_cnt[0] ),
    .X(_090_));
 sky130_fd_sc_hd__nor4_1 _125_ (.A(\interval_cnt[3] ),
    .B(\interval_cnt[2] ),
    .C(\interval_cnt[9] ),
    .D(\interval_cnt[8] ),
    .Y(_091_));
 sky130_fd_sc_hd__buf_2 _126_ (.A(\state[0] ),
    .X(_092_));
 sky130_fd_sc_hd__nand2_1 _127_ (.A(net5),
    .B(_092_),
    .Y(_093_));
 sky130_fd_sc_hd__a31o_1 _128_ (.A1(_089_),
    .A2(_090_),
    .A3(_091_),
    .B1(_093_),
    .X(_094_));
 sky130_fd_sc_hd__nand2_1 _129_ (.A(net4),
    .B(_092_),
    .Y(_095_));
 sky130_fd_sc_hd__or2b_1 _130_ (.A(ack_prev),
    .B_N(ack_s2),
    .X(_096_));
 sky130_fd_sc_hd__nor2_1 _131_ (.A(net8),
    .B(\state[2] ),
    .Y(_097_));
 sky130_fd_sc_hd__buf_2 _132_ (.A(net4),
    .X(_098_));
 sky130_fd_sc_hd__o221a_1 _133_ (.A1(net5),
    .A2(_095_),
    .B1(_096_),
    .B2(_097_),
    .C1(_098_),
    .X(_099_));
 sky130_fd_sc_hd__nand2_1 _134_ (.A(_094_),
    .B(_099_),
    .Y(_000_));
 sky130_fd_sc_hd__inv_2 _135_ (.A(net8),
    .Y(_100_));
 sky130_fd_sc_hd__inv_2 _136_ (.A(\window_cnt[0] ),
    .Y(_101_));
 sky130_fd_sc_hd__inv_2 _137_ (.A(net5),
    .Y(_102_));
 sky130_fd_sc_hd__or3_1 _138_ (.A(\window_cnt[4] ),
    .B(\window_cnt[3] ),
    .C(\window_cnt[2] ),
    .X(_103_));
 sky130_fd_sc_hd__or2_1 _139_ (.A(\window_cnt[5] ),
    .B(\window_cnt[1] ),
    .X(_104_));
 sky130_fd_sc_hd__or4_1 _140_ (.A(_101_),
    .B(_102_),
    .C(_103_),
    .D(_104_),
    .X(_105_));
 sky130_fd_sc_hd__and3b_1 _141_ (.A_N(_097_),
    .B(net4),
    .C(_096_),
    .X(_106_));
 sky130_fd_sc_hd__a21boi_1 _142_ (.A1(_100_),
    .A2(_105_),
    .B1_N(_106_),
    .Y(_001_));
 sky130_fd_sc_hd__buf_2 _143_ (.A(_098_),
    .X(_107_));
 sky130_fd_sc_hd__buf_2 _144_ (.A(\state[2] ),
    .X(_108_));
 sky130_fd_sc_hd__and3_1 _145_ (.A(net4),
    .B(net5),
    .C(\state[0] ),
    .X(_109_));
 sky130_fd_sc_hd__and4_1 _146_ (.A(_089_),
    .B(_090_),
    .C(_091_),
    .D(_109_),
    .X(_110_));
 sky130_fd_sc_hd__a41o_1 _147_ (.A1(_107_),
    .A2(_108_),
    .A3(_096_),
    .A4(_105_),
    .B1(_110_),
    .X(_002_));
 sky130_fd_sc_hd__a21o_1 _148_ (.A1(net8),
    .A2(\blink_div[2] ),
    .B1(_108_),
    .X(net7));
 sky130_fd_sc_hd__and2_1 _149_ (.A(_108_),
    .B(\blink_div[2] ),
    .X(_111_));
 sky130_fd_sc_hd__clkbuf_1 _150_ (.A(_111_),
    .X(net6));
 sky130_fd_sc_hd__nor2_1 _151_ (.A(net5),
    .B(_095_),
    .Y(_112_));
 sky130_fd_sc_hd__or3_1 _152_ (.A(_112_),
    .B(_106_),
    .C(_110_),
    .X(_113_));
 sky130_fd_sc_hd__buf_2 _153_ (.A(_113_),
    .X(_114_));
 sky130_fd_sc_hd__or3_1 _154_ (.A(\interval_cnt[0] ),
    .B(_095_),
    .C(_113_),
    .X(_115_));
 sky130_fd_sc_hd__a21bo_1 _155_ (.A1(\interval_cnt[0] ),
    .A2(_114_),
    .B1_N(_115_),
    .X(_003_));
 sky130_fd_sc_hd__or2_1 _156_ (.A(\interval_cnt[0] ),
    .B(\interval_cnt[1] ),
    .X(_116_));
 sky130_fd_sc_hd__nand2_1 _157_ (.A(\interval_cnt[0] ),
    .B(\interval_cnt[1] ),
    .Y(_117_));
 sky130_fd_sc_hd__a21oi_1 _158_ (.A1(_116_),
    .A2(_117_),
    .B1(_114_),
    .Y(_118_));
 sky130_fd_sc_hd__and2_1 _159_ (.A(_098_),
    .B(_092_),
    .X(_119_));
 sky130_fd_sc_hd__a22o_1 _160_ (.A1(\interval_cnt[1] ),
    .A2(_114_),
    .B1(_118_),
    .B2(_119_),
    .X(_004_));
 sky130_fd_sc_hd__or2_1 _161_ (.A(\interval_cnt[2] ),
    .B(_116_),
    .X(_120_));
 sky130_fd_sc_hd__nand2_1 _162_ (.A(\interval_cnt[2] ),
    .B(_116_),
    .Y(_121_));
 sky130_fd_sc_hd__a21oi_1 _163_ (.A1(_120_),
    .A2(_121_),
    .B1(_114_),
    .Y(_122_));
 sky130_fd_sc_hd__a22o_1 _164_ (.A1(\interval_cnt[2] ),
    .A2(_114_),
    .B1(_122_),
    .B2(_119_),
    .X(_005_));
 sky130_fd_sc_hd__or4_1 _165_ (.A(\interval_cnt[0] ),
    .B(\interval_cnt[1] ),
    .C(\interval_cnt[3] ),
    .D(\interval_cnt[2] ),
    .X(_025_));
 sky130_fd_sc_hd__clkbuf_2 _166_ (.A(_025_),
    .X(_026_));
 sky130_fd_sc_hd__or3_1 _167_ (.A(\interval_cnt[5] ),
    .B(\interval_cnt[4] ),
    .C(_026_),
    .X(_027_));
 sky130_fd_sc_hd__or2_1 _168_ (.A(_114_),
    .B(_027_),
    .X(_028_));
 sky130_fd_sc_hd__o21ai_1 _169_ (.A1(\interval_cnt[6] ),
    .A2(_027_),
    .B1(_119_),
    .Y(_029_));
 sky130_fd_sc_hd__nor3_2 _170_ (.A(_112_),
    .B(_106_),
    .C(_110_),
    .Y(_030_));
 sky130_fd_sc_hd__a22o_1 _171_ (.A1(\interval_cnt[6] ),
    .A2(_028_),
    .B1(_029_),
    .B2(_030_),
    .X(_006_));
 sky130_fd_sc_hd__or3b_1 _172_ (.A(net3),
    .B(_119_),
    .C_N(net2),
    .X(_031_));
 sky130_fd_sc_hd__a21oi_1 _173_ (.A1(_120_),
    .A2(_031_),
    .B1(_114_),
    .Y(_032_));
 sky130_fd_sc_hd__inv_2 _174_ (.A(\interval_cnt[3] ),
    .Y(_033_));
 sky130_fd_sc_hd__o21a_1 _175_ (.A1(_033_),
    .A2(_120_),
    .B1(_119_),
    .X(_034_));
 sky130_fd_sc_hd__nand2_1 _176_ (.A(_030_),
    .B(_031_),
    .Y(_035_));
 sky130_fd_sc_hd__o22a_1 _177_ (.A1(\interval_cnt[3] ),
    .A2(_032_),
    .B1(_034_),
    .B2(_035_),
    .X(_007_));
 sky130_fd_sc_hd__or2_1 _178_ (.A(net2),
    .B(net3),
    .X(_036_));
 sky130_fd_sc_hd__nand2_1 _179_ (.A(net2),
    .B(net3),
    .Y(_037_));
 sky130_fd_sc_hd__nand2_1 _180_ (.A(_036_),
    .B(_037_),
    .Y(_038_));
 sky130_fd_sc_hd__o21a_1 _181_ (.A1(_098_),
    .A2(_038_),
    .B1(_030_),
    .X(_039_));
 sky130_fd_sc_hd__nor2_1 _182_ (.A(_092_),
    .B(_038_),
    .Y(_040_));
 sky130_fd_sc_hd__o21ai_1 _183_ (.A1(\interval_cnt[4] ),
    .A2(_026_),
    .B1(_092_),
    .Y(_041_));
 sky130_fd_sc_hd__a21oi_1 _184_ (.A1(\interval_cnt[4] ),
    .A2(_026_),
    .B1(_041_),
    .Y(_042_));
 sky130_fd_sc_hd__o21ai_1 _185_ (.A1(_040_),
    .A2(_042_),
    .B1(_107_),
    .Y(_043_));
 sky130_fd_sc_hd__a22o_1 _186_ (.A1(\interval_cnt[4] ),
    .A2(_114_),
    .B1(_039_),
    .B2(_043_),
    .X(_008_));
 sky130_fd_sc_hd__o21a_1 _187_ (.A1(_098_),
    .A2(_037_),
    .B1(_030_),
    .X(_044_));
 sky130_fd_sc_hd__o21ai_1 _188_ (.A1(\interval_cnt[4] ),
    .A2(_026_),
    .B1(\interval_cnt[5] ),
    .Y(_045_));
 sky130_fd_sc_hd__nor2_1 _189_ (.A(_092_),
    .B(_037_),
    .Y(_046_));
 sky130_fd_sc_hd__a31o_1 _190_ (.A1(_092_),
    .A2(_027_),
    .A3(_045_),
    .B1(_046_),
    .X(_047_));
 sky130_fd_sc_hd__nand2_1 _191_ (.A(_107_),
    .B(_047_),
    .Y(_048_));
 sky130_fd_sc_hd__a22o_1 _192_ (.A1(\interval_cnt[5] ),
    .A2(_114_),
    .B1(_044_),
    .B2(_048_),
    .X(_009_));
 sky130_fd_sc_hd__o21a_1 _193_ (.A1(\interval_cnt[6] ),
    .A2(_027_),
    .B1(\interval_cnt[7] ),
    .X(_049_));
 sky130_fd_sc_hd__or4_2 _194_ (.A(\interval_cnt[5] ),
    .B(\interval_cnt[4] ),
    .C(\interval_cnt[6] ),
    .D(\interval_cnt[7] ),
    .X(_050_));
 sky130_fd_sc_hd__nor2_1 _195_ (.A(_050_),
    .B(_026_),
    .Y(_051_));
 sky130_fd_sc_hd__o311a_1 _196_ (.A1(_095_),
    .A2(_049_),
    .A3(_051_),
    .B1(_030_),
    .C1(_031_),
    .X(_052_));
 sky130_fd_sc_hd__a21o_1 _197_ (.A1(\interval_cnt[7] ),
    .A2(_114_),
    .B1(_052_),
    .X(_010_));
 sky130_fd_sc_hd__nor3_1 _198_ (.A(\interval_cnt[8] ),
    .B(_050_),
    .C(_026_),
    .Y(_053_));
 sky130_fd_sc_hd__o21a_1 _199_ (.A1(_050_),
    .A2(_026_),
    .B1(\interval_cnt[8] ),
    .X(_054_));
 sky130_fd_sc_hd__o21a_1 _200_ (.A1(_053_),
    .A2(_054_),
    .B1(_092_),
    .X(_055_));
 sky130_fd_sc_hd__o21ai_1 _201_ (.A1(_040_),
    .A2(_055_),
    .B1(_107_),
    .Y(_056_));
 sky130_fd_sc_hd__o2bb2a_1 _202_ (.A1_N(_039_),
    .A2_N(_056_),
    .B1(\interval_cnt[8] ),
    .B2(_030_),
    .X(_011_));
 sky130_fd_sc_hd__inv_2 _203_ (.A(\interval_cnt[9] ),
    .Y(_057_));
 sky130_fd_sc_hd__or4_1 _204_ (.A(_057_),
    .B(\interval_cnt[8] ),
    .C(_050_),
    .D(_026_),
    .X(_058_));
 sky130_fd_sc_hd__o31ai_1 _205_ (.A1(\interval_cnt[8] ),
    .A2(_050_),
    .A3(_026_),
    .B1(_057_),
    .Y(_059_));
 sky130_fd_sc_hd__a31o_1 _206_ (.A1(_092_),
    .A2(_058_),
    .A3(_059_),
    .B1(_046_),
    .X(_060_));
 sky130_fd_sc_hd__nand2_1 _207_ (.A(_107_),
    .B(_060_),
    .Y(_061_));
 sky130_fd_sc_hd__o2bb2a_1 _208_ (.A1_N(_044_),
    .A2_N(_061_),
    .B1(\interval_cnt[9] ),
    .B2(_030_),
    .X(_012_));
 sky130_fd_sc_hd__and2_1 _209_ (.A(_107_),
    .B(ack_s2),
    .X(_062_));
 sky130_fd_sc_hd__clkbuf_1 _210_ (.A(_062_),
    .X(_013_));
 sky130_fd_sc_hd__and2b_1 _211_ (.A_N(_108_),
    .B(_092_),
    .X(_063_));
 sky130_fd_sc_hd__o311a_1 _212_ (.A1(_101_),
    .A2(_103_),
    .A3(_104_),
    .B1(_108_),
    .C1(_096_),
    .X(_064_));
 sky130_fd_sc_hd__o211a_1 _213_ (.A1(_063_),
    .A2(_064_),
    .B1(net5),
    .C1(_094_),
    .X(_065_));
 sky130_fd_sc_hd__nand2_1 _214_ (.A(_108_),
    .B(_065_),
    .Y(_066_));
 sky130_fd_sc_hd__inv_2 _215_ (.A(_098_),
    .Y(_067_));
 sky130_fd_sc_hd__a21o_1 _216_ (.A1(\window_cnt[0] ),
    .A2(_065_),
    .B1(_067_),
    .X(_068_));
 sky130_fd_sc_hd__a21oi_1 _217_ (.A1(_101_),
    .A2(_066_),
    .B1(_068_),
    .Y(_014_));
 sky130_fd_sc_hd__o211ai_4 _218_ (.A1(_063_),
    .A2(_064_),
    .B1(net5),
    .C1(_094_),
    .Y(_069_));
 sky130_fd_sc_hd__o21ai_1 _219_ (.A1(\window_cnt[0] ),
    .A2(_069_),
    .B1(\window_cnt[1] ),
    .Y(_070_));
 sky130_fd_sc_hd__or2_2 _220_ (.A(\window_cnt[1] ),
    .B(\window_cnt[0] ),
    .X(_071_));
 sky130_fd_sc_hd__a21o_1 _221_ (.A1(_108_),
    .A2(_071_),
    .B1(_069_),
    .X(_072_));
 sky130_fd_sc_hd__a21oi_1 _222_ (.A1(_070_),
    .A2(_072_),
    .B1(_067_),
    .Y(_015_));
 sky130_fd_sc_hd__o21a_1 _223_ (.A1(\window_cnt[2] ),
    .A2(_071_),
    .B1(_108_),
    .X(_073_));
 sky130_fd_sc_hd__nor2_1 _224_ (.A(_069_),
    .B(_073_),
    .Y(_074_));
 sky130_fd_sc_hd__o21a_1 _225_ (.A1(_069_),
    .A2(_071_),
    .B1(\window_cnt[2] ),
    .X(_075_));
 sky130_fd_sc_hd__o21a_1 _226_ (.A1(_074_),
    .A2(_075_),
    .B1(_107_),
    .X(_016_));
 sky130_fd_sc_hd__or3b_1 _227_ (.A(\window_cnt[2] ),
    .B(_071_),
    .C_N(\window_cnt[3] ),
    .X(_076_));
 sky130_fd_sc_hd__o221a_1 _228_ (.A1(\window_cnt[3] ),
    .A2(_074_),
    .B1(_076_),
    .B2(_066_),
    .C1(_107_),
    .X(_017_));
 sky130_fd_sc_hd__o41a_1 _229_ (.A1(\window_cnt[3] ),
    .A2(\window_cnt[2] ),
    .A3(_069_),
    .A4(_071_),
    .B1(\window_cnt[4] ),
    .X(_077_));
 sky130_fd_sc_hd__or2_1 _230_ (.A(_103_),
    .B(_071_),
    .X(_078_));
 sky130_fd_sc_hd__a21oi_1 _231_ (.A1(_108_),
    .A2(_078_),
    .B1(_069_),
    .Y(_079_));
 sky130_fd_sc_hd__o21a_1 _232_ (.A1(_077_),
    .A2(_079_),
    .B1(_107_),
    .X(_018_));
 sky130_fd_sc_hd__inv_2 _233_ (.A(_078_),
    .Y(_080_));
 sky130_fd_sc_hd__a31oi_1 _234_ (.A1(_108_),
    .A2(_065_),
    .A3(_080_),
    .B1(\window_cnt[5] ),
    .Y(_081_));
 sky130_fd_sc_hd__a211oi_1 _235_ (.A1(\window_cnt[5] ),
    .A2(_079_),
    .B1(_081_),
    .C1(_067_),
    .Y(_019_));
 sky130_fd_sc_hd__and2b_1 _236_ (.A_N(\blink_div[0] ),
    .B(_098_),
    .X(_082_));
 sky130_fd_sc_hd__clkbuf_1 _237_ (.A(_082_),
    .X(_020_));
 sky130_fd_sc_hd__o21ai_1 _238_ (.A1(\blink_div[0] ),
    .A2(\blink_div[1] ),
    .B1(_107_),
    .Y(_083_));
 sky130_fd_sc_hd__a21oi_1 _239_ (.A1(\blink_div[0] ),
    .A2(\blink_div[1] ),
    .B1(_083_),
    .Y(_021_));
 sky130_fd_sc_hd__a21o_1 _240_ (.A1(\blink_div[0] ),
    .A2(\blink_div[1] ),
    .B1(\blink_div[2] ),
    .X(_084_));
 sky130_fd_sc_hd__nand3_1 _241_ (.A(\blink_div[0] ),
    .B(\blink_div[2] ),
    .C(\blink_div[1] ),
    .Y(_085_));
 sky130_fd_sc_hd__and3_1 _242_ (.A(_098_),
    .B(_084_),
    .C(_085_),
    .X(_086_));
 sky130_fd_sc_hd__clkbuf_1 _243_ (.A(_086_),
    .X(_022_));
 sky130_fd_sc_hd__and2_1 _244_ (.A(_098_),
    .B(net1),
    .X(_087_));
 sky130_fd_sc_hd__clkbuf_1 _245_ (.A(_087_),
    .X(_023_));
 sky130_fd_sc_hd__and2_1 _246_ (.A(_098_),
    .B(ack_s1),
    .X(_088_));
 sky130_fd_sc_hd__clkbuf_1 _247_ (.A(_088_),
    .X(_024_));
 sky130_fd_sc_hd__dfxtp_1 _248_ (.CLK(clk),
    .D(_003_),
    .Q(\interval_cnt[0] ));
 sky130_fd_sc_hd__dfxtp_1 _249_ (.CLK(clk),
    .D(_004_),
    .Q(\interval_cnt[1] ));
 sky130_fd_sc_hd__dfxtp_1 _250_ (.CLK(clk),
    .D(_005_),
    .Q(\interval_cnt[2] ));
 sky130_fd_sc_hd__dfxtp_1 _251_ (.CLK(clk),
    .D(_006_),
    .Q(\interval_cnt[6] ));
 sky130_fd_sc_hd__dfxtp_1 _252_ (.CLK(clk),
    .D(_007_),
    .Q(\interval_cnt[3] ));
 sky130_fd_sc_hd__dfxtp_1 _253_ (.CLK(clk),
    .D(_008_),
    .Q(\interval_cnt[4] ));
 sky130_fd_sc_hd__dfxtp_1 _254_ (.CLK(clk),
    .D(_009_),
    .Q(\interval_cnt[5] ));
 sky130_fd_sc_hd__dfxtp_1 _255_ (.CLK(clk),
    .D(_010_),
    .Q(\interval_cnt[7] ));
 sky130_fd_sc_hd__dfxtp_1 _256_ (.CLK(clk),
    .D(_011_),
    .Q(\interval_cnt[8] ));
 sky130_fd_sc_hd__dfxtp_1 _257_ (.CLK(clk),
    .D(_012_),
    .Q(\interval_cnt[9] ));
 sky130_fd_sc_hd__dfxtp_1 _258_ (.CLK(clk),
    .D(_000_),
    .Q(\state[0] ));
 sky130_fd_sc_hd__dfxtp_1 _259_ (.CLK(clk),
    .D(_001_),
    .Q(net8));
 sky130_fd_sc_hd__dfxtp_1 _260_ (.CLK(clk),
    .D(_002_),
    .Q(\state[2] ));
 sky130_fd_sc_hd__dfxtp_1 _261_ (.CLK(clk),
    .D(_013_),
    .Q(ack_prev));
 sky130_fd_sc_hd__dfxtp_1 _262_ (.CLK(clk),
    .D(_014_),
    .Q(\window_cnt[0] ));
 sky130_fd_sc_hd__dfxtp_1 _263_ (.CLK(clk),
    .D(_015_),
    .Q(\window_cnt[1] ));
 sky130_fd_sc_hd__dfxtp_1 _264_ (.CLK(clk),
    .D(_016_),
    .Q(\window_cnt[2] ));
 sky130_fd_sc_hd__dfxtp_1 _265_ (.CLK(clk),
    .D(_017_),
    .Q(\window_cnt[3] ));
 sky130_fd_sc_hd__dfxtp_1 _266_ (.CLK(clk),
    .D(_018_),
    .Q(\window_cnt[4] ));
 sky130_fd_sc_hd__dfxtp_1 _267_ (.CLK(clk),
    .D(_019_),
    .Q(\window_cnt[5] ));
 sky130_fd_sc_hd__dfxtp_1 _268_ (.CLK(clk),
    .D(_020_),
    .Q(\blink_div[0] ));
 sky130_fd_sc_hd__dfxtp_1 _269_ (.CLK(clk),
    .D(_021_),
    .Q(\blink_div[1] ));
 sky130_fd_sc_hd__dfxtp_1 _270_ (.CLK(clk),
    .D(_022_),
    .Q(\blink_div[2] ));
 sky130_fd_sc_hd__dfxtp_1 _271_ (.CLK(clk),
    .D(_023_),
    .Q(ack_s1));
 sky130_fd_sc_hd__dfxtp_1 _272_ (.CLK(clk),
    .D(_024_),
    .Q(ack_s2));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Right_6 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Right_7 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Right_8 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Right_9 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Right_10 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Right_11 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Right_12 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Right_13 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Right_14 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Right_15 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Right_16 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Right_17 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Right_18 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Right_19 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Right_20 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_21_Right_21 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_22 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_23 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_24 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_25 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_26 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_27 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_28 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_29 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_30 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_31 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Left_32 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Left_33 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Left_34 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Left_35 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Left_36 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Left_37 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Left_38 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Left_39 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Left_40 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Left_41 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_20_Left_42 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_21_Left_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_58 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_59 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_60 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_61 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_62 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_63 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_64 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_65 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_66 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_67 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_68 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_69 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_70 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_71 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_72 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_73 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_74 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_75 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_76 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_77 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_78 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_79 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_80 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_81 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_82 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_83 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_84 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_85 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_86 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_20_87 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_88 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_89 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_90 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_21_91 ();
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(ack_btn),
    .X(net1));
 sky130_fd_sc_hd__buf_1 input2 (.A(interval_sel[0]),
    .X(net2));
 sky130_fd_sc_hd__buf_1 input3 (.A(interval_sel[1]),
    .X(net3));
 sky130_fd_sc_hd__buf_1 input4 (.A(rst_n),
    .X(net4));
 sky130_fd_sc_hd__buf_2 input5 (.A(tick_1min),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_2 output6 (.A(net6),
    .X(buzzer));
 sky130_fd_sc_hd__clkbuf_2 output7 (.A(net7),
    .X(led));
 sky130_fd_sc_hd__clkbuf_2 output8 (.A(net8),
    .X(missed_dose_flag));
endmodule
