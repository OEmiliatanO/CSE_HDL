/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : V-2023.12
// Date      : Tue Nov 19 00:10:52 2024
/////////////////////////////////////////////////////////////


module Conv_DW01_sub_0 ( A, B, DIFF );
  input [19:0] A;
  input [19:0] B;
  output [19:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;
  wire   [19:2] carry;

  FA1D1BWP16P90LVT U2_17 ( .A(A[17]), .B(n4), .CI(carry[17]), .CO(carry[18]), 
        .S(DIFF[17]) );
  FA1D1BWP16P90LVT U2_16 ( .A(A[16]), .B(n5), .CI(carry[16]), .CO(carry[17]), 
        .S(DIFF[16]) );
  FA1D1BWP16P90LVT U2_15 ( .A(A[15]), .B(n6), .CI(carry[15]), .CO(carry[16]), 
        .S(DIFF[15]) );
  FA1D1BWP16P90LVT U2_14 ( .A(A[14]), .B(n7), .CI(carry[14]), .CO(carry[15]), 
        .S(DIFF[14]) );
  FA1D1BWP16P90LVT U2_13 ( .A(A[13]), .B(n8), .CI(carry[13]), .CO(carry[14]), 
        .S(DIFF[13]) );
  FA1D1BWP16P90LVT U2_12 ( .A(A[12]), .B(n9), .CI(carry[12]), .CO(carry[13]), 
        .S(DIFF[12]) );
  FA1D1BWP16P90LVT U2_11 ( .A(A[11]), .B(n10), .CI(carry[11]), .CO(carry[12]), 
        .S(DIFF[11]) );
  FA1D1BWP16P90LVT U2_10 ( .A(A[10]), .B(n11), .CI(carry[10]), .CO(carry[11]), 
        .S(DIFF[10]) );
  FA1D1BWP16P90LVT U2_9 ( .A(A[9]), .B(n12), .CI(carry[9]), .CO(carry[10]), 
        .S(DIFF[9]) );
  FA1D1BWP16P90LVT U2_7 ( .A(A[7]), .B(n14), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  FA1D1BWP16P90LVT U2_6 ( .A(A[6]), .B(n15), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  FA1D1BWP16P90LVT U2_5 ( .A(A[5]), .B(n16), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  FA1D1BWP16P90LVT U2_4 ( .A(A[4]), .B(n17), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  FA1D1BWP16P90LVT U2_3 ( .A(A[3]), .B(n18), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  FA1D1BWP16P90LVT U2_2 ( .A(A[2]), .B(n19), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  FA1D1BWP16P90LVT U2_1 ( .A(A[1]), .B(n20), .CI(n1), .CO(carry[2]), .S(
        DIFF[1]) );
  XOR3D2BWP16P90LVT U2_19 ( .A1(A[19]), .A2(n2), .A3(carry[19]), .Z(DIFF[19])
         );
  FA1D1BWP16P90LVT U2_18 ( .A(A[18]), .B(n3), .CI(carry[18]), .CO(carry[19]), 
        .S(DIFF[18]) );
  FA1D1BWP16P90LVT U2_8 ( .A(A[8]), .B(n13), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF[8]) );
  CKND1BWP16P90LVT U1 ( .I(B[1]), .ZN(n20) );
  OR2D1BWP16P90LVT U2 ( .A1(A[0]), .A2(n21), .Z(n1) );
  CKND1BWP16P90LVT U3 ( .I(B[0]), .ZN(n21) );
  CKND1BWP16P90LVT U4 ( .I(B[7]), .ZN(n14) );
  CKND1BWP16P90LVT U5 ( .I(B[8]), .ZN(n13) );
  CKND1BWP16P90LVT U6 ( .I(B[6]), .ZN(n15) );
  CKND1BWP16P90LVT U7 ( .I(B[5]), .ZN(n16) );
  CKND1BWP16P90LVT U8 ( .I(B[4]), .ZN(n17) );
  CKND1BWP16P90LVT U9 ( .I(B[3]), .ZN(n18) );
  CKND1BWP16P90LVT U10 ( .I(B[2]), .ZN(n19) );
  CKND1BWP16P90LVT U11 ( .I(B[9]), .ZN(n12) );
  CKND1BWP16P90LVT U12 ( .I(B[10]), .ZN(n11) );
  CKND1BWP16P90LVT U13 ( .I(B[17]), .ZN(n4) );
  CKND1BWP16P90LVT U14 ( .I(B[11]), .ZN(n10) );
  CKND1BWP16P90LVT U15 ( .I(B[12]), .ZN(n9) );
  CKND1BWP16P90LVT U16 ( .I(B[13]), .ZN(n8) );
  CKND1BWP16P90LVT U17 ( .I(B[14]), .ZN(n7) );
  CKND1BWP16P90LVT U18 ( .I(B[15]), .ZN(n6) );
  CKND1BWP16P90LVT U19 ( .I(B[16]), .ZN(n5) );
  CKND1BWP16P90LVT U20 ( .I(B[18]), .ZN(n3) );
  CKND1BWP16P90LVT U21 ( .I(B[19]), .ZN(n2) );
  XNR2D1BWP16P90LVT U22 ( .A1(n21), .A2(A[0]), .ZN(DIFF[0]) );
endmodule


module Conv_DW01_sub_1 ( A, B, DIFF );
  input [19:0] A;
  input [19:0] B;
  output [19:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;
  wire   [19:2] carry;

  FA1D1BWP16P90LVT U2_18 ( .A(A[18]), .B(n3), .CI(carry[18]), .CO(carry[19]), 
        .S(DIFF[18]) );
  FA1D1BWP16P90LVT U2_17 ( .A(A[17]), .B(n4), .CI(carry[17]), .CO(carry[18]), 
        .S(DIFF[17]) );
  FA1D1BWP16P90LVT U2_16 ( .A(A[16]), .B(n5), .CI(carry[16]), .CO(carry[17]), 
        .S(DIFF[16]) );
  FA1D1BWP16P90LVT U2_15 ( .A(A[15]), .B(n6), .CI(carry[15]), .CO(carry[16]), 
        .S(DIFF[15]) );
  FA1D1BWP16P90LVT U2_14 ( .A(A[14]), .B(n7), .CI(carry[14]), .CO(carry[15]), 
        .S(DIFF[14]) );
  FA1D1BWP16P90LVT U2_13 ( .A(A[13]), .B(n8), .CI(carry[13]), .CO(carry[14]), 
        .S(DIFF[13]) );
  FA1D1BWP16P90LVT U2_12 ( .A(A[12]), .B(n9), .CI(carry[12]), .CO(carry[13]), 
        .S(DIFF[12]) );
  FA1D1BWP16P90LVT U2_11 ( .A(A[11]), .B(n10), .CI(carry[11]), .CO(carry[12]), 
        .S(DIFF[11]) );
  FA1D1BWP16P90LVT U2_8 ( .A(A[8]), .B(n13), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF[8]) );
  FA1D1BWP16P90LVT U2_7 ( .A(A[7]), .B(n14), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  FA1D1BWP16P90LVT U2_6 ( .A(A[6]), .B(n15), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  FA1D1BWP16P90LVT U2_5 ( .A(A[5]), .B(n16), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  FA1D1BWP16P90LVT U2_4 ( .A(A[4]), .B(n17), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  FA1D1BWP16P90LVT U2_3 ( .A(A[3]), .B(n18), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  FA1D1BWP16P90LVT U2_2 ( .A(A[2]), .B(n19), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  XOR3D2BWP16P90LVT U2_19 ( .A1(A[19]), .A2(n2), .A3(carry[19]), .Z(DIFF[19])
         );
  FA1D1BWP16P90LVT U2_10 ( .A(A[10]), .B(n11), .CI(carry[10]), .CO(carry[11]), 
        .S(DIFF[10]) );
  FA1D1BWP16P90LVT U2_9 ( .A(A[9]), .B(n12), .CI(carry[9]), .CO(carry[10]), 
        .S(DIFF[9]) );
  FA1D1BWP16P90LVT U2_1 ( .A(A[1]), .B(n20), .CI(n1), .CO(carry[2]), .S(
        DIFF[1]) );
  OR2D1BWP16P90LVT U1 ( .A1(A[0]), .A2(n21), .Z(n1) );
  CKND1BWP16P90LVT U2 ( .I(B[1]), .ZN(n20) );
  CKND1BWP16P90LVT U3 ( .I(B[0]), .ZN(n21) );
  CKND1BWP16P90LVT U4 ( .I(B[2]), .ZN(n19) );
  CKND1BWP16P90LVT U5 ( .I(B[8]), .ZN(n13) );
  CKND1BWP16P90LVT U6 ( .I(B[3]), .ZN(n18) );
  CKND1BWP16P90LVT U7 ( .I(B[7]), .ZN(n14) );
  CKND1BWP16P90LVT U8 ( .I(B[6]), .ZN(n15) );
  CKND1BWP16P90LVT U9 ( .I(B[5]), .ZN(n16) );
  CKND1BWP16P90LVT U10 ( .I(B[4]), .ZN(n17) );
  CKND1BWP16P90LVT U11 ( .I(B[9]), .ZN(n12) );
  CKND1BWP16P90LVT U12 ( .I(B[18]), .ZN(n3) );
  CKND1BWP16P90LVT U13 ( .I(B[12]), .ZN(n9) );
  CKND1BWP16P90LVT U14 ( .I(B[13]), .ZN(n8) );
  CKND1BWP16P90LVT U15 ( .I(B[14]), .ZN(n7) );
  CKND1BWP16P90LVT U16 ( .I(B[15]), .ZN(n6) );
  CKND1BWP16P90LVT U17 ( .I(B[16]), .ZN(n5) );
  CKND1BWP16P90LVT U18 ( .I(B[17]), .ZN(n4) );
  CKND1BWP16P90LVT U19 ( .I(B[11]), .ZN(n10) );
  CKND1BWP16P90LVT U20 ( .I(B[10]), .ZN(n11) );
  CKND1BWP16P90LVT U21 ( .I(B[19]), .ZN(n2) );
  XNR2D1BWP16P90LVT U22 ( .A1(n21), .A2(A[0]), .ZN(DIFF[0]) );
endmodule


module Conv_DW01_sub_3 ( A, B, DIFF );
  input [19:0] A;
  input [19:0] B;
  output [19:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;
  wire   [19:2] carry;

  FA1D1BWP16P90LVT U2_18 ( .A(A[18]), .B(n3), .CI(carry[18]), .CO(carry[19]), 
        .S(DIFF[18]) );
  FA1D1BWP16P90LVT U2_17 ( .A(A[17]), .B(n4), .CI(carry[17]), .CO(carry[18]), 
        .S(DIFF[17]) );
  FA1D1BWP16P90LVT U2_16 ( .A(A[16]), .B(n5), .CI(carry[16]), .CO(carry[17]), 
        .S(DIFF[16]) );
  FA1D1BWP16P90LVT U2_15 ( .A(A[15]), .B(n6), .CI(carry[15]), .CO(carry[16]), 
        .S(DIFF[15]) );
  FA1D1BWP16P90LVT U2_14 ( .A(A[14]), .B(n7), .CI(carry[14]), .CO(carry[15]), 
        .S(DIFF[14]) );
  FA1D1BWP16P90LVT U2_13 ( .A(A[13]), .B(n8), .CI(carry[13]), .CO(carry[14]), 
        .S(DIFF[13]) );
  FA1D1BWP16P90LVT U2_12 ( .A(A[12]), .B(n9), .CI(carry[12]), .CO(carry[13]), 
        .S(DIFF[12]) );
  FA1D1BWP16P90LVT U2_11 ( .A(A[11]), .B(n10), .CI(carry[11]), .CO(carry[12]), 
        .S(DIFF[11]) );
  FA1D1BWP16P90LVT U2_10 ( .A(A[10]), .B(n11), .CI(carry[10]), .CO(carry[11]), 
        .S(DIFF[10]) );
  FA1D1BWP16P90LVT U2_9 ( .A(A[9]), .B(n12), .CI(carry[9]), .CO(carry[10]), 
        .S(DIFF[9]) );
  FA1D1BWP16P90LVT U2_8 ( .A(A[8]), .B(n13), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF[8]) );
  FA1D1BWP16P90LVT U2_7 ( .A(A[7]), .B(n14), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  FA1D1BWP16P90LVT U2_6 ( .A(A[6]), .B(n15), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  FA1D1BWP16P90LVT U2_5 ( .A(A[5]), .B(n16), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  FA1D1BWP16P90LVT U2_4 ( .A(A[4]), .B(n17), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  FA1D1BWP16P90LVT U2_3 ( .A(A[3]), .B(n18), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  FA1D1BWP16P90LVT U2_2 ( .A(A[2]), .B(n19), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  FA1D1BWP16P90LVT U2_1 ( .A(A[1]), .B(n20), .CI(n1), .CO(carry[2]), .S(
        DIFF[1]) );
  XOR3D2BWP16P90LVT U2_19 ( .A1(A[19]), .A2(n2), .A3(carry[19]), .Z(DIFF[19])
         );
  CKND1BWP16P90LVT U1 ( .I(B[1]), .ZN(n20) );
  CKND1BWP16P90LVT U2 ( .I(B[18]), .ZN(n3) );
  CKND1BWP16P90LVT U3 ( .I(B[7]), .ZN(n14) );
  CKND1BWP16P90LVT U4 ( .I(B[8]), .ZN(n13) );
  CKND1BWP16P90LVT U5 ( .I(B[9]), .ZN(n12) );
  CKND1BWP16P90LVT U6 ( .I(B[10]), .ZN(n11) );
  CKND1BWP16P90LVT U7 ( .I(B[11]), .ZN(n10) );
  CKND1BWP16P90LVT U8 ( .I(B[12]), .ZN(n9) );
  CKND1BWP16P90LVT U9 ( .I(B[6]), .ZN(n15) );
  CKND1BWP16P90LVT U10 ( .I(B[13]), .ZN(n8) );
  CKND1BWP16P90LVT U11 ( .I(B[14]), .ZN(n7) );
  CKND1BWP16P90LVT U12 ( .I(B[15]), .ZN(n6) );
  CKND1BWP16P90LVT U13 ( .I(B[16]), .ZN(n5) );
  CKND1BWP16P90LVT U14 ( .I(B[5]), .ZN(n16) );
  CKND1BWP16P90LVT U15 ( .I(B[17]), .ZN(n4) );
  CKND1BWP16P90LVT U16 ( .I(B[4]), .ZN(n17) );
  CKND1BWP16P90LVT U17 ( .I(B[2]), .ZN(n19) );
  CKND1BWP16P90LVT U18 ( .I(B[3]), .ZN(n18) );
  OR2D1BWP16P90LVT U19 ( .A1(A[0]), .A2(n21), .Z(n1) );
  CKND1BWP16P90LVT U20 ( .I(B[0]), .ZN(n21) );
  CKND1BWP16P90LVT U21 ( .I(B[19]), .ZN(n2) );
  XNR2D1BWP16P90LVT U22 ( .A1(n21), .A2(A[0]), .ZN(DIFF[0]) );
endmodule


module Conv_DW01_sub_2 ( A, B, DIFF );
  input [19:0] A;
  input [19:0] B;
  output [19:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;
  wire   [19:2] carry;

  FA1D1BWP16P90LVT U2_18 ( .A(A[18]), .B(n3), .CI(carry[18]), .CO(carry[19]), 
        .S(DIFF[18]) );
  FA1D1BWP16P90LVT U2_17 ( .A(A[17]), .B(n4), .CI(carry[17]), .CO(carry[18]), 
        .S(DIFF[17]) );
  FA1D1BWP16P90LVT U2_16 ( .A(A[16]), .B(n5), .CI(carry[16]), .CO(carry[17]), 
        .S(DIFF[16]) );
  FA1D1BWP16P90LVT U2_15 ( .A(A[15]), .B(n6), .CI(carry[15]), .CO(carry[16]), 
        .S(DIFF[15]) );
  FA1D1BWP16P90LVT U2_14 ( .A(A[14]), .B(n7), .CI(carry[14]), .CO(carry[15]), 
        .S(DIFF[14]) );
  FA1D1BWP16P90LVT U2_13 ( .A(A[13]), .B(n8), .CI(carry[13]), .CO(carry[14]), 
        .S(DIFF[13]) );
  FA1D1BWP16P90LVT U2_12 ( .A(A[12]), .B(n9), .CI(carry[12]), .CO(carry[13]), 
        .S(DIFF[12]) );
  FA1D1BWP16P90LVT U2_11 ( .A(A[11]), .B(n10), .CI(carry[11]), .CO(carry[12]), 
        .S(DIFF[11]) );
  FA1D1BWP16P90LVT U2_10 ( .A(A[10]), .B(n11), .CI(carry[10]), .CO(carry[11]), 
        .S(DIFF[10]) );
  FA1D1BWP16P90LVT U2_9 ( .A(A[9]), .B(n12), .CI(carry[9]), .CO(carry[10]), 
        .S(DIFF[9]) );
  FA1D1BWP16P90LVT U2_8 ( .A(A[8]), .B(n13), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF[8]) );
  FA1D1BWP16P90LVT U2_7 ( .A(A[7]), .B(n14), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  FA1D1BWP16P90LVT U2_6 ( .A(A[6]), .B(n15), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  FA1D1BWP16P90LVT U2_5 ( .A(A[5]), .B(n16), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  FA1D1BWP16P90LVT U2_4 ( .A(A[4]), .B(n17), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  FA1D1BWP16P90LVT U2_3 ( .A(A[3]), .B(n18), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  FA1D1BWP16P90LVT U2_2 ( .A(A[2]), .B(n19), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  FA1D1BWP16P90LVT U2_1 ( .A(A[1]), .B(n20), .CI(n1), .CO(carry[2]), .S(
        DIFF[1]) );
  XOR3D2BWP16P90LVT U2_19 ( .A1(A[19]), .A2(n2), .A3(carry[19]), .Z(DIFF[19])
         );
  CKND1BWP16P90LVT U1 ( .I(B[1]), .ZN(n20) );
  OR2D1BWP16P90LVT U2 ( .A1(A[0]), .A2(n21), .Z(n1) );
  CKND1BWP16P90LVT U3 ( .I(B[0]), .ZN(n21) );
  CKND1BWP16P90LVT U4 ( .I(B[17]), .ZN(n4) );
  CKND1BWP16P90LVT U5 ( .I(B[5]), .ZN(n16) );
  CKND1BWP16P90LVT U6 ( .I(B[2]), .ZN(n19) );
  CKND1BWP16P90LVT U7 ( .I(B[7]), .ZN(n14) );
  CKND1BWP16P90LVT U8 ( .I(B[8]), .ZN(n13) );
  CKND1BWP16P90LVT U9 ( .I(B[9]), .ZN(n12) );
  CKND1BWP16P90LVT U10 ( .I(B[10]), .ZN(n11) );
  CKND1BWP16P90LVT U11 ( .I(B[11]), .ZN(n10) );
  CKND1BWP16P90LVT U12 ( .I(B[12]), .ZN(n9) );
  CKND1BWP16P90LVT U13 ( .I(B[13]), .ZN(n8) );
  CKND1BWP16P90LVT U14 ( .I(B[14]), .ZN(n7) );
  CKND1BWP16P90LVT U15 ( .I(B[6]), .ZN(n15) );
  CKND1BWP16P90LVT U16 ( .I(B[15]), .ZN(n6) );
  CKND1BWP16P90LVT U17 ( .I(B[16]), .ZN(n5) );
  CKND1BWP16P90LVT U18 ( .I(B[3]), .ZN(n18) );
  CKND1BWP16P90LVT U19 ( .I(B[4]), .ZN(n17) );
  CKND1BWP16P90LVT U20 ( .I(B[18]), .ZN(n3) );
  CKND1BWP16P90LVT U21 ( .I(B[19]), .ZN(n2) );
  XNR2D1BWP16P90LVT U22 ( .A1(n21), .A2(A[0]), .ZN(DIFF[0]) );
endmodule


module Conv_DW01_add_2 ( A, B, SUM );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  wire   n1;
  wire   [19:2] carry;

  FA1D1BWP16P90LVT U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  FA1D1BWP16P90LVT U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  FA1D1BWP16P90LVT U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  FA1D1BWP16P90LVT U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  FA1D1BWP16P90LVT U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  FA1D1BWP16P90LVT U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  FA1D1BWP16P90LVT U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  FA1D1BWP16P90LVT U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  FA1D1BWP16P90LVT U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  FA1D1BWP16P90LVT U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), 
        .S(SUM[9]) );
  FA1D1BWP16P90LVT U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), 
        .S(SUM[8]) );
  FA1D1BWP16P90LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), 
        .S(SUM[7]) );
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
  XOR3D2BWP16P90LVT U1_19 ( .A1(A[19]), .A2(B[19]), .A3(carry[19]), .Z(SUM[19]) );
  AN2D1BWP16P90LVT U1 ( .A1(B[0]), .A2(A[0]), .Z(n1) );
  XOR2D1BWP16P90LVT U2 ( .A1(B[0]), .A2(A[0]), .Z(SUM[0]) );
endmodule


module Conv_DW01_add_1 ( A, B, SUM );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  wire   n1;
  wire   [19:2] carry;

  FA1D1BWP16P90LVT U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  FA1D1BWP16P90LVT U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  FA1D1BWP16P90LVT U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  FA1D1BWP16P90LVT U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  FA1D1BWP16P90LVT U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  FA1D1BWP16P90LVT U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  FA1D1BWP16P90LVT U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  FA1D1BWP16P90LVT U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  FA1D1BWP16P90LVT U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  FA1D1BWP16P90LVT U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), 
        .S(SUM[9]) );
  FA1D1BWP16P90LVT U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), 
        .S(SUM[8]) );
  FA1D1BWP16P90LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), 
        .S(SUM[7]) );
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
  XOR3D2BWP16P90LVT U1_19 ( .A1(A[19]), .A2(B[19]), .A3(carry[19]), .Z(SUM[19]) );
  AN2D1BWP16P90LVT U1 ( .A1(B[0]), .A2(A[0]), .Z(n1) );
  XOR2D1BWP16P90LVT U2 ( .A1(B[0]), .A2(A[0]), .Z(SUM[0]) );
endmodule


module Conv_DW01_add_0 ( A, B, SUM );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  wire   n1;
  wire   [19:2] carry;

  FA1D1BWP16P90LVT U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  FA1D1BWP16P90LVT U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  FA1D1BWP16P90LVT U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  FA1D1BWP16P90LVT U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  FA1D1BWP16P90LVT U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  FA1D1BWP16P90LVT U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  FA1D1BWP16P90LVT U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  FA1D1BWP16P90LVT U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  FA1D1BWP16P90LVT U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  FA1D1BWP16P90LVT U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), 
        .S(SUM[9]) );
  FA1D1BWP16P90LVT U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), 
        .S(SUM[8]) );
  FA1D1BWP16P90LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), 
        .S(SUM[7]) );
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
  XOR3D2BWP16P90LVT U1_19 ( .A1(A[19]), .A2(B[19]), .A3(carry[19]), .Z(SUM[19]) );
  AN2D1BWP16P90LVT U1 ( .A1(B[0]), .A2(A[0]), .Z(n1) );
  XOR2D1BWP16P90LVT U2 ( .A1(B[0]), .A2(A[0]), .Z(SUM[0]) );
endmodule


module Conv_DW01_sub_5 ( A, B, DIFF );
  input [19:0] A;
  input [19:0] B;
  output [19:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;
  wire   [19:2] carry;

  FA1D1BWP16P90LVT U2_18 ( .A(A[18]), .B(n3), .CI(carry[18]), .CO(carry[19]), 
        .S(DIFF[18]) );
  FA1D1BWP16P90LVT U2_17 ( .A(A[17]), .B(n4), .CI(carry[17]), .CO(carry[18]), 
        .S(DIFF[17]) );
  FA1D1BWP16P90LVT U2_16 ( .A(A[16]), .B(n5), .CI(carry[16]), .CO(carry[17]), 
        .S(DIFF[16]) );
  FA1D1BWP16P90LVT U2_15 ( .A(A[15]), .B(n6), .CI(carry[15]), .CO(carry[16]), 
        .S(DIFF[15]) );
  FA1D1BWP16P90LVT U2_14 ( .A(A[14]), .B(n7), .CI(carry[14]), .CO(carry[15]), 
        .S(DIFF[14]) );
  FA1D1BWP16P90LVT U2_13 ( .A(A[13]), .B(n8), .CI(carry[13]), .CO(carry[14]), 
        .S(DIFF[13]) );
  FA1D1BWP16P90LVT U2_12 ( .A(A[12]), .B(n9), .CI(carry[12]), .CO(carry[13]), 
        .S(DIFF[12]) );
  FA1D1BWP16P90LVT U2_11 ( .A(A[11]), .B(n10), .CI(carry[11]), .CO(carry[12]), 
        .S(DIFF[11]) );
  FA1D1BWP16P90LVT U2_10 ( .A(A[10]), .B(n11), .CI(carry[10]), .CO(carry[11]), 
        .S(DIFF[10]) );
  FA1D1BWP16P90LVT U2_9 ( .A(A[9]), .B(n12), .CI(carry[9]), .CO(carry[10]), 
        .S(DIFF[9]) );
  FA1D1BWP16P90LVT U2_8 ( .A(A[8]), .B(n13), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF[8]) );
  FA1D1BWP16P90LVT U2_7 ( .A(A[7]), .B(n14), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  FA1D1BWP16P90LVT U2_6 ( .A(A[6]), .B(n15), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  FA1D1BWP16P90LVT U2_5 ( .A(A[5]), .B(n16), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  FA1D1BWP16P90LVT U2_4 ( .A(A[4]), .B(n17), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  FA1D1BWP16P90LVT U2_3 ( .A(A[3]), .B(n18), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  FA1D1BWP16P90LVT U2_2 ( .A(A[2]), .B(n19), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  FA1D1BWP16P90LVT U2_1 ( .A(A[1]), .B(n20), .CI(n1), .CO(carry[2]), .S(
        DIFF[1]) );
  XOR3D2BWP16P90LVT U2_19 ( .A1(A[19]), .A2(n2), .A3(carry[19]), .Z(DIFF[19])
         );
  CKND1BWP16P90LVT U1 ( .I(B[1]), .ZN(n20) );
  OR2D1BWP16P90LVT U2 ( .A1(A[0]), .A2(n21), .Z(n1) );
  CKND1BWP16P90LVT U3 ( .I(B[0]), .ZN(n21) );
  CKND1BWP16P90LVT U4 ( .I(B[19]), .ZN(n2) );
  CKND1BWP16P90LVT U5 ( .I(B[7]), .ZN(n14) );
  CKND1BWP16P90LVT U6 ( .I(B[8]), .ZN(n13) );
  CKND1BWP16P90LVT U7 ( .I(B[9]), .ZN(n12) );
  CKND1BWP16P90LVT U8 ( .I(B[10]), .ZN(n11) );
  CKND1BWP16P90LVT U9 ( .I(B[11]), .ZN(n10) );
  CKND1BWP16P90LVT U10 ( .I(B[12]), .ZN(n9) );
  CKND1BWP16P90LVT U11 ( .I(B[13]), .ZN(n8) );
  CKND1BWP16P90LVT U12 ( .I(B[14]), .ZN(n7) );
  CKND1BWP16P90LVT U13 ( .I(B[6]), .ZN(n15) );
  CKND1BWP16P90LVT U14 ( .I(B[15]), .ZN(n6) );
  CKND1BWP16P90LVT U15 ( .I(B[16]), .ZN(n5) );
  CKND1BWP16P90LVT U16 ( .I(B[17]), .ZN(n4) );
  CKND1BWP16P90LVT U17 ( .I(B[5]), .ZN(n16) );
  CKND1BWP16P90LVT U18 ( .I(B[2]), .ZN(n19) );
  CKND1BWP16P90LVT U19 ( .I(B[3]), .ZN(n18) );
  CKND1BWP16P90LVT U20 ( .I(B[4]), .ZN(n17) );
  CKND1BWP16P90LVT U21 ( .I(B[18]), .ZN(n3) );
  XNR2D1BWP16P90LVT U22 ( .A1(n21), .A2(A[0]), .ZN(DIFF[0]) );
endmodule


module Conv_DW01_sub_4 ( A, B, DIFF );
  input [19:0] A;
  input [19:0] B;
  output [19:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;
  wire   [19:2] carry;

  FA1D1BWP16P90LVT U2_18 ( .A(A[18]), .B(n3), .CI(carry[18]), .CO(carry[19]), 
        .S(DIFF[18]) );
  FA1D1BWP16P90LVT U2_17 ( .A(A[17]), .B(n4), .CI(carry[17]), .CO(carry[18]), 
        .S(DIFF[17]) );
  FA1D1BWP16P90LVT U2_16 ( .A(A[16]), .B(n5), .CI(carry[16]), .CO(carry[17]), 
        .S(DIFF[16]) );
  FA1D1BWP16P90LVT U2_15 ( .A(A[15]), .B(n6), .CI(carry[15]), .CO(carry[16]), 
        .S(DIFF[15]) );
  FA1D1BWP16P90LVT U2_14 ( .A(A[14]), .B(n7), .CI(carry[14]), .CO(carry[15]), 
        .S(DIFF[14]) );
  FA1D1BWP16P90LVT U2_13 ( .A(A[13]), .B(n8), .CI(carry[13]), .CO(carry[14]), 
        .S(DIFF[13]) );
  FA1D1BWP16P90LVT U2_12 ( .A(A[12]), .B(n9), .CI(carry[12]), .CO(carry[13]), 
        .S(DIFF[12]) );
  FA1D1BWP16P90LVT U2_11 ( .A(A[11]), .B(n10), .CI(carry[11]), .CO(carry[12]), 
        .S(DIFF[11]) );
  FA1D1BWP16P90LVT U2_10 ( .A(A[10]), .B(n11), .CI(carry[10]), .CO(carry[11]), 
        .S(DIFF[10]) );
  FA1D1BWP16P90LVT U2_9 ( .A(A[9]), .B(n12), .CI(carry[9]), .CO(carry[10]), 
        .S(DIFF[9]) );
  FA1D1BWP16P90LVT U2_8 ( .A(A[8]), .B(n13), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF[8]) );
  FA1D1BWP16P90LVT U2_7 ( .A(A[7]), .B(n14), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  FA1D1BWP16P90LVT U2_6 ( .A(A[6]), .B(n15), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  FA1D1BWP16P90LVT U2_5 ( .A(A[5]), .B(n16), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  FA1D1BWP16P90LVT U2_4 ( .A(A[4]), .B(n17), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  FA1D1BWP16P90LVT U2_3 ( .A(A[3]), .B(n18), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  FA1D1BWP16P90LVT U2_2 ( .A(A[2]), .B(n19), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  FA1D1BWP16P90LVT U2_1 ( .A(A[1]), .B(n20), .CI(n1), .CO(carry[2]), .S(
        DIFF[1]) );
  XOR3D2BWP16P90LVT U2_19 ( .A1(A[19]), .A2(n2), .A3(carry[19]), .Z(DIFF[19])
         );
  CKND1BWP16P90LVT U1 ( .I(B[1]), .ZN(n20) );
  CKND1BWP16P90LVT U2 ( .I(B[0]), .ZN(n21) );
  OR2D1BWP16P90LVT U3 ( .A1(A[0]), .A2(n21), .Z(n1) );
  CKND1BWP16P90LVT U4 ( .I(B[17]), .ZN(n4) );
  CKND1BWP16P90LVT U5 ( .I(B[7]), .ZN(n14) );
  CKND1BWP16P90LVT U6 ( .I(B[8]), .ZN(n13) );
  CKND1BWP16P90LVT U7 ( .I(B[9]), .ZN(n12) );
  CKND1BWP16P90LVT U8 ( .I(B[10]), .ZN(n11) );
  CKND1BWP16P90LVT U9 ( .I(B[11]), .ZN(n10) );
  CKND1BWP16P90LVT U10 ( .I(B[12]), .ZN(n9) );
  CKND1BWP16P90LVT U11 ( .I(B[6]), .ZN(n15) );
  CKND1BWP16P90LVT U12 ( .I(B[13]), .ZN(n8) );
  CKND1BWP16P90LVT U13 ( .I(B[14]), .ZN(n7) );
  CKND1BWP16P90LVT U14 ( .I(B[15]), .ZN(n6) );
  CKND1BWP16P90LVT U15 ( .I(B[16]), .ZN(n5) );
  CKND1BWP16P90LVT U16 ( .I(B[5]), .ZN(n16) );
  CKND1BWP16P90LVT U17 ( .I(B[4]), .ZN(n17) );
  CKND1BWP16P90LVT U18 ( .I(B[2]), .ZN(n19) );
  CKND1BWP16P90LVT U19 ( .I(B[3]), .ZN(n18) );
  CKND1BWP16P90LVT U20 ( .I(B[18]), .ZN(n3) );
  CKND1BWP16P90LVT U21 ( .I(B[19]), .ZN(n2) );
  XNR2D1BWP16P90LVT U22 ( .A1(n21), .A2(A[0]), .ZN(DIFF[0]) );
endmodule


module Conv_DW01_add_5 ( A, B, SUM );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  wire   n1;
  wire   [19:2] carry;

  FA1D1BWP16P90LVT U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  FA1D1BWP16P90LVT U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  FA1D1BWP16P90LVT U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  FA1D1BWP16P90LVT U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  FA1D1BWP16P90LVT U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  FA1D1BWP16P90LVT U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  FA1D1BWP16P90LVT U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  FA1D1BWP16P90LVT U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  FA1D1BWP16P90LVT U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  FA1D1BWP16P90LVT U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), 
        .S(SUM[9]) );
  FA1D1BWP16P90LVT U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), 
        .S(SUM[8]) );
  FA1D1BWP16P90LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), 
        .S(SUM[7]) );
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
  XOR3D2BWP16P90LVT U1_19 ( .A1(A[19]), .A2(B[19]), .A3(carry[19]), .Z(SUM[19]) );
  AN2D1BWP16P90LVT U1 ( .A1(B[0]), .A2(A[0]), .Z(n1) );
  XOR2D1BWP16P90LVT U2 ( .A1(B[0]), .A2(A[0]), .Z(SUM[0]) );
endmodule


module Conv_DW01_add_4 ( A, B, SUM );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  wire   n1;
  wire   [19:2] carry;

  FA1D1BWP16P90LVT U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  FA1D1BWP16P90LVT U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  FA1D1BWP16P90LVT U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  FA1D1BWP16P90LVT U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  FA1D1BWP16P90LVT U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  FA1D1BWP16P90LVT U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  FA1D1BWP16P90LVT U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  FA1D1BWP16P90LVT U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  FA1D1BWP16P90LVT U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  FA1D1BWP16P90LVT U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), 
        .S(SUM[9]) );
  FA1D1BWP16P90LVT U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), 
        .S(SUM[8]) );
  FA1D1BWP16P90LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), 
        .S(SUM[7]) );
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
  XOR3D2BWP16P90LVT U1_19 ( .A1(A[19]), .A2(B[19]), .A3(carry[19]), .Z(SUM[19]) );
  AN2D1BWP16P90LVT U1 ( .A1(B[0]), .A2(A[0]), .Z(n1) );
  XOR2D1BWP16P90LVT U2 ( .A1(B[0]), .A2(A[0]), .Z(SUM[0]) );
endmodule


module Conv_DW01_add_3 ( A, B, SUM );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  wire   n1;
  wire   [19:2] carry;

  FA1D1BWP16P90LVT U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  FA1D1BWP16P90LVT U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  FA1D1BWP16P90LVT U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  FA1D1BWP16P90LVT U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  FA1D1BWP16P90LVT U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  FA1D1BWP16P90LVT U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  FA1D1BWP16P90LVT U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  FA1D1BWP16P90LVT U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  FA1D1BWP16P90LVT U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  FA1D1BWP16P90LVT U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), 
        .S(SUM[9]) );
  FA1D1BWP16P90LVT U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), 
        .S(SUM[8]) );
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
  XOR3D2BWP16P90LVT U1_19 ( .A1(A[19]), .A2(B[19]), .A3(carry[19]), .Z(SUM[19]) );
  FA1D1BWP16P90LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), 
        .S(SUM[7]) );
  AN2D1BWP16P90LVT U1 ( .A1(B[0]), .A2(A[0]), .Z(n1) );
  XOR2D1BWP16P90LVT U2 ( .A1(B[0]), .A2(A[0]), .Z(SUM[0]) );
endmodule


module Conv ( threshold, R0, R1, R2, R3, R4, R5, R6, R7, R8, x, y );
  input [19:0] threshold;
  input [19:0] R0;
  input [19:0] R1;
  input [19:0] R2;
  input [19:0] R3;
  input [19:0] R4;
  input [19:0] R5;
  input [19:0] R6;
  input [19:0] R7;
  input [19:0] R8;
  output [7:0] x;
  output [7:0] y;
  wire   N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33,
         N34, N35, N36, N37, N38, N39, x_0_, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N133, N134, N135, N136,
         N137, N138, N139, N140, y_0_, N99, N98, N97, N96, N95, N94, N93, N92,
         N91, N90, N9, N89, N88, N87, N86, N85, N84, N83, N82, N81, N80, N8,
         N79, N78, N77, N76, N75, N74, N73, N72, N71, N70, N7, N69, N68, N67,
         N66, N65, N64, N63, N62, N61, N60, N6, N59, N58, N57, N56, N55, N54,
         N53, N52, N51, N50, N5, N49, N48, N47, N46, N45, N44, N43, N42, N41,
         N40, N4, N3, N2, N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N1,
         N0, N200, N199, N198, N197, N196, N195, N194, N193, N192, N191, N190,
         N189, N188, N187, N186, N185, N184, N183, N182, N181, N180, N179,
         N178, N177, N176, N175, N174, N173, N172, N171, N170, N169, N168,
         N167, N166, N165, N164, N163, N162, N161, N160, N159, N158, N157,
         N156, N155, N154, N153, N152, N151, N150, N149, N148, N147, N146,
         N145, N144, N143, N142, N141, N120, N119, N118, N117, N116, N115,
         N114, N113, N112, N111, N110, N109, N108, N107, N106, N105, N104,
         N103, N102, N101, n1310, n1410, n1510, n1610, n1710, n1810, n1910,
         n201, n210, n220, n230, n240, n250, n260, n270, n280, n290, n300,
         n310, n320, n330, n340, n350, n360, n370, n380, n390, n400, n410,
         n420, n430, n440, n450, n460, n470, n480, n490, n500, n510, n520,
         n530, n540, n550, n560, n570, n580, n590, n600, n610, n620, n630,
         n640, n650, n660, n670, n680, n690, n700, n710, n720, n730, n740,
         n750, n760, n770, n780, n790, n800, n810, n820, n830, n840, n850,
         n860, n870, n880, n890, n900, n910, n920, n930, n940, n950, n960,
         n970, n980, n990, n100, n1010, n1020, n1030, n1040, n1050, n1060,
         n1070, n1080, n1090, n1100, n1110, n1120, n1130, n1140, n1150, n1160,
         n1170, n1180, n1190, n1200, n1210, n1220, n1230, n1240, n1250, n1260,
         n1270, n1280, n1290, n1300, n1311, n1320;
  wire   [19:0] Gx;
  wire   [19:0] Gy;
  assign x[7] = x_0_;
  assign x[6] = x_0_;
  assign x[5] = x_0_;
  assign x[4] = x_0_;
  assign x[3] = x_0_;
  assign x[2] = x_0_;
  assign x[1] = x_0_;
  assign x[0] = x_0_;
  assign y[7] = y_0_;
  assign y[6] = y_0_;
  assign y[5] = y_0_;
  assign y[4] = y_0_;
  assign y[3] = y_0_;
  assign y[2] = y_0_;
  assign y[1] = y_0_;
  assign y[0] = y_0_;

  Conv_DW01_sub_0 sub_13_2 ( .A(R1), .B(R7), .DIFF({N140, N139, N138, N137, 
        N136, N135, N134, N133, N132, N131, N130, N129, N128, N127, N126, N125, 
        N124, N123, N122, N121}) );
  Conv_DW01_sub_1 sub_7_2 ( .A(R5), .B(R3), .DIFF({N39, N38, N37, N36, N35, 
        N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, 
        N20}) );
  Conv_DW01_sub_3 sub_7 ( .A(R2), .B(R0), .DIFF({N19, N18, N17, N16, N15, N14, 
        N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}) );
  Conv_DW01_sub_2 sub_7_4 ( .A(R8), .B(R6), .DIFF({N79, N78, N77, N76, N75, 
        N74, N73, N72, N71, N70, N69, N68, N67, N66, N65, N64, N63, N62, N61, 
        N60}) );
  Conv_DW01_add_2 add_7 ( .A({N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, 
        N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}), .B({N39, N38, N37, N36, N35, 
        N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, 
        N20}), .SUM({N59, N58, N57, N56, N55, N54, N53, N52, N51, N50, N49, 
        N48, N47, N46, N45, N44, N43, N42, N41, N40}) );
  Conv_DW01_add_1 add_7_2 ( .A({N39, N38, N37, N36, N35, N34, N33, N32, N31, 
        N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20}), .B({N79, N78, 
        N77, N76, N75, N74, N73, N72, N71, N70, N69, N68, N67, N66, N65, N64, 
        N63, N62, N61, N60}), .SUM({N99, N98, N97, N96, N95, N94, N93, N92, 
        N91, N90, N89, N88, N87, N86, N85, N84, N83, N82, N81, N80}) );
  Conv_DW01_add_0 add_7_3 ( .A({N59, N58, N57, N56, N55, N54, N53, N52, N51, 
        N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40}), .B({N99, N98, 
        N97, N96, N95, N94, N93, N92, N91, N90, N89, N88, N87, N86, N85, N84, 
        N83, N82, N81, N80}), .SUM(Gx) );
  Conv_DW01_sub_5 sub_13 ( .A(R0), .B(R6), .DIFF({N120, N119, N118, N117, N116, 
        N115, N114, N113, N112, N111, N110, N109, N108, N107, N106, N105, N104, 
        N103, N102, N101}) );
  Conv_DW01_sub_4 sub_13_4 ( .A(R2), .B(R8), .DIFF({N180, N179, N178, N177, 
        N176, N175, N174, N173, N172, N171, N170, N169, N168, N167, N166, N165, 
        N164, N163, N162, N161}) );
  Conv_DW01_add_5 add_13 ( .A({N120, N119, N118, N117, N116, N115, N114, N113, 
        N112, N111, N110, N109, N108, N107, N106, N105, N104, N103, N102, N101}), .B({N140, N139, N138, N137, N136, N135, N134, N133, N132, N131, N130, N129, 
        N128, N127, N126, N125, N124, N123, N122, N121}), .SUM({N160, N159, 
        N158, N157, N156, N155, N154, N153, N152, N151, N150, N149, N148, N147, 
        N146, N145, N144, N143, N142, N141}) );
  Conv_DW01_add_4 add_13_2 ( .A({N140, N139, N138, N137, N136, N135, N134, 
        N133, N132, N131, N130, N129, N128, N127, N126, N125, N124, N123, N122, 
        N121}), .B({N180, N179, N178, N177, N176, N175, N174, N173, N172, N171, 
        N170, N169, N168, N167, N166, N165, N164, N163, N162, N161}), .SUM({
        N200, N199, N198, N197, N196, N195, N194, N193, N192, N191, N190, N189, 
        N188, N187, N186, N185, N184, N183, N182, N181}) );
  Conv_DW01_add_3 add_13_3 ( .A({N160, N159, N158, N157, N156, N155, N154, 
        N153, N152, N151, N150, N149, N148, N147, N146, N145, N144, N143, N142, 
        N141}), .B({N200, N199, N198, N197, N196, N195, N194, N193, N192, N191, 
        N190, N189, N188, N187, N186, N185, N184, N183, N182, N181}), .SUM(Gy)
         );
  TIELBWP20P90LVT U13 ( .ZN(n1310) );
  CKND1BWP16P90LVT U14 ( .I(Gx[18]), .ZN(n700) );
  CKND1BWP16P90LVT U15 ( .I(Gy[14]), .ZN(n1250) );
  CKND1BWP16P90LVT U16 ( .I(Gx[14]), .ZN(n660) );
  CKND1BWP16P90LVT U17 ( .I(Gy[12]), .ZN(n1230) );
  CKND1BWP16P90LVT U18 ( .I(Gx[12]), .ZN(n640) );
  CKND1BWP16P90LVT U19 ( .I(Gy[10]), .ZN(n1210) );
  CKND1BWP16P90LVT U20 ( .I(Gx[10]), .ZN(n620) );
  CKND1BWP16P90LVT U21 ( .I(Gy[9]), .ZN(n1200) );
  CKND1BWP16P90LVT U22 ( .I(Gx[9]), .ZN(n610) );
  CKND1BWP16P90LVT U23 ( .I(Gx[8]), .ZN(n600) );
  CKND1BWP16P90LVT U24 ( .I(Gy[8]), .ZN(n1190) );
  CKND1BWP16P90LVT U25 ( .I(Gy[3]), .ZN(n1160) );
  CKND1BWP16P90LVT U26 ( .I(Gx[3]), .ZN(n570) );
  CKND1BWP16P90LVT U27 ( .I(Gy[2]), .ZN(n1150) );
  CKND1BWP16P90LVT U28 ( .I(Gx[2]), .ZN(n560) );
  CKND1BWP16P90LVT U29 ( .I(n1040), .ZN(n1280) );
  CKND1BWP16P90LVT U30 ( .I(n440), .ZN(n690) );
  CKND1BWP16P90LVT U31 ( .I(n480), .ZN(n730) );
  CKND1BWP16P90LVT U32 ( .I(Gx[19]), .ZN(n720) );
  CKND1BWP16P90LVT U33 ( .I(n1080), .ZN(n1320) );
  CKND1BWP16P90LVT U34 ( .I(Gy[19]), .ZN(n1311) );
  CKND1BWP16P90LVT U35 ( .I(n940), .ZN(n1170) );
  CKND1BWP16P90LVT U36 ( .I(n340), .ZN(n580) );
  NR2D1BWP16P90LVT U37 ( .A1(n720), .A2(threshold[19]), .ZN(n480) );
  CKND1BWP16P90LVT U38 ( .I(n430), .ZN(n710) );
  NR2D1BWP16P90LVT U39 ( .A1(n1311), .A2(threshold[19]), .ZN(n1080) );
  CKND1BWP16P90LVT U40 ( .I(n820), .ZN(n1260) );
  CKND1BWP16P90LVT U41 ( .I(n220), .ZN(n670) );
  CKND1BWP16P90LVT U42 ( .I(Gy[15]), .ZN(n1270) );
  CKND1BWP16P90LVT U43 ( .I(Gx[15]), .ZN(n680) );
  CKND1BWP16P90LVT U44 ( .I(Gy[13]), .ZN(n1240) );
  CKND1BWP16P90LVT U45 ( .I(Gx[13]), .ZN(n650) );
  CKND1BWP16P90LVT U46 ( .I(Gy[11]), .ZN(n1220) );
  CKND1BWP16P90LVT U47 ( .I(Gx[11]), .ZN(n630) );
  CKND1BWP16P90LVT U48 ( .I(n330), .ZN(n590) );
  CKND1BWP16P90LVT U49 ( .I(n930), .ZN(n1180) );
  CKND1BWP16P90LVT U50 ( .I(threshold[5]), .ZN(n530) );
  CKND1BWP16P90LVT U51 ( .I(threshold[1]), .ZN(n520) );
  CKND1BWP16P90LVT U52 ( .I(threshold[7]), .ZN(n1130) );
  CKND1BWP16P90LVT U53 ( .I(threshold[6]), .ZN(n540) );
  CKND1BWP16P90LVT U54 ( .I(threshold[4]), .ZN(n1120) );
  CKND1BWP16P90LVT U55 ( .I(threshold[16]), .ZN(n550) );
  CKND1BWP16P90LVT U56 ( .I(threshold[17]), .ZN(n1140) );
  CKND1BWP16P90LVT U57 ( .I(Gy[18]), .ZN(n1290) );
  OAI32D1BWP16P90LVT U58 ( .A1(n1050), .A2(n1040), .A3(n1300), .B1(
        threshold[18]), .B2(n1290), .ZN(n1060) );
  INVD1BWP16P90LVT U59 ( .I(n1030), .ZN(n1300) );
  OAI32D1BWP16P90LVT U60 ( .A1(n1110), .A2(n1100), .A3(n1090), .B1(n1080), 
        .B2(n1070), .ZN(y_0_) );
  OAI31D1BWP16P90LVT U61 ( .A1(n1020), .A2(n1010), .A3(n100), .B(n1320), .ZN(
        n1090) );
  OAI32D1BWP16P90LVT U62 ( .A1(n510), .A2(n500), .A3(n490), .B1(n480), .B2(
        n470), .ZN(x_0_) );
  OAI31D1BWP16P90LVT U63 ( .A1(n420), .A2(n410), .A3(n400), .B(n730), .ZN(n490) );
  NR2D1BWP16P90 U64 ( .A1(n1140), .A2(Gx[17]), .ZN(n440) );
  ND2D1BWP16P90 U65 ( .A1(threshold[18]), .A2(n700), .ZN(n430) );
  OAI211D1BWP16P90 U66 ( .A1(Gx[16]), .A2(n550), .B(n690), .C(n430), .ZN(n510)
         );
  INR2D1BWP16P90 U67 ( .A1(threshold[11]), .B1(Gx[11]), .ZN(n1410) );
  AOI21D1BWP16P90 U68 ( .A1(n620), .A2(threshold[10]), .B(n1410), .ZN(n270) );
  INR2D1BWP16P90 U69 ( .A1(threshold[13]), .B1(Gx[13]), .ZN(n1910) );
  INR2D1BWP16P90 U70 ( .A1(threshold[15]), .B1(Gx[15]), .ZN(n1810) );
  AOI21D1BWP16P90 U71 ( .A1(n660), .A2(threshold[14]), .B(n1810), .ZN(n220) );
  AOI211D1BWP16P90 U72 ( .A1(n640), .A2(threshold[12]), .B(n1910), .C(n670), 
        .ZN(n260) );
  AN2D1BWP16P90 U73 ( .A1(threshold[9]), .A2(n610), .Z(n1510) );
  AOI21D1BWP16P90 U74 ( .A1(threshold[8]), .A2(n600), .B(n1510), .ZN(n250) );
  OAI32D1BWP16P90 U75 ( .A1(n620), .A2(threshold[10]), .A3(n1410), .B1(
        threshold[11]), .B2(n630), .ZN(n1710) );
  OAI32D1BWP16P90 U76 ( .A1(n600), .A2(threshold[8]), .A3(n1510), .B1(
        threshold[9]), .B2(n610), .ZN(n1610) );
  OAI22D1BWP16P90 U77 ( .A1(n270), .A2(n1710), .B1(n1710), .B2(n1610), .ZN(
        n240) );
  OAI32D1BWP16P90 U78 ( .A1(n660), .A2(threshold[14]), .A3(n1810), .B1(
        threshold[15]), .B2(n680), .ZN(n210) );
  OAI32D1BWP16P90 U79 ( .A1(n640), .A2(threshold[12]), .A3(n1910), .B1(
        threshold[13]), .B2(n650), .ZN(n201) );
  OAI22D1BWP16P90 U80 ( .A1(n220), .A2(n210), .B1(n210), .B2(n201), .ZN(n230)
         );
  IOAI21D1BWP16P90 U81 ( .A2(n260), .A1(n240), .B(n230), .ZN(n420) );
  AOI31D1BWP16P90 U82 ( .A1(n270), .A2(n260), .A3(n250), .B(n420), .ZN(n500)
         );
  IND2D1BWP16P90 U83 ( .A1(Gx[5]), .B1(threshold[5]), .ZN(n360) );
  AOI32D1BWP16P90 U84 ( .A1(n360), .A2(n1120), .A3(Gx[4]), .B1(Gx[5]), .B2(
        n530), .ZN(n300) );
  OR2D1BWP16P90 U85 ( .A1(Gx[7]), .A2(n1130), .Z(n280) );
  AOI32D1BWP16P90 U86 ( .A1(Gx[6]), .A2(n540), .A3(n280), .B1(n1130), .B2(
        Gx[7]), .ZN(n290) );
  OAI21D1BWP16P90 U87 ( .A1(Gx[6]), .A2(n540), .B(n280), .ZN(n330) );
  AOI22D1BWP16P90 U88 ( .A1(n300), .A2(n290), .B1(n290), .B2(n330), .ZN(n410)
         );
  IAO21D1BWP16P90 U89 ( .A1(n520), .A2(Gx[1]), .B(threshold[0]), .ZN(n310) );
  AOI22D1BWP16P90 U90 ( .A1(Gx[1]), .A2(n520), .B1(n310), .B2(Gx[0]), .ZN(n390) );
  AN2D1BWP16P90 U91 ( .A1(threshold[3]), .A2(n570), .Z(n320) );
  OAI32D1BWP16P90 U92 ( .A1(n560), .A2(threshold[2]), .A3(n320), .B1(
        threshold[3]), .B2(n570), .ZN(n340) );
  AOI21D1BWP16P90 U93 ( .A1(threshold[2]), .A2(n560), .B(n320), .ZN(n350) );
  OAI21D1BWP16P90 U94 ( .A1(n350), .A2(n340), .B(n590), .ZN(n380) );
  OAI21D1BWP16P90 U95 ( .A1(Gx[4]), .A2(n1120), .B(n360), .ZN(n370) );
  AOI211D1BWP16P90 U96 ( .A1(n390), .A2(n580), .B(n380), .C(n370), .ZN(n400)
         );
  AOI22D1BWP16P90 U97 ( .A1(Gx[16]), .A2(n550), .B1(Gx[17]), .B2(n1140), .ZN(
        n450) );
  OAI32D1BWP16P90 U98 ( .A1(n450), .A2(n440), .A3(n710), .B1(threshold[18]), 
        .B2(n700), .ZN(n460) );
  AOI21D1BWP16P90 U99 ( .A1(threshold[19]), .A2(n720), .B(n460), .ZN(n470) );
  NR2D1BWP16P90 U100 ( .A1(n1140), .A2(Gy[17]), .ZN(n1040) );
  ND2D1BWP16P90 U101 ( .A1(threshold[18]), .A2(n1290), .ZN(n1030) );
  OAI211D1BWP16P90 U102 ( .A1(Gy[16]), .A2(n550), .B(n1280), .C(n1030), .ZN(
        n1110) );
  INR2D1BWP16P90 U103 ( .A1(threshold[11]), .B1(Gy[11]), .ZN(n740) );
  AOI21D1BWP16P90 U104 ( .A1(n1210), .A2(threshold[10]), .B(n740), .ZN(n870)
         );
  INR2D1BWP16P90 U105 ( .A1(threshold[13]), .B1(Gy[13]), .ZN(n790) );
  INR2D1BWP16P90 U106 ( .A1(threshold[15]), .B1(Gy[15]), .ZN(n780) );
  AOI21D1BWP16P90 U107 ( .A1(n1250), .A2(threshold[14]), .B(n780), .ZN(n820)
         );
  AOI211D1BWP16P90 U108 ( .A1(n1230), .A2(threshold[12]), .B(n790), .C(n1260), 
        .ZN(n860) );
  AN2D1BWP16P90 U109 ( .A1(threshold[9]), .A2(n1200), .Z(n750) );
  AOI21D1BWP16P90 U110 ( .A1(threshold[8]), .A2(n1190), .B(n750), .ZN(n850) );
  OAI32D1BWP16P90 U111 ( .A1(n1210), .A2(threshold[10]), .A3(n740), .B1(
        threshold[11]), .B2(n1220), .ZN(n770) );
  OAI32D1BWP16P90 U112 ( .A1(n1190), .A2(threshold[8]), .A3(n750), .B1(
        threshold[9]), .B2(n1200), .ZN(n760) );
  OAI22D1BWP16P90 U113 ( .A1(n870), .A2(n770), .B1(n770), .B2(n760), .ZN(n840)
         );
  OAI32D1BWP16P90 U114 ( .A1(n1250), .A2(threshold[14]), .A3(n780), .B1(
        threshold[15]), .B2(n1270), .ZN(n810) );
  OAI32D1BWP16P90 U115 ( .A1(n1230), .A2(threshold[12]), .A3(n790), .B1(
        threshold[13]), .B2(n1240), .ZN(n800) );
  OAI22D1BWP16P90 U116 ( .A1(n820), .A2(n810), .B1(n810), .B2(n800), .ZN(n830)
         );
  IOAI21D1BWP16P90 U117 ( .A2(n860), .A1(n840), .B(n830), .ZN(n1020) );
  AOI31D1BWP16P90 U118 ( .A1(n870), .A2(n860), .A3(n850), .B(n1020), .ZN(n1100) );
  IND2D1BWP16P90 U119 ( .A1(Gy[5]), .B1(threshold[5]), .ZN(n960) );
  AOI32D1BWP16P90 U120 ( .A1(n960), .A2(n1120), .A3(Gy[4]), .B1(Gy[5]), .B2(
        n530), .ZN(n900) );
  OR2D1BWP16P90 U121 ( .A1(Gy[7]), .A2(n1130), .Z(n880) );
  AOI32D1BWP16P90 U122 ( .A1(Gy[6]), .A2(n540), .A3(n880), .B1(n1130), .B2(
        Gy[7]), .ZN(n890) );
  OAI21D1BWP16P90 U123 ( .A1(Gy[6]), .A2(n540), .B(n880), .ZN(n930) );
  AOI22D1BWP16P90 U124 ( .A1(n900), .A2(n890), .B1(n890), .B2(n930), .ZN(n1010) );
  IAO21D1BWP16P90 U125 ( .A1(n520), .A2(Gy[1]), .B(threshold[0]), .ZN(n910) );
  AOI22D1BWP16P90 U126 ( .A1(Gy[1]), .A2(n520), .B1(n910), .B2(Gy[0]), .ZN(
        n990) );
  AN2D1BWP16P90 U127 ( .A1(threshold[3]), .A2(n1160), .Z(n920) );
  OAI32D1BWP16P90 U128 ( .A1(n1150), .A2(threshold[2]), .A3(n920), .B1(
        threshold[3]), .B2(n1160), .ZN(n940) );
  AOI21D1BWP16P90 U129 ( .A1(threshold[2]), .A2(n1150), .B(n920), .ZN(n950) );
  OAI21D1BWP16P90 U130 ( .A1(n950), .A2(n940), .B(n1180), .ZN(n980) );
  OAI21D1BWP16P90 U131 ( .A1(Gy[4]), .A2(n1120), .B(n960), .ZN(n970) );
  AOI211D1BWP16P90 U132 ( .A1(n990), .A2(n1170), .B(n980), .C(n970), .ZN(n100)
         );
  AOI22D1BWP16P90 U133 ( .A1(Gy[16]), .A2(n550), .B1(Gy[17]), .B2(n1140), .ZN(
        n1050) );
  AOI21D1BWP16P90 U134 ( .A1(threshold[19]), .A2(n1311), .B(n1060), .ZN(n1070)
         );
endmodule

