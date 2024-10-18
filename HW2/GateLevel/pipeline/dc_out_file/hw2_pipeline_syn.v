/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : V-2023.12
// Date      : Fri Oct 18 15:16:49 2024
/////////////////////////////////////////////////////////////


module stage1_pipe_DW01_sub_0 ( DIFF, \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , 
        \A[2] , \A[1] , \A[0] , \B[7] , \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , 
        \B[1] , \B[0]  );
  output [8:0] DIFF;
  input \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , \B[7] ,
         \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0] ;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [7:0] A;
  wire   [7:0] B;
  wire   [8:2] carry;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign A[0] = \A[0] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;

  FA1D1BWP16P90LVT U2_7 ( .A(A[7]), .B(n3), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  FA1D1BWP16P90LVT U2_6 ( .A(A[6]), .B(n4), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  FA1D1BWP16P90LVT U2_5 ( .A(A[5]), .B(n5), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  FA1D1BWP16P90LVT U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  FA1D1BWP16P90LVT U2_3 ( .A(A[3]), .B(n7), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  FA1D1BWP16P90LVT U2_2 ( .A(A[2]), .B(n8), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  FA1D1BWP16P90LVT U2_1 ( .A(A[1]), .B(n9), .CI(n1), .CO(carry[2]), .S(DIFF[1]) );
  CKND1BWP16P90LVT U1 ( .I(B[1]), .ZN(n9) );
  CKND1BWP16P90LVT U2 ( .I(carry[8]), .ZN(DIFF[8]) );
  CKND1BWP16P90LVT U3 ( .I(B[5]), .ZN(n5) );
  CKND1BWP16P90LVT U4 ( .I(B[6]), .ZN(n4) );
  CKND1BWP16P90LVT U5 ( .I(B[4]), .ZN(n6) );
  CKND1BWP16P90LVT U6 ( .I(B[3]), .ZN(n7) );
  CKND1BWP16P90LVT U7 ( .I(B[2]), .ZN(n8) );
  OR2D1BWP16P90LVT U8 ( .A1(A[0]), .A2(n10), .Z(n1) );
  CKND1BWP16P90LVT U9 ( .I(B[7]), .ZN(n3) );
  CKND1BWP16P90LVT U10 ( .I(B[0]), .ZN(n10) );
  XNR2D1BWP16P90LVT U11 ( .A1(n10), .A2(A[0]), .ZN(DIFF[0]) );
endmodule


module stage1_pipe_DW01_add_0 ( SUM, \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , 
        \A[2] , \A[1] , \A[0] , \B[7] , \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , 
        \B[1] , \B[0]  );
  output [8:0] SUM;
  input \A[7] , \A[6] , \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , \B[7] ,
         \B[6] , \B[5] , \B[4] , \B[3] , \B[2] , \B[1] , \B[0] ;
  wire   n1;
  wire   [7:0] A;
  wire   [7:0] B;
  wire   [7:2] carry;
  assign A[7] = \A[7] ;
  assign A[6] = \A[6] ;
  assign A[5] = \A[5] ;
  assign A[4] = \A[4] ;
  assign A[3] = \A[3] ;
  assign A[2] = \A[2] ;
  assign A[1] = \A[1] ;
  assign A[0] = \A[0] ;
  assign B[7] = \B[7] ;
  assign B[6] = \B[6] ;
  assign B[5] = \B[5] ;
  assign B[4] = \B[4] ;
  assign B[3] = \B[3] ;
  assign B[2] = \B[2] ;
  assign B[1] = \B[1] ;
  assign B[0] = \B[0] ;

  FA1D1BWP16P90LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(
        SUM[7]) );
  FA1D1BWP16P90LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), 
        .S(SUM[6]) );
  FA1D1BWP16P90LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), 
        .S(SUM[5]) );
  FA1D1BWP16P90LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), 
        .S(SUM[4]) );
  FA1D1BWP16P90LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), 
        .S(SUM[3]) );
  FA1D1BWP16P90LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), 
        .S(SUM[2]) );
  FA1D1BWP16P90LVT U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(
        SUM[1]) );
  AN2D1BWP16P90LVT U1 ( .A1(B[0]), .A2(A[0]), .Z(n1) );
  XOR2D1BWP16P90LVT U2 ( .A1(B[0]), .A2(A[0]), .Z(SUM[0]) );
endmodule


module stage1_pipe ( sum, a, b, s );
  output [15:0] sum;
  input [7:0] a;
  input [7:0] b;
  input s;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, n60, n1;
  assign sum[9] = sum[15];
  assign sum[10] = sum[15];
  assign sum[11] = sum[15];
  assign sum[12] = sum[15];
  assign sum[13] = sum[15];
  assign sum[14] = sum[15];

  AO21D1BWP16P90LVT U6 ( .A1(s), .A2(N11), .B(sum[15]), .Z(sum[8]) );
  AO22D1BWP16P90LVT U7 ( .A1(N19), .A2(n1), .B1(N10), .B2(s), .Z(sum[7]) );
  AO22D1BWP16P90LVT U8 ( .A1(N9), .A2(s), .B1(N18), .B2(n1), .Z(sum[6]) );
  AO22D1BWP16P90LVT U9 ( .A1(N8), .A2(s), .B1(N17), .B2(n1), .Z(sum[5]) );
  AO22D1BWP16P90LVT U10 ( .A1(N7), .A2(s), .B1(N16), .B2(n1), .Z(sum[4]) );
  AO22D1BWP16P90LVT U11 ( .A1(N6), .A2(s), .B1(N15), .B2(n1), .Z(sum[3]) );
  AO22D1BWP16P90LVT U12 ( .A1(N5), .A2(s), .B1(N14), .B2(n1), .Z(sum[2]) );
  AO22D1BWP16P90LVT U13 ( .A1(N4), .A2(s), .B1(N13), .B2(n1), .Z(sum[1]) );
  AO22D1BWP16P90LVT U15 ( .A1(N3), .A2(s), .B1(N12), .B2(n1), .Z(sum[0]) );
  stage1_pipe_DW01_sub_0 sub_22 ( .DIFF({N20, N19, N18, N17, N16, N15, N14, 
        N13, N12}), .\A[7] (a[7]), .\A[6] (a[6]), .\A[5] (a[5]), .\A[4] (a[4]), 
        .\A[3] (a[3]), .\A[2] (a[2]), .\A[1] (a[1]), .\A[0] (a[0]), .\B[7] (
        b[7]), .\B[6] (b[6]), .\B[5] (b[5]), .\B[4] (b[4]), .\B[3] (b[3]), 
        .\B[2] (b[2]), .\B[1] (b[1]), .\B[0] (b[0]) );
  stage1_pipe_DW01_add_0 add_22 ( .SUM({N11, N10, N9, N8, N7, N6, N5, N4, N3}), 
        .\A[7] (a[7]), .\A[6] (a[6]), .\A[5] (a[5]), .\A[4] (a[4]), .\A[3] (
        a[3]), .\A[2] (a[2]), .\A[1] (a[1]), .\A[0] (a[0]), .\B[7] (b[7]), 
        .\B[6] (b[6]), .\B[5] (b[5]), .\B[4] (b[4]), .\B[3] (b[3]), .\B[2] (
        b[2]), .\B[1] (b[1]), .\B[0] (b[0]) );
  TIELBWP20P90LVT U2 ( .ZN(n60) );
  INR2D1BWP16P90LVT U3 ( .A1(N20), .B1(s), .ZN(sum[15]) );
  CKND1BWP16P90LVT U4 ( .I(s), .ZN(n1) );
endmodule


module d_ff_0 ( Q, D, clk, rst );
  output [15:0] Q;
  input [15:0] D;
  input clk, rst;
  wire   n1;

  DFCNQD2BWP16P90LVT Q_reg_15_ ( .D(D[15]), .CP(clk), .CDN(n1), .Q(Q[15]) );
  DFCNQD2BWP16P90LVT Q_reg_14_ ( .D(D[14]), .CP(clk), .CDN(n1), .Q(Q[14]) );
  DFCNQD2BWP16P90LVT Q_reg_13_ ( .D(D[13]), .CP(clk), .CDN(n1), .Q(Q[13]) );
  DFCNQD2BWP16P90LVT Q_reg_12_ ( .D(D[12]), .CP(clk), .CDN(n1), .Q(Q[12]) );
  DFCNQD2BWP16P90LVT Q_reg_11_ ( .D(D[11]), .CP(clk), .CDN(n1), .Q(Q[11]) );
  DFCNQD2BWP16P90LVT Q_reg_10_ ( .D(D[10]), .CP(clk), .CDN(n1), .Q(Q[10]) );
  DFCNQD2BWP16P90LVT Q_reg_8_ ( .D(D[8]), .CP(clk), .CDN(n1), .Q(Q[8]) );
  DFCNQD2BWP16P90LVT Q_reg_6_ ( .D(D[6]), .CP(clk), .CDN(n1), .Q(Q[6]) );
  DFCNQD2BWP16P90LVT Q_reg_5_ ( .D(D[5]), .CP(clk), .CDN(n1), .Q(Q[5]) );
  DFCNQD2BWP16P90LVT Q_reg_4_ ( .D(D[4]), .CP(clk), .CDN(n1), .Q(Q[4]) );
  DFCNQD2BWP16P90LVT Q_reg_3_ ( .D(D[3]), .CP(clk), .CDN(n1), .Q(Q[3]) );
  DFCNQD2BWP16P90LVT Q_reg_2_ ( .D(D[2]), .CP(clk), .CDN(n1), .Q(Q[2]) );
  DFCNQD2BWP16P90LVT Q_reg_0_ ( .D(D[0]), .CP(clk), .CDN(n1), .Q(Q[0]) );
  DFCNQD2BWP16P90LVT Q_reg_9_ ( .D(D[9]), .CP(clk), .CDN(n1), .Q(Q[9]) );
  DFCNQD2BWP16P90LVT Q_reg_7_ ( .D(D[7]), .CP(clk), .CDN(n1), .Q(Q[7]) );
  DFCNQD2BWP16P90LVT Q_reg_1_ ( .D(D[1]), .CP(clk), .CDN(n1), .Q(Q[1]) );
  INVD1BWP16P90LVT U3 ( .I(rst), .ZN(n1) );
endmodule


module d_ff_1 ( Q, D, clk, rst );
  output [15:0] Q;
  input [15:0] D;
  input clk, rst;
  wire   n1;

  DFCNQD2BWP16P90LVT Q_reg_15_ ( .D(D[15]), .CP(clk), .CDN(n1), .Q(Q[15]) );
  DFCNQD2BWP16P90LVT Q_reg_14_ ( .D(D[14]), .CP(clk), .CDN(n1), .Q(Q[14]) );
  DFCNQD2BWP16P90LVT Q_reg_13_ ( .D(D[13]), .CP(clk), .CDN(n1), .Q(Q[13]) );
  DFCNQD2BWP16P90LVT Q_reg_12_ ( .D(D[12]), .CP(clk), .CDN(n1), .Q(Q[12]) );
  DFCNQD2BWP16P90LVT Q_reg_11_ ( .D(D[11]), .CP(clk), .CDN(n1), .Q(Q[11]) );
  DFCNQD2BWP16P90LVT Q_reg_10_ ( .D(D[10]), .CP(clk), .CDN(n1), .Q(Q[10]) );
  DFCNQD2BWP16P90LVT Q_reg_9_ ( .D(D[9]), .CP(clk), .CDN(n1), .Q(Q[9]) );
  DFCNQD2BWP16P90LVT Q_reg_8_ ( .D(D[8]), .CP(clk), .CDN(n1), .Q(Q[8]) );
  DFCNQD2BWP16P90LVT Q_reg_7_ ( .D(D[7]), .CP(clk), .CDN(n1), .Q(Q[7]) );
  DFCNQD2BWP16P90LVT Q_reg_6_ ( .D(D[6]), .CP(clk), .CDN(n1), .Q(Q[6]) );
  DFCNQD2BWP16P90LVT Q_reg_5_ ( .D(D[5]), .CP(clk), .CDN(n1), .Q(Q[5]) );
  DFCNQD2BWP16P90LVT Q_reg_4_ ( .D(D[4]), .CP(clk), .CDN(n1), .Q(Q[4]) );
  DFCNQD2BWP16P90LVT Q_reg_3_ ( .D(D[3]), .CP(clk), .CDN(n1), .Q(Q[3]) );
  DFCNQD2BWP16P90LVT Q_reg_2_ ( .D(D[2]), .CP(clk), .CDN(n1), .Q(Q[2]) );
  DFCNQD2BWP16P90LVT Q_reg_1_ ( .D(D[1]), .CP(clk), .CDN(n1), .Q(Q[1]) );
  DFCNQD2BWP16P90LVT Q_reg_0_ ( .D(D[0]), .CP(clk), .CDN(n1), .Q(Q[0]) );
  INVD1BWP16P90LVT U3 ( .I(rst), .ZN(n1) );
endmodule


module stage2_pipe_DW_mult_uns_2 ( a, b, \product[15] , \product[14] , 
        \product[13] , \product[12] , \product[11] , \product[10] , 
        \product[9] , \product[8] , \product[7] , \product[6] , \product[5] , 
        \product[4] , \product[3] , \product[2] , \product[1] , \product[0] 
 );
  input [15:0] a;
  input [15:0] b;
  output \product[15] , \product[14] , \product[13] , \product[12] ,
         \product[11] , \product[10] , \product[9] , \product[8] ,
         \product[7] , \product[6] , \product[5] , \product[4] , \product[3] ,
         \product[2] , \product[1] , \product[0] ;
  wire   n6, n9, n12, n16, n17, n21, n23, n27, n29, n32, n34, n37, n39, n41,
         n42, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n78, n80, n81, n83, n85, n86, n87, n89, n91, n92,
         n93, n94, n95, n97, n99, n100, n101, n102, n103, n105, n107, n108,
         n109, n110, n111, n113, n115, n121, n122, n123, n124, n126, n127,
         n128, n132, n134, n136, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n406, n407, n408, n409, n410, n411, n412, n413, n418, n419,
         n420, n421, n422, n423, n424, n426, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629;
  wire   [15:0] product;
  assign \product[15]  = product[15];
  assign \product[14]  = product[14];
  assign \product[13]  = product[13];
  assign \product[12]  = product[12];
  assign \product[11]  = product[11];
  assign \product[10]  = product[10];
  assign \product[9]  = product[9];
  assign \product[8]  = product[8];
  assign \product[7]  = product[7];
  assign \product[6]  = product[6];
  assign \product[5]  = product[5];
  assign \product[4]  = product[4];
  assign \product[3]  = product[3];
  assign \product[2]  = product[2];
  assign \product[1]  = product[1];
  assign \product[0]  = product[0];

  ND2D1BWP16P90LVT U34 ( .A1(n614), .A2(n61), .ZN(n45) );
  ND2D1BWP16P90LVT U37 ( .A1(n147), .A2(n140), .ZN(n61) );
  ND2D1BWP16P90LVT U40 ( .A1(n126), .A2(n64), .ZN(n46) );
  ND2D1BWP16P90LVT U43 ( .A1(n148), .A2(n159), .ZN(n64) );
  NR2D2BWP16P90LVT U50 ( .A1(n552), .A2(n171), .ZN(n68) );
  ND2D1BWP16P90LVT U54 ( .A1(n128), .A2(n72), .ZN(n48) );
  ND2D1BWP16P90LVT U68 ( .A1(n182), .A2(n191), .ZN(n80) );
  ND2D1BWP16P90LVT U96 ( .A1(n610), .A2(n99), .ZN(n53) );
  ND2D1BWP16P90LVT U102 ( .A1(n134), .A2(n102), .ZN(n54) );
  ND2D1BWP16P90LVT U116 ( .A1(n136), .A2(n110), .ZN(n56) );
  ND2D1BWP16P90LVT U119 ( .A1(n228), .A2(n229), .ZN(n110) );
  ND2D1BWP16P90LVT U124 ( .A1(n612), .A2(n115), .ZN(n57) );
  ND2D1BWP16P90LVT U127 ( .A1(n230), .A2(n293), .ZN(n115) );
  ND2D1BWP16P90LVT U133 ( .A1(n613), .A2(n121), .ZN(n58) );
  ND2D1BWP16P90LVT U136 ( .A1(n308), .A2(n294), .ZN(n121) );
  FA1D1BWP16P90LVT U150 ( .A(n152), .B(n161), .CI(n150), .CO(n147), .S(n148)
         );
  FA1D1BWP16P90LVT U151 ( .A(n156), .B(n163), .CI(n154), .CO(n149), .S(n150)
         );
  FA1D1BWP16P90LVT U152 ( .A(n167), .B(n165), .CI(n158), .CO(n151), .S(n152)
         );
  FA1D1BWP16P90LVT U153 ( .A(n296), .B(n282), .CI(n169), .CO(n153), .S(n154)
         );
  FA1D1BWP16P90LVT U155 ( .A(n240), .B(n242), .CI(n246), .CO(n157), .S(n158)
         );
  FA1D1BWP16P90LVT U157 ( .A(n166), .B(n168), .CI(n175), .CO(n161), .S(n162)
         );
  FA1D1BWP16P90LVT U159 ( .A(n271), .B(n297), .CI(n283), .CO(n165), .S(n166)
         );
  FA1D1BWP16P90LVT U160 ( .A(n232), .B(n261), .CI(n253), .CO(n167), .S(n168)
         );
  FA1D1BWP16P90LVT U175 ( .A(n264), .B(n250), .CI(n256), .CO(n197), .S(n198)
         );
  OAI22D1BWP16P90LVT U192 ( .A1(n312), .A2(n41), .B1(n42), .B2(n419), .ZN(n231) );
  OAI22D1BWP16P90LVT U199 ( .A1(n39), .A2(n314), .B1(n313), .B2(n37), .ZN(n241) );
  OAI22D1BWP16P90LVT U201 ( .A1(n316), .A2(n39), .B1(n315), .B2(n37), .ZN(n243) );
  OAI22D1BWP16P90LVT U208 ( .A1(n34), .A2(n421), .B1(n324), .B2(n32), .ZN(n233) );
  OAI22D1BWP16P90LVT U209 ( .A1(n573), .A2(n319), .B1(n318), .B2(n32), .ZN(
        n245) );
  OAI22D1BWP16P90LVT U210 ( .A1(n572), .A2(n320), .B1(n319), .B2(n32), .ZN(
        n246) );
  OAI22D1BWP16P90LVT U211 ( .A1(n572), .A2(n321), .B1(n320), .B2(n32), .ZN(
        n247) );
  OAI22D1BWP16P90LVT U240 ( .A1(n617), .A2(n423), .B1(n344), .B2(n503), .ZN(
        n235) );
  OAI22D1BWP16P90LVT U242 ( .A1(n617), .A2(n336), .B1(n335), .B2(n503), .ZN(
        n260) );
  OAI22D1BWP16P90LVT U243 ( .A1(n617), .A2(n337), .B1(n336), .B2(n503), .ZN(
        n261) );
  OAI22D1BWP16P90LVT U249 ( .A1(n343), .A2(n617), .B1(n342), .B2(n503), .ZN(
        n267) );
  OAI22D1BWP16P90LVT U265 ( .A1(n593), .A2(n348), .B1(n592), .B2(n347), .ZN(
        n271) );
  OAI22D1BWP16P90LVT U266 ( .A1(n17), .A2(n349), .B1(n592), .B2(n348), .ZN(
        n272) );
  OAI22D1BWP16P90LVT U272 ( .A1(n17), .A2(n355), .B1(n354), .B2(n592), .ZN(
        n278) );
  OAI22D1BWP16P90LVT U273 ( .A1(n356), .A2(n594), .B1(n355), .B2(n592), .ZN(
        n279) );
  OAI22D1BWP16P90LVT U291 ( .A1(n502), .A2(n361), .B1(n489), .B2(n360), .ZN(
        n283) );
  OAI22D1BWP16P90LVT U292 ( .A1(n502), .A2(n362), .B1(n489), .B2(n361), .ZN(
        n284) );
  OAI22D1BWP16P90LVT U295 ( .A1(n501), .A2(n365), .B1(n489), .B2(n364), .ZN(
        n287) );
  OAI22D1BWP16P90LVT U331 ( .A1(n500), .A2(n386), .B1(n385), .B2(n418), .ZN(
        n307) );
  XNR2D2BWP16P90LVT U393 ( .A1(b[6]), .A2(n626), .ZN(n337) );
  OAI22D1BWP16P90LVT U394 ( .A1(n501), .A2(n360), .B1(n489), .B2(n359), .ZN(
        n282) );
  OAI22D1BWP16P90LVT U395 ( .A1(n501), .A2(n599), .B1(n372), .B2(n489), .ZN(
        n237) );
  ND3D2BWP16P90LVT U396 ( .A1(n544), .A2(n545), .A3(n546), .ZN(n193) );
  INVD2BWP16P90LVT U397 ( .I(n80), .ZN(n78) );
  CKND2D4BWP16P90LVT U398 ( .A1(n192), .A2(n199), .ZN(n551) );
  ND2D1BWP16P90 U399 ( .A1(n192), .A2(n199), .ZN(n85) );
  CKBD8BWP16P90LVT U400 ( .I(a[11]), .Z(n628) );
  XNR2D1BWP16P90LVT U401 ( .A1(b[3]), .A2(n628), .ZN(n320) );
  XNR2D1BWP16P90LVT U402 ( .A1(b[2]), .A2(n628), .ZN(n321) );
  XNR2D1BWP16P90LVT U403 ( .A1(b[4]), .A2(n628), .ZN(n319) );
  XNR2D1BWP16P90LVT U404 ( .A1(b[5]), .A2(n628), .ZN(n318) );
  IND2D1BWP16P90 U405 ( .A1(n629), .B1(n628), .ZN(n324) );
  ND2D2BWP16P90LVT U406 ( .A1(n605), .A2(n606), .ZN(n75) );
  OAI22D2BWP16P90LVT U407 ( .A1(n573), .A2(n322), .B1(n321), .B2(n32), .ZN(
        n248) );
  ND3D2BWP16P90LVT U408 ( .A1(n555), .A2(n556), .A3(n557), .ZN(n211) );
  OAI22D2BWP16P90LVT U409 ( .A1(n617), .A2(n341), .B1(n340), .B2(n503), .ZN(
        n265) );
  ND2D2BWP16P90LVT U410 ( .A1(n16), .A2(n411), .ZN(n594) );
  XOR2D2BWP16P90LVT U411 ( .A1(n233), .A2(n273), .Z(n532) );
  NR2D2BWP16P90LVT U412 ( .A1(n172), .A2(n181), .ZN(n71) );
  XNR2D4BWP16P90LVT U413 ( .A1(n625), .A2(a[6]), .ZN(n21) );
  XNR2D1BWP16P90LVT U414 ( .A1(a[13]), .A2(a[14]), .ZN(n41) );
  XOR2D1BWP16P90LVT U415 ( .A1(a[13]), .A2(a[12]), .Z(n407) );
  XNR2D1BWP16P90LVT U416 ( .A1(n490), .A2(b[1]), .ZN(n370) );
  CKND2D2BWP16P90LVT U417 ( .A1(n9), .A2(n412), .ZN(n12) );
  OR2D1BWP16P90LVT U418 ( .A1(n587), .A2(n588), .Z(n304) );
  OR2D1BWP16P90 U419 ( .A1(n489), .A2(n366), .Z(n515) );
  OAI22D1BWP16P90LVT U420 ( .A1(n617), .A2(n342), .B1(n341), .B2(n503), .ZN(
        n266) );
  ND2D1BWP16P90LVT U421 ( .A1(n41), .A2(n406), .ZN(n42) );
  ND2D1BWP16P90LVT U422 ( .A1(n32), .A2(n408), .ZN(n573) );
  CKND2D1BWP16P90LVT U423 ( .A1(n597), .A2(n598), .ZN(n562) );
  XNR2D1BWP16P90LVT U424 ( .A1(b[6]), .A2(n627), .ZN(n326) );
  OAI22D1BWP16P90LVT U425 ( .A1(n12), .A2(n368), .B1(n530), .B2(n367), .ZN(
        n290) );
  XNR2D1BWP16P90LVT U426 ( .A1(n623), .A2(b[5]), .ZN(n383) );
  XNR2D1BWP16P90LVT U427 ( .A1(n624), .A2(b[5]), .ZN(n366) );
  XNR2D1BWP16P90LVT U428 ( .A1(b[1]), .A2(a[9]), .ZN(n331) );
  XNR2D1BWP16P90LVT U429 ( .A1(n623), .A2(b[8]), .ZN(n380) );
  XNR2D1BWP16P90LVT U430 ( .A1(n623), .A2(b[9]), .ZN(n379) );
  OR2D1BWP16P90LVT U431 ( .A1(n29), .A2(n330), .Z(n581) );
  XNR2D1BWP16P90LVT U432 ( .A1(b[1]), .A2(n628), .ZN(n322) );
  XNR2D1BWP16P90LVT U433 ( .A1(b[3]), .A2(a[9]), .ZN(n329) );
  XOR2D2BWP16P90LVT U434 ( .A1(n532), .A2(n263), .Z(n188) );
  XNR2D1BWP16P90LVT U435 ( .A1(n624), .A2(b[8]), .ZN(n363) );
  XNR2D1BWP16P90LVT U436 ( .A1(n624), .A2(b[9]), .ZN(n362) );
  XNR2D1BWP16P90LVT U437 ( .A1(b[1]), .A2(a[13]), .ZN(n315) );
  ND2D2BWP16P90LVT U438 ( .A1(n32), .A2(n408), .ZN(n572) );
  XNR2D1BWP16P90LVT U439 ( .A1(n623), .A2(b[2]), .ZN(n386) );
  BUFFD1BWP16P90LVT U440 ( .I(n489), .Z(n493) );
  XNR2D1BWP16P90LVT U441 ( .A1(n624), .A2(b[2]), .ZN(n369) );
  XNR2D1BWP16P90LVT U442 ( .A1(n623), .A2(b[3]), .ZN(n385) );
  XNR2D1BWP16P90LVT U443 ( .A1(n623), .A2(b[4]), .ZN(n384) );
  XNR2D1BWP16P90LVT U444 ( .A1(b[1]), .A2(n564), .ZN(n355) );
  OR2D1BWP16P90LVT U445 ( .A1(n357), .A2(n592), .Z(n529) );
  XNR2D1BWP16P90LVT U446 ( .A1(n564), .A2(b[5]), .ZN(n351) );
  XNR2D1BWP16P90LVT U447 ( .A1(n624), .A2(b[7]), .ZN(n364) );
  XNR2D1BWP16P90LVT U448 ( .A1(n624), .A2(b[6]), .ZN(n365) );
  OR2D1BWP16P90LVT U449 ( .A1(n317), .A2(n37), .Z(n578) );
  OR2D1BWP16P90LVT U450 ( .A1(n39), .A2(n420), .Z(n579) );
  XNR2D1BWP16P90LVT U451 ( .A1(n564), .A2(b[8]), .ZN(n348) );
  XNR2D1BWP16P90LVT U452 ( .A1(n624), .A2(b[10]), .ZN(n361) );
  XNR2D1BWP16P90LVT U453 ( .A1(n623), .A2(b[12]), .ZN(n376) );
  XNR2D1BWP16P90LVT U454 ( .A1(n623), .A2(b[11]), .ZN(n377) );
  XNR2D1BWP16P90LVT U455 ( .A1(n623), .A2(b[13]), .ZN(n375) );
  XNR2D1BWP16P90LVT U456 ( .A1(n624), .A2(b[11]), .ZN(n360) );
  XNR2D1BWP16P90LVT U457 ( .A1(n623), .A2(b[14]), .ZN(n374) );
  XNR2D1BWP16P90 U458 ( .A1(n626), .A2(b[7]), .ZN(n336) );
  XNR2D1BWP16P90LVT U459 ( .A1(n564), .A2(b[9]), .ZN(n347) );
  XNR2D1BWP16P90LVT U460 ( .A1(n629), .A2(n490), .ZN(n371) );
  XOR2D1BWP16P90LVT U461 ( .A1(n523), .A2(n226), .Z(n224) );
  XOR2D1BWP16P90LVT U462 ( .A1(n291), .A2(n305), .Z(n523) );
  ND3D1BWP16P90LVT U463 ( .A1(n511), .A2(n512), .A3(n513), .ZN(n215) );
  XNR2D1BWP16P90LVT U464 ( .A1(b[11]), .A2(n564), .ZN(n345) );
  XNR2D1BWP16P90LVT U465 ( .A1(n505), .A2(b[9]), .ZN(n334) );
  XOR2D1BWP16P90LVT U466 ( .A1(n281), .A2(n241), .Z(n146) );
  XOR3D2BWP16P90LVT U467 ( .A1(n231), .A2(n245), .A3(n251), .Z(n145) );
  CKBD8BWP16P90LVT U468 ( .I(b[0]), .Z(n629) );
  ND2D1BWP16P90LVT U469 ( .A1(n224), .A2(n227), .ZN(n107) );
  XOR2D1BWP16P90LVT U470 ( .A1(n536), .A2(n222), .Z(n220) );
  XOR2D1BWP16P90LVT U471 ( .A1(n225), .A2(n290), .Z(n536) );
  CKND1BWP16P90LVT U472 ( .I(n191), .ZN(n549) );
  OR2D1BWP16P90LVT U473 ( .A1(n554), .A2(n199), .Z(n606) );
  CKND1BWP16P90LVT U474 ( .I(n63), .ZN(n126) );
  CKND1BWP16P90LVT U475 ( .I(n59), .ZN(product[1]) );
  XNR2D1BWP16P90LVT U476 ( .A1(n624), .A2(b[3]), .ZN(n368) );
  XOR3D4BWP16P90LVT U477 ( .A1(n166), .A2(n168), .A3(n175), .Z(n485) );
  ND2D1BWP16P90 U478 ( .A1(n127), .A2(n69), .ZN(n47) );
  BUFFD1BWP16P90LVT U479 ( .I(n540), .Z(n590) );
  ND2D1BWP16P90LVT U480 ( .A1(n266), .A2(n276), .ZN(n557) );
  XNR2D2BWP16P90 U481 ( .A1(n629), .A2(n564), .ZN(n356) );
  ND2D1BWP16P90 U482 ( .A1(n608), .A2(n91), .ZN(n51) );
  OAI22D1BWP16P90LVT U483 ( .A1(n323), .A2(n572), .B1(n322), .B2(n32), .ZN(
        n249) );
  XNR2D1BWP16P90LVT U484 ( .A1(b[2]), .A2(a[13]), .ZN(n314) );
  BUFFD4BWP16P90LVT U485 ( .I(a[7]), .Z(n626) );
  XNR2D1BWP16P90LVT U486 ( .A1(b[2]), .A2(a[7]), .ZN(n341) );
  XNR2D1BWP16P90LVT U487 ( .A1(b[1]), .A2(a[7]), .ZN(n342) );
  XNR2D1BWP16P90LVT U488 ( .A1(b[5]), .A2(a[7]), .ZN(n338) );
  XOR3D2BWP16P90LVT U489 ( .A1(n215), .A2(n212), .A3(n210), .Z(n486) );
  HA1D1BWP16P90LVT U490 ( .A(n307), .B(n237), .CO(n229), .S(n230) );
  ND2D2BWP16P90LVT U491 ( .A1(n27), .A2(n409), .ZN(n29) );
  ND3D1BWP16P90 U492 ( .A1(n544), .A2(n545), .A3(n546), .ZN(n487) );
  CKND1BWP16P90LVT U493 ( .I(a[4]), .ZN(n600) );
  XNR2D1BWP16P90LVT U494 ( .A1(n629), .A2(n623), .ZN(n388) );
  XNR2D2BWP16P90LVT U495 ( .A1(n564), .A2(b[4]), .ZN(n352) );
  OAI22D1BWP16P90LVT U496 ( .A1(n594), .A2(n350), .B1(n592), .B2(n349), .ZN(
        n488) );
  OAI22D1BWP16P90LVT U497 ( .A1(n594), .A2(n350), .B1(n592), .B2(n349), .ZN(
        n273) );
  CKND1BWP16P90LVT U498 ( .I(n197), .ZN(n491) );
  XOR3D4BWP16P90LVT U499 ( .A1(n142), .A2(n149), .A3(n141), .Z(n140) );
  XNR2D8BWP16P90LVT U500 ( .A1(n623), .A2(a[2]), .ZN(n489) );
  OAI22D1BWP16P90LVT U501 ( .A1(n500), .A2(n381), .B1(n380), .B2(n418), .ZN(
        n302) );
  CKND2D4BWP16P90LVT U502 ( .A1(n413), .A2(n418), .ZN(n500) );
  INVD1BWP16P90LVT U503 ( .I(n599), .ZN(n490) );
  INVD1BWP16P90LVT U504 ( .I(a[3]), .ZN(n599) );
  BUFFD12BWP16P90LVT U505 ( .I(a[3]), .Z(n624) );
  CKND1BWP16P90LVT U506 ( .I(n491), .ZN(n492) );
  CKND2D4BWP16P90LVT U507 ( .A1(n37), .A2(n407), .ZN(n39) );
  INR2D1BWP16P90LVT U508 ( .A1(n629), .B1(n517), .ZN(n258) );
  OAI22D1BWP16P90LVT U509 ( .A1(n502), .A2(n370), .B1(n369), .B2(n493), .ZN(
        n292) );
  XNR2D2BWP16P90 U510 ( .A1(n624), .A2(b[13]), .ZN(n358) );
  OAI22D2BWP16P90LVT U511 ( .A1(n29), .A2(n422), .B1(n333), .B2(n562), .ZN(
        n234) );
  ND3D1BWP16P90LVT U512 ( .A1(n566), .A2(n567), .A3(n568), .ZN(n171) );
  ND2D1BWP16P90LVT U513 ( .A1(n174), .A2(n183), .ZN(n566) );
  ND2D1BWP16P90LVT U514 ( .A1(n518), .A2(n207), .ZN(n91) );
  OAI22D1BWP16P90LVT U515 ( .A1(n594), .A2(n347), .B1(n592), .B2(n346), .ZN(
        n270) );
  XNR2D2BWP16P90LVT U516 ( .A1(b[8]), .A2(n626), .ZN(n335) );
  CKND2D4BWP16P90LVT U517 ( .A1(n9), .A2(n412), .ZN(n502) );
  NR2D1BWP16P90 U518 ( .A1(n68), .A2(n71), .ZN(n494) );
  AOI21D1BWP16P90LVT U519 ( .A1(n499), .A2(n610), .B(n97), .ZN(n527) );
  OAI21D1BWP16P90LVT U520 ( .A1(n103), .A2(n101), .B(n102), .ZN(n499) );
  NR2D1BWP16P90LVT U521 ( .A1(n486), .A2(n213), .ZN(n495) );
  NR2D1BWP16P90LVT U522 ( .A1(n208), .A2(n213), .ZN(n93) );
  XOR2D4BWP16P90LVT U523 ( .A1(n519), .A2(n217), .Z(n210) );
  XOR2D2BWP16P90LVT U524 ( .A1(n206), .A2(n301), .Z(n558) );
  XOR3D4BWP16P90LVT U525 ( .A1(n193), .A2(n184), .A3(n186), .Z(n182) );
  ND2D1BWP20P90LVT U526 ( .A1(n184), .A2(n186), .ZN(n496) );
  ND2D1BWP16P90 U527 ( .A1(n184), .A2(n487), .ZN(n497) );
  ND2D1BWP16P90 U528 ( .A1(n186), .A2(n487), .ZN(n498) );
  ND3D1BWP16P90LVT U529 ( .A1(n496), .A2(n497), .A3(n498), .ZN(n181) );
  FA1D1BWP16P90LVT U530 ( .A(n299), .B(n285), .CI(n190), .CO(n185), .S(n186)
         );
  CKND2D1BWP16P90LVT U531 ( .A1(n172), .A2(n181), .ZN(n72) );
  HA1D1BWP16P90LVT U532 ( .A(n247), .B(n243), .CO(n169), .S(n170) );
  XNR2D2BWP16P90LVT U533 ( .A1(n624), .A2(b[12]), .ZN(n359) );
  ND2D2BWP16P90LVT U534 ( .A1(n413), .A2(n418), .ZN(n6) );
  ND2D4BWP16P90LVT U535 ( .A1(n577), .A2(n576), .ZN(n413) );
  XNR3D4BWP16P90LVT U536 ( .A1(n205), .A2(n203), .A3(n504), .ZN(n194) );
  XOR2D2BWP16P90LVT U537 ( .A1(n278), .A2(n268), .Z(n583) );
  INVD1BWP16P90LVT U538 ( .I(a[8]), .ZN(n596) );
  OAI22D1BWP16P90LVT U539 ( .A1(n500), .A2(n384), .B1(n383), .B2(n418), .ZN(
        n305) );
  NR2D1BWP16P90LVT U540 ( .A1(n500), .A2(n383), .ZN(n587) );
  AOI21D4BWP16P90LVT U541 ( .A1(n611), .A2(n108), .B(n105), .ZN(n103) );
  OAI22D1BWP16P90LVT U542 ( .A1(n375), .A2(n6), .B1(n374), .B2(n418), .ZN(n296) );
  ND2D2BWP16P90LVT U543 ( .A1(n411), .A2(n16), .ZN(n17) );
  ND2D4BWP16P90LVT U544 ( .A1(n601), .A2(n602), .ZN(n16) );
  OAI22D2BWP16P90LVT U545 ( .A1(n29), .A2(n331), .B1(n330), .B2(n516), .ZN(
        n256) );
  OAI22D1BWP16P90LVT U546 ( .A1(n23), .A2(n335), .B1(n334), .B2(n503), .ZN(
        n259) );
  FA1D1BWP16P90LVT U547 ( .A(n252), .B(n260), .CI(n270), .CO(n155), .S(n156)
         );
  HA1D2BWP16P90LVT U548 ( .A(n249), .B(n255), .CO(n189), .S(n190) );
  XOR3D4BWP16P90LVT U549 ( .A1(n164), .A2(n173), .A3(n485), .Z(n552) );
  XNR2D2BWP16P90LVT U550 ( .A1(n623), .A2(b[7]), .ZN(n381) );
  CKND2D4BWP16P90LVT U551 ( .A1(n9), .A2(n412), .ZN(n501) );
  OAI22D4BWP16P90LVT U552 ( .A1(n23), .A2(n340), .B1(n339), .B2(n503), .ZN(
        n264) );
  XNR2D4BWP16P90LVT U553 ( .A1(b[4]), .A2(n626), .ZN(n339) );
  BUFFD2BWP16P90 U554 ( .I(n9), .Z(n530) );
  XNR2D2BWP16P90LVT U555 ( .A1(n564), .A2(b[7]), .ZN(n349) );
  XNR2D8BWP16P90LVT U556 ( .A1(n564), .A2(a[6]), .ZN(n503) );
  ND2D4BWP16P90LVT U557 ( .A1(n16), .A2(n411), .ZN(n593) );
  INVD1BWP16P90LVT U558 ( .I(n198), .ZN(n504) );
  BUFFD2BWP16P90LVT U559 ( .I(n626), .Z(n505) );
  XOR2D2BWP16P90LVT U560 ( .A1(n164), .A2(n173), .Z(n506) );
  XOR2D2BWP16P90LVT U561 ( .A1(n506), .A2(n162), .Z(n160) );
  ND2D1BWP16P90 U562 ( .A1(n162), .A2(n173), .ZN(n507) );
  ND2D1BWP16P90 U563 ( .A1(n162), .A2(n164), .ZN(n508) );
  ND2D1BWP16P90 U564 ( .A1(n173), .A2(n164), .ZN(n509) );
  ND3D1BWP16P90LVT U565 ( .A1(n507), .A2(n508), .A3(n509), .ZN(n159) );
  NR2D2BWP16P90LVT U566 ( .A1(n148), .A2(n159), .ZN(n63) );
  ND2D1BWP16P90LVT U567 ( .A1(n160), .A2(n171), .ZN(n69) );
  XOR2D4BWP16P90LVT U568 ( .A1(n277), .A2(n303), .Z(n510) );
  XOR2D4BWP16P90LVT U569 ( .A1(n510), .A2(n289), .Z(n216) );
  ND2D1BWP16P90 U570 ( .A1(n289), .A2(n303), .ZN(n511) );
  ND2D1BWP16P90 U571 ( .A1(n289), .A2(n277), .ZN(n512) );
  ND2D1BWP16P90 U572 ( .A1(n303), .A2(n277), .ZN(n513) );
  CKOR2D2BWP16P90LVT U573 ( .A1(n501), .A2(n367), .Z(n514) );
  ND2D2BWP16P90LVT U574 ( .A1(n514), .A2(n515), .ZN(n289) );
  OAI22D1BWP16P90LVT U575 ( .A1(n6), .A2(n382), .B1(n381), .B2(n418), .ZN(n303) );
  OAI22D2BWP16P90LVT U576 ( .A1(n593), .A2(n354), .B1(n353), .B2(n592), .ZN(
        n277) );
  OAI21D1BWP16P90LVT U577 ( .A1(n68), .A2(n72), .B(n69), .ZN(n531) );
  NR2D2BWP16P90LVT U578 ( .A1(n228), .A2(n229), .ZN(n109) );
  ND2D1BWP16P90LVT U579 ( .A1(n597), .A2(n598), .ZN(n516) );
  ND2D1BWP16P90LVT U580 ( .A1(n597), .A2(n598), .ZN(n517) );
  FA1D2BWP16P90LVT U581 ( .A(n280), .B(n306), .CI(n292), .CO(n227), .S(n228)
         );
  XOR3D1BWP16P90LVT U582 ( .A1(n204), .A2(n209), .A3(n202), .Z(n518) );
  XOR2D2BWP16P90LVT U583 ( .A1(n558), .A2(n211), .Z(n202) );
  XOR2D2BWP16P90LVT U584 ( .A1(n302), .A2(n288), .Z(n519) );
  ND2D1BWP16P90 U585 ( .A1(n217), .A2(n302), .ZN(n520) );
  ND2D1BWP16P90 U586 ( .A1(n288), .A2(n217), .ZN(n521) );
  ND2D1BWP16P90 U587 ( .A1(n302), .A2(n288), .ZN(n522) );
  ND3D1BWP16P90LVT U588 ( .A1(n520), .A2(n521), .A3(n522), .ZN(n209) );
  HA1D2BWP16P90LVT U589 ( .A(n235), .B(n267), .CO(n217), .S(n218) );
  OR2D2BWP16P90LVT U590 ( .A1(n200), .A2(n207), .Z(n608) );
  OAI22D1BWP16P90LVT U591 ( .A1(n500), .A2(n385), .B1(n384), .B2(n418), .ZN(
        n306) );
  XOR3D2BWP16P90LVT U592 ( .A1(n258), .A2(n266), .A3(n276), .Z(n212) );
  ND2D1BWP16P90 U593 ( .A1(n226), .A2(n305), .ZN(n524) );
  ND2D1BWP16P90 U594 ( .A1(n226), .A2(n291), .ZN(n525) );
  ND2D1BWP16P90 U595 ( .A1(n305), .A2(n291), .ZN(n526) );
  ND3D1BWP16P90LVT U596 ( .A1(n524), .A2(n525), .A3(n526), .ZN(n223) );
  CKOR2D1BWP16P90LVT U597 ( .A1(n17), .A2(n424), .Z(n528) );
  ND2D2BWP16P90LVT U598 ( .A1(n528), .A2(n529), .ZN(n236) );
  NR2D2BWP16P90LVT U599 ( .A1(n553), .A2(n223), .ZN(n101) );
  OAI21D2BWP16P90LVT U600 ( .A1(n103), .A2(n101), .B(n102), .ZN(n100) );
  ND2D4BWP16P90LVT U601 ( .A1(n601), .A2(n602), .ZN(n592) );
  XNR2D2BWP16P90 U602 ( .A1(n624), .A2(b[4]), .ZN(n367) );
  OAI22D2BWP16P90LVT U603 ( .A1(n332), .A2(n616), .B1(n331), .B2(n517), .ZN(
        n257) );
  XOR2D4BWP16P90LVT U604 ( .A1(n628), .A2(a[10]), .Z(n408) );
  OR2D1BWP16P90LVT U605 ( .A1(n329), .A2(n563), .Z(n582) );
  OAI21D2BWP16P90LVT U606 ( .A1(n109), .A2(n111), .B(n110), .ZN(n108) );
  ND2D1BWP16P90LVT U607 ( .A1(n263), .A2(n488), .ZN(n533) );
  ND2D1BWP16P90LVT U608 ( .A1(n263), .A2(n233), .ZN(n534) );
  ND2D1BWP16P90LVT U609 ( .A1(n488), .A2(n233), .ZN(n535) );
  ND3D2BWP16P90LVT U610 ( .A1(n533), .A2(n534), .A3(n535), .ZN(n187) );
  ND2D2BWP16P90LVT U611 ( .A1(n597), .A2(n598), .ZN(n563) );
  ND2D2BWP16P90LVT U612 ( .A1(n410), .A2(n21), .ZN(n23) );
  ND2D1BWP16P90LVT U613 ( .A1(n203), .A2(n198), .ZN(n544) );
  ND2D1BWP16P90 U614 ( .A1(n222), .A2(n290), .ZN(n537) );
  ND2D1BWP16P90 U615 ( .A1(n222), .A2(n225), .ZN(n538) );
  ND2D1BWP16P90 U616 ( .A1(n290), .A2(n225), .ZN(n539) );
  ND3D1BWP16P90LVT U617 ( .A1(n537), .A2(n538), .A3(n539), .ZN(n219) );
  OAI21D1BWP16P90 U618 ( .A1(n103), .A2(n101), .B(n102), .ZN(n540) );
  XOR2D2BWP16P90LVT U619 ( .A1(n583), .A2(n304), .Z(n222) );
  ND2D2BWP16P90LVT U620 ( .A1(n547), .A2(n219), .ZN(n99) );
  ND2D1BWP16P90LVT U621 ( .A1(n220), .A2(n223), .ZN(n102) );
  ND2D2BWP16P90LVT U622 ( .A1(n564), .A2(n569), .ZN(n570) );
  XOR3D4BWP16P90LVT U623 ( .A1(n300), .A2(n286), .A3(n274), .Z(n196) );
  ND2D1BWP16P90LVT U624 ( .A1(n274), .A2(n286), .ZN(n541) );
  ND2D1BWP16P90LVT U625 ( .A1(n286), .A2(n300), .ZN(n542) );
  ND2D2BWP16P90LVT U626 ( .A1(n274), .A2(n300), .ZN(n543) );
  ND3D2BWP16P90LVT U627 ( .A1(n541), .A2(n542), .A3(n543), .ZN(n195) );
  OAI22D2BWP16P90LVT U628 ( .A1(n6), .A2(n379), .B1(n378), .B2(n418), .ZN(n300) );
  INVD1BWP16P90LVT U629 ( .I(n195), .ZN(n618) );
  ND2D1BWP16P90 U630 ( .A1(n203), .A2(n205), .ZN(n545) );
  ND2D1BWP16P90LVT U631 ( .A1(n198), .A2(n205), .ZN(n546) );
  XOR3D1BWP16P90LVT U632 ( .A1(n218), .A2(n221), .A3(n216), .Z(n547) );
  ND3D2BWP16P90LVT U633 ( .A1(n584), .A2(n585), .A3(n586), .ZN(n221) );
  XOR3D1BWP16P90LVT U634 ( .A1(n215), .A2(n212), .A3(n210), .Z(n548) );
  ND2D1BWP16P90 U635 ( .A1(n132), .A2(n94), .ZN(n52) );
  CKND2D4BWP16P90LVT U636 ( .A1(n599), .A2(n600), .ZN(n602) );
  ND2D2BWP16P90LVT U637 ( .A1(n597), .A2(n598), .ZN(n27) );
  IND2D4BWP16P90LVT U638 ( .A1(n182), .B1(n549), .ZN(n605) );
  XNR2D2BWP16P90 U639 ( .A1(n564), .A2(b[10]), .ZN(n346) );
  XNR2D2BWP16P90LVT U640 ( .A1(n623), .A2(b[10]), .ZN(n378) );
  OAI22D1BWP16P90 U641 ( .A1(n12), .A2(n366), .B1(n489), .B2(n365), .ZN(n288)
         );
  OAI22D1BWP16P90 U642 ( .A1(n502), .A2(n369), .B1(n368), .B2(n489), .ZN(n291)
         );
  OAI22D1BWP16P90 U643 ( .A1(n371), .A2(n502), .B1(n370), .B2(n530), .ZN(n293)
         );
  OAI22D1BWP16P90 U644 ( .A1(n502), .A2(n363), .B1(n493), .B2(n362), .ZN(n285)
         );
  OAI22D1BWP16P90 U645 ( .A1(n12), .A2(n359), .B1(n489), .B2(n358), .ZN(n281)
         );
  XNR2D2BWP16P90 U646 ( .A1(n623), .A2(b[1]), .ZN(n387) );
  FA1D2BWP16P90LVT U647 ( .A(n180), .B(n178), .CI(n185), .CO(n173), .S(n174)
         );
  XNR2D2BWP16P90LVT U648 ( .A1(n564), .A2(b[6]), .ZN(n350) );
  OR2D1BWP16P90LVT U649 ( .A1(n224), .A2(n227), .Z(n611) );
  ND2D1BWP16P90 U650 ( .A1(n605), .A2(n80), .ZN(n49) );
  INVD2BWP16P90LVT U651 ( .I(n99), .ZN(n97) );
  OAI22D1BWP16P90 U652 ( .A1(n616), .A2(n326), .B1(n325), .B2(n562), .ZN(n251)
         );
  OAI22D1BWP16P90 U653 ( .A1(n311), .A2(n42), .B1(n310), .B2(n41), .ZN(n239)
         );
  INVD1BWP16P90LVT U654 ( .I(n85), .ZN(n550) );
  XNR2D4BWP16P90LVT U655 ( .A1(n609), .A2(n188), .ZN(n184) );
  ND2D1BWP16P90LVT U656 ( .A1(n188), .A2(n619), .ZN(n620) );
  ND2D1BWP16P90LVT U657 ( .A1(n188), .A2(n492), .ZN(n621) );
  OAI22D2BWP16P90LVT U658 ( .A1(n617), .A2(n338), .B1(n337), .B2(n503), .ZN(
        n262) );
  HA1D2BWP16P90LVT U659 ( .A(n234), .B(n257), .CO(n205), .S(n206) );
  ND2D1BWP16P90LVT U660 ( .A1(n174), .A2(n176), .ZN(n567) );
  BUFFD12BWP16P90LVT U661 ( .I(a[5]), .Z(n564) );
  OAI22D2BWP16P90LVT U662 ( .A1(n501), .A2(n364), .B1(n489), .B2(n363), .ZN(
        n286) );
  XOR3D2BWP16P90LVT U663 ( .A1(n290), .A2(n225), .A3(n222), .Z(n553) );
  XOR2D2BWP16P90LVT U664 ( .A1(a[9]), .A2(a[8]), .Z(n409) );
  OAI22D1BWP16P90LVT U665 ( .A1(n593), .A2(n352), .B1(n351), .B2(n592), .ZN(
        n275) );
  ND2D2BWP16P90LVT U666 ( .A1(n578), .A2(n579), .ZN(n232) );
  BUFFD12BWP16P90LVT U667 ( .I(a[1]), .Z(n623) );
  ND2D4BWP16P90LVT U668 ( .A1(n21), .A2(n410), .ZN(n617) );
  XOR3D2BWP16P90LVT U669 ( .A1(n196), .A2(n201), .A3(n194), .Z(n554) );
  ND3D4BWP16P90LVT U670 ( .A1(n561), .A2(n560), .A3(n559), .ZN(n201) );
  ND2D1BWP16P90 U671 ( .A1(n606), .A2(n85), .ZN(n50) );
  OAI22D1BWP16P90 U672 ( .A1(n500), .A2(n374), .B1(n373), .B2(n418), .ZN(n295)
         );
  OAI22D1BWP16P90 U673 ( .A1(n500), .A2(n387), .B1(n386), .B2(n418), .ZN(n308)
         );
  OAI22D1BWP16P90 U674 ( .A1(n500), .A2(n380), .B1(n379), .B2(n418), .ZN(n301)
         );
  OAI22D1BWP16P90 U675 ( .A1(n500), .A2(n377), .B1(n376), .B2(n418), .ZN(n298)
         );
  OAI22D1BWP16P90 U676 ( .A1(n500), .A2(n426), .B1(n389), .B2(n418), .ZN(n238)
         );
  OAI22D1BWP16P90 U677 ( .A1(n388), .A2(n500), .B1(n387), .B2(n418), .ZN(n309)
         );
  OAI22D2BWP16P90LVT U678 ( .A1(n500), .A2(n376), .B1(n375), .B2(n418), .ZN(
        n297) );
  ND2D4BWP16P90LVT U679 ( .A1(n571), .A2(n570), .ZN(n411) );
  CKND2D4BWP16P90LVT U680 ( .A1(n424), .A2(a[4]), .ZN(n571) );
  OAI21D2BWP16P90LVT U681 ( .A1(n604), .A2(n63), .B(n64), .ZN(n62) );
  INVD4BWP16P90LVT U682 ( .I(n625), .ZN(n424) );
  FA1D2BWP16P90LVT U683 ( .A(n244), .B(n248), .CI(n254), .CO(n179), .S(n180)
         );
  IND2D1BWP16P90LVT U684 ( .A1(n629), .B1(a[13]), .ZN(n317) );
  INR2D2BWP16P90LVT U685 ( .A1(n629), .B1(n32), .ZN(n250) );
  XNR2D1BWP16P90LVT U686 ( .A1(n629), .A2(n627), .ZN(n332) );
  CKND2D4BWP16P90LVT U687 ( .A1(n574), .A2(a[0]), .ZN(n577) );
  XNR2D2BWP16P90LVT U688 ( .A1(b[3]), .A2(n564), .ZN(n353) );
  INVD1BWP16P90LVT U689 ( .I(a[7]), .ZN(n595) );
  FA1D2BWP16P90LVT U690 ( .A(n262), .B(n272), .CI(n284), .CO(n177), .S(n178)
         );
  HA1D1BWP16P90LVT U691 ( .A(n236), .B(n279), .CO(n225), .S(n226) );
  ND2D1BWP16P90 U692 ( .A1(n611), .A2(n107), .ZN(n55) );
  XNR2D4BWP16P90LVT U693 ( .A1(n197), .A2(n195), .ZN(n609) );
  OAI22D1BWP16P90 U694 ( .A1(n593), .A2(n346), .B1(n592), .B2(n345), .ZN(n269)
         );
  XNR2D4BWP16P90LVT U695 ( .A1(b[3]), .A2(n626), .ZN(n340) );
  INVD1BWP16P90LVT U696 ( .I(n603), .ZN(n73) );
  ND2D2BWP16P90LVT U697 ( .A1(n563), .A2(n409), .ZN(n616) );
  OAI21D1BWP16P90LVT U698 ( .A1(n589), .A2(n75), .B(n76), .ZN(n74) );
  OAI21D2BWP16P90LVT U699 ( .A1(n73), .A2(n71), .B(n72), .ZN(n70) );
  XNR2D2BWP16P90LVT U700 ( .A1(b[2]), .A2(n564), .ZN(n354) );
  OAI22D2BWP16P90LVT U701 ( .A1(n593), .A2(n351), .B1(n592), .B2(n350), .ZN(
        n274) );
  AOI21D1BWP16P90LVT U702 ( .A1(n100), .A2(n610), .B(n97), .ZN(n95) );
  ND2D1BWP16P90LVT U703 ( .A1(n258), .A2(n276), .ZN(n555) );
  ND2D1BWP16P90LVT U704 ( .A1(n258), .A2(n266), .ZN(n556) );
  ND2D1BWP16P90LVT U705 ( .A1(n301), .A2(n206), .ZN(n559) );
  ND2D1BWP16P90LVT U706 ( .A1(n301), .A2(n211), .ZN(n560) );
  ND2D1BWP16P90LVT U707 ( .A1(n206), .A2(n211), .ZN(n561) );
  OAI22D1BWP16P90LVT U708 ( .A1(n353), .A2(n17), .B1(n352), .B2(n592), .ZN(
        n276) );
  OR2D2BWP16P90LVT U709 ( .A1(n214), .A2(n219), .Z(n610) );
  FA1D1BWP16P90LVT U710 ( .A(n218), .B(n221), .CI(n216), .CO(n213), .S(n214)
         );
  OAI21D2BWP16P90LVT U711 ( .A1(n87), .A2(n75), .B(n76), .ZN(n603) );
  ND2D4BWP16P90LVT U712 ( .A1(n626), .A2(a[8]), .ZN(n597) );
  CKND2D4BWP16P90LVT U713 ( .A1(n595), .A2(n596), .ZN(n598) );
  INVD1BWP16P90 U714 ( .I(n101), .ZN(n134) );
  BUFFD4BWP16P90LVT U715 ( .I(a[5]), .Z(n625) );
  XOR2D2BWP16P90LVT U716 ( .A1(n176), .A2(n183), .Z(n565) );
  XOR2D4BWP16P90LVT U717 ( .A1(n565), .A2(n174), .Z(n172) );
  ND2D1BWP16P90 U718 ( .A1(n183), .A2(n176), .ZN(n568) );
  FA1D2BWP16P90LVT U719 ( .A(n298), .B(n189), .CI(n187), .CO(n175), .S(n176)
         );
  CKND1BWP16P90 U720 ( .I(a[4]), .ZN(n569) );
  XOR2D2BWP16P90LVT U721 ( .A1(a[6]), .A2(a[7]), .Z(n410) );
  BUFFD2BWP16P90LVT U722 ( .I(a[9]), .Z(n627) );
  OAI21D2BWP16P90LVT U723 ( .A1(n68), .A2(n72), .B(n69), .ZN(n67) );
  XNR2D4BWP16P90LVT U724 ( .A1(a[9]), .A2(a[10]), .ZN(n32) );
  CKND2BWP16P90LVT U725 ( .I(n551), .ZN(n83) );
  ND2D2BWP16P90LVT U726 ( .A1(n615), .A2(n575), .ZN(n576) );
  CKND2BWP16P90LVT U727 ( .I(n615), .ZN(n574) );
  CKND1BWP16P90 U728 ( .I(a[0]), .ZN(n575) );
  BUFFD2BWP16P90LVT U729 ( .I(a[1]), .Z(n615) );
  XNR2D1BWP16P90LVT U730 ( .A1(n629), .A2(n628), .ZN(n323) );
  XNR2D4BWP16P90LVT U731 ( .A1(n628), .A2(a[12]), .ZN(n37) );
  OAI21D1BWP16P90LVT U732 ( .A1(n527), .A2(n495), .B(n94), .ZN(n580) );
  OAI21D1BWP16P90LVT U733 ( .A1(n95), .A2(n93), .B(n94), .ZN(n92) );
  ND2D2BWP16P90LVT U734 ( .A1(n581), .A2(n582), .ZN(n255) );
  XNR2D1BWP16P90LVT U735 ( .A1(b[2]), .A2(a[9]), .ZN(n330) );
  ND2D1BWP16P90 U736 ( .A1(n304), .A2(n278), .ZN(n584) );
  ND2D1BWP16P90LVT U737 ( .A1(n304), .A2(n268), .ZN(n585) );
  ND2D1BWP16P90 U738 ( .A1(n278), .A2(n268), .ZN(n586) );
  NR2D1BWP16P90 U739 ( .A1(n382), .A2(n418), .ZN(n588) );
  XNR2D2BWP16P90LVT U740 ( .A1(n623), .A2(b[6]), .ZN(n382) );
  AOI21D1BWP16P90LVT U741 ( .A1(n580), .A2(n608), .B(n89), .ZN(n589) );
  AOI21D1BWP16P90LVT U742 ( .A1(n92), .A2(n608), .B(n89), .ZN(n87) );
  XNR2D1BWP16P90 U743 ( .A1(n51), .A2(n580), .ZN(product[9]) );
  AOI21D2BWP16P90LVT U744 ( .A1(n605), .A2(n83), .B(n78), .ZN(n76) );
  ND2D4BWP16P90LVT U745 ( .A1(n624), .A2(a[4]), .ZN(n601) );
  XNR2D8BWP16P90LVT U746 ( .A1(n623), .A2(a[2]), .ZN(n9) );
  AOI21D1BWP16P90 U747 ( .A1(n590), .A2(n610), .B(n97), .ZN(n591) );
  OAI22D1BWP16P90LVT U748 ( .A1(n616), .A2(n327), .B1(n326), .B2(n516), .ZN(
        n252) );
  OAI22D1BWP16P90LVT U749 ( .A1(n616), .A2(n329), .B1(n328), .B2(n562), .ZN(
        n254) );
  OAI22D1BWP16P90LVT U750 ( .A1(n616), .A2(n328), .B1(n327), .B2(n563), .ZN(
        n253) );
  INR2D1BWP16P90 U751 ( .A1(n629), .B1(n592), .ZN(n280) );
  AOI21D1BWP16P90LVT U752 ( .A1(n494), .A2(n74), .B(n531), .ZN(n65) );
  INVD1BWP16P90LVT U753 ( .I(n589), .ZN(n86) );
  XOR2D1BWP16P90LVT U754 ( .A1(n65), .A2(n46), .Z(product[14]) );
  INVD1BWP16P90 U755 ( .I(n495), .ZN(n132) );
  XOR2D1BWP16P90 U756 ( .A1(n52), .A2(n591), .Z(product[8]) );
  INVD1BWP16P90LVT U757 ( .I(n107), .ZN(n105) );
  INVD1BWP16P90LVT U758 ( .I(n124), .ZN(n122) );
  INVD1BWP16P90 U759 ( .I(n109), .ZN(n136) );
  FA1D2BWP16P90LVT U760 ( .A(n265), .B(n275), .CI(n287), .CO(n203), .S(n204)
         );
  OAI22D1BWP16P90 U761 ( .A1(n500), .A2(n378), .B1(n377), .B2(n418), .ZN(n299)
         );
  IND2D1BWP16P90 U762 ( .A1(n629), .B1(n615), .ZN(n389) );
  INVD1BWP16P90 U763 ( .I(n623), .ZN(n426) );
  INR2D1BWP16P90 U764 ( .A1(n629), .B1(n37), .ZN(n244) );
  INR2D1BWP16P90 U765 ( .A1(n629), .B1(n41), .ZN(n240) );
  OAI22D1BWP16P90 U766 ( .A1(n39), .A2(n315), .B1(n314), .B2(n37), .ZN(n242)
         );
  INR2D1BWP16P90 U767 ( .A1(n629), .B1(n530), .ZN(n294) );
  INVD1BWP16P90 U768 ( .I(n628), .ZN(n421) );
  INR2D1BWP16P90 U769 ( .A1(n629), .B1(n418), .ZN(product[0]) );
  INVD2BWP16P90LVT U770 ( .I(a[0]), .ZN(n418) );
  XOR2D1BWP16P90 U771 ( .A1(a[15]), .A2(a[14]), .Z(n406) );
  XNR2D1BWP16P90 U772 ( .A1(b[4]), .A2(a[9]), .ZN(n328) );
  AOI21D1BWP16P90LVT U773 ( .A1(n66), .A2(n603), .B(n67), .ZN(n604) );
  INVD1BWP16P90LVT U774 ( .I(n91), .ZN(n89) );
  XOR2D1BWP16P90 U775 ( .A1(n73), .A2(n48), .Z(product[12]) );
  INVD1BWP16P90 U776 ( .I(n71), .ZN(n128) );
  XNR2D1BWP16P90 U777 ( .A1(n86), .A2(n50), .ZN(product[10]) );
  AOI21D1BWP16P90LVT U778 ( .A1(n612), .A2(n607), .B(n113), .ZN(n111) );
  INVD1BWP16P90LVT U779 ( .I(n115), .ZN(n113) );
  IOA21D1BWP16P90LVT U780 ( .A1(n613), .A2(n122), .B(n121), .ZN(n607) );
  ND2D1BWP16P90LVT U781 ( .A1(n548), .A2(n213), .ZN(n94) );
  XNR2D1BWP16P90 U782 ( .A1(n590), .A2(n53), .ZN(product[7]) );
  XNR2D1BWP16P90 U783 ( .A1(n55), .A2(n108), .ZN(product[5]) );
  XOR2D1BWP16P90 U784 ( .A1(n56), .A2(n111), .Z(product[4]) );
  XNR2D1BWP16P90 U785 ( .A1(n57), .A2(n607), .ZN(product[3]) );
  XNR2D1BWP16P90 U786 ( .A1(n58), .A2(n122), .ZN(product[2]) );
  ND2D1BWP16P90LVT U787 ( .A1(n309), .A2(n238), .ZN(n124) );
  FA1D1BWP16P90LVT U788 ( .A(n204), .B(n209), .CI(n202), .CO(n199), .S(n200)
         );
  FA1D1BWP16P90LVT U789 ( .A(n215), .B(n212), .CI(n210), .CO(n207), .S(n208)
         );
  OR2D1BWP16P90LVT U790 ( .A1(n230), .A2(n293), .Z(n612) );
  OR2D1BWP16P90LVT U791 ( .A1(n308), .A2(n294), .Z(n613) );
  OR2D1BWP16P90LVT U792 ( .A1(n147), .A2(n140), .Z(n614) );
  IND2D1BWP16P90 U793 ( .A1(n123), .B1(n124), .ZN(n59) );
  NR2D1BWP16P90 U794 ( .A1(n309), .A2(n238), .ZN(n123) );
  INR2D1BWP16P90 U795 ( .A1(n629), .B1(n503), .ZN(n268) );
  XOR3D2BWP16P90LVT U796 ( .A1(n155), .A2(n145), .A3(n144), .Z(n142) );
  XOR3D2BWP16P90LVT U797 ( .A1(n153), .A2(n143), .A3(n151), .Z(n141) );
  XOR3D2BWP16P90LVT U798 ( .A1(n259), .A2(n269), .A3(n295), .Z(n144) );
  ND2D1BWP16P90LVT U799 ( .A1(n32), .A2(n408), .ZN(n34) );
  XOR3D1BWP16P90LVT U800 ( .A1(n239), .A2(n146), .A3(n157), .Z(n143) );
  XNR2D1BWP16P90 U801 ( .A1(b[1]), .A2(a[15]), .ZN(n310) );
  XNR2D1BWP16P90 U802 ( .A1(b[3]), .A2(a[13]), .ZN(n313) );
  IND2D1BWP16P90 U803 ( .A1(n629), .B1(a[15]), .ZN(n312) );
  XNR2D1BWP16P90 U804 ( .A1(b[7]), .A2(n627), .ZN(n325) );
  XNR2D1BWP16P90 U805 ( .A1(n623), .A2(b[15]), .ZN(n373) );
  CKND1BWP16P90LVT U806 ( .I(a[15]), .ZN(n419) );
  XNR2D1BWP16P90 U807 ( .A1(n629), .A2(a[15]), .ZN(n311) );
  INVD1BWP16P90 U808 ( .I(n68), .ZN(n127) );
  NR2D1BWP16P90LVT U809 ( .A1(n68), .A2(n71), .ZN(n66) );
  INVD1BWP16P90 U810 ( .I(a[13]), .ZN(n420) );
  XNR2D1BWP16P90 U811 ( .A1(n629), .A2(a[13]), .ZN(n316) );
  OAI22D1BWP16P90LVT U812 ( .A1(n617), .A2(n339), .B1(n338), .B2(n503), .ZN(
        n263) );
  XOR2D1BWP16P90LVT U813 ( .A1(n54), .A2(n103), .Z(product[6]) );
  INVD1BWP16P90 U814 ( .I(n627), .ZN(n422) );
  IND2D1BWP16P90LVT U815 ( .A1(n629), .B1(n627), .ZN(n333) );
  XNR2D1BWP16P90 U816 ( .A1(b[5]), .A2(a[9]), .ZN(n327) );
  AOI21D1BWP16P90LVT U817 ( .A1(n86), .A2(n606), .B(n550), .ZN(n81) );
  INVD1BWP16P90 U818 ( .I(n505), .ZN(n423) );
  IND2D1BWP16P90 U819 ( .A1(n629), .B1(n505), .ZN(n344) );
  XNR2D1BWP16P90 U820 ( .A1(n629), .A2(n626), .ZN(n343) );
  XOR2D1BWP16P90LVT U821 ( .A1(n81), .A2(n49), .Z(product[11]) );
  XNR2D1BWP16P90LVT U822 ( .A1(n70), .A2(n47), .ZN(product[13]) );
  FA1D2BWP16P90LVT U823 ( .A(n170), .B(n179), .CI(n177), .CO(n163), .S(n164)
         );
  IND2D1BWP16P90 U824 ( .A1(n629), .B1(n490), .ZN(n372) );
  INVD1BWP16P90LVT U825 ( .I(n618), .ZN(n619) );
  IND2D1BWP16P90 U826 ( .A1(n629), .B1(n564), .ZN(n357) );
  XOR2D4BWP16P90LVT U827 ( .A1(n624), .A2(a[2]), .Z(n412) );
  ND2D1BWP16P90 U828 ( .A1(n619), .A2(n492), .ZN(n622) );
  ND3D1BWP16P90LVT U829 ( .A1(n620), .A2(n621), .A3(n622), .ZN(n183) );
  FA1D4BWP16P90LVT U830 ( .A(n196), .B(n201), .CI(n194), .CO(n191), .S(n192)
         );
  XNR2D1BWP16P90LVT U831 ( .A1(n62), .A2(n45), .ZN(product[15]) );
endmodule


module stage2_pipe ( r, sum, c );
  output [15:0] r;
  input [15:0] sum;
  input [15:0] c;
  wire   SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16;

  stage2_pipe_DW_mult_uns_2 mult_30 ( .a(sum), .b(c), .\product[15] (r[15]), 
        .\product[14] (r[14]), .\product[13] (r[13]), .\product[12] (r[12]), 
        .\product[11] (r[11]), .\product[10] (r[10]), .\product[9] (r[9]), 
        .\product[8] (r[8]), .\product[7] (r[7]), .\product[6] (r[6]), 
        .\product[5] (r[5]), .\product[4] (r[4]), .\product[3] (r[3]), 
        .\product[2] (r[2]), .\product[1] (r[1]), .\product[0] (r[0]) );
endmodule


module hw2_pipe ( d, a, b, c, s, rst, clk );
  output [15:0] d;
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  input s, rst, clk;
  wire   n_Logic0_, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [15:0] sum;
  wire   [15:0] sum_o;
  wire   [15:0] c1;
  wire   [15:0] product;

  DFCNQD2BWP16P90LVT d_reg_15_ ( .D(product[15]), .CP(clk), .CDN(n10), .Q(
        d[15]) );
  DFCNQD2BWP16P90LVT d_reg_14_ ( .D(product[14]), .CP(clk), .CDN(n10), .Q(
        d[14]) );
  DFCNQD2BWP16P90LVT d_reg_13_ ( .D(product[13]), .CP(clk), .CDN(n10), .Q(
        d[13]) );
  DFCNQD2BWP16P90LVT d_reg_12_ ( .D(product[12]), .CP(clk), .CDN(n10), .Q(
        d[12]) );
  DFCNQD2BWP16P90LVT d_reg_11_ ( .D(product[11]), .CP(clk), .CDN(n10), .Q(
        d[11]) );
  DFCNQD2BWP16P90LVT d_reg_10_ ( .D(product[10]), .CP(clk), .CDN(n10), .Q(
        d[10]) );
  DFCNQD2BWP16P90LVT d_reg_9_ ( .D(product[9]), .CP(clk), .CDN(n10), .Q(d[9])
         );
  DFCNQD2BWP16P90LVT d_reg_8_ ( .D(product[8]), .CP(clk), .CDN(n10), .Q(d[8])
         );
  DFCNQD2BWP16P90LVT d_reg_7_ ( .D(product[7]), .CP(clk), .CDN(n10), .Q(d[7])
         );
  DFCNQD2BWP16P90LVT d_reg_6_ ( .D(product[6]), .CP(clk), .CDN(n10), .Q(d[6])
         );
  DFCNQD2BWP16P90LVT d_reg_5_ ( .D(product[5]), .CP(clk), .CDN(n10), .Q(d[5])
         );
  DFCNQD2BWP16P90LVT d_reg_4_ ( .D(product[4]), .CP(clk), .CDN(n10), .Q(d[4])
         );
  DFCNQD2BWP16P90LVT d_reg_3_ ( .D(product[3]), .CP(clk), .CDN(n10), .Q(d[3])
         );
  DFCNQD2BWP16P90LVT d_reg_2_ ( .D(product[2]), .CP(clk), .CDN(n10), .Q(d[2])
         );
  DFCNQD2BWP16P90LVT d_reg_1_ ( .D(product[1]), .CP(clk), .CDN(n10), .Q(d[1])
         );
  DFCNQD2BWP16P90LVT d_reg_0_ ( .D(product[0]), .CP(clk), .CDN(n10), .Q(d[0])
         );
  stage1_pipe uut1 ( .sum(sum), .a(a), .b(b), .s(s) );
  d_ff_0 stage1_reg1 ( .Q(sum_o), .D(sum), .clk(clk), .rst(rst) );
  d_ff_1 stage1_reg2 ( .Q(c1), .D({n_Logic0_, n_Logic0_, n_Logic0_, n_Logic0_, 
        n_Logic0_, n_Logic0_, n_Logic0_, n_Logic0_, n2, n3, n4, n5, n6, n7, n8, 
        n9}), .clk(clk), .rst(rst) );
  stage2_pipe uut2 ( .r(product), .sum(sum_o), .c(c1) );
  TIELBWP20P90LVT U4 ( .ZN(n_Logic0_) );
  CKBD1BWP20P90 U5 ( .I(c[7]), .Z(n2) );
  CKBD1BWP20P90 U6 ( .I(c[6]), .Z(n3) );
  CKBD1BWP20P90 U7 ( .I(c[5]), .Z(n4) );
  CKBD1BWP20P90 U8 ( .I(c[4]), .Z(n5) );
  CKBD1BWP20P90 U9 ( .I(c[3]), .Z(n6) );
  CKBD1BWP20P90 U10 ( .I(c[2]), .Z(n7) );
  CKBD1BWP20P90 U11 ( .I(c[1]), .Z(n8) );
  CKBD1BWP20P90 U12 ( .I(c[0]), .Z(n9) );
  CKND1BWP16P90LVT U13 ( .I(rst), .ZN(n10) );
endmodule

