/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Thu Dec 19 01:26:00 2024
/////////////////////////////////////////////////////////////


module ReLU ( x, y );
  input [35:0] x;
  output [35:0] y;


  TIELBWP20P90LVT U43 ( .ZN(y[35]) );
  INR2D1BWP16P90LVT U44 ( .A1(x[0]), .B1(x[35]), .ZN(y[0]) );
  INR2D1BWP16P90LVT U45 ( .A1(x[1]), .B1(x[35]), .ZN(y[1]) );
  INR2D1BWP16P90LVT U46 ( .A1(x[2]), .B1(x[35]), .ZN(y[2]) );
  INR2D1BWP16P90LVT U47 ( .A1(x[3]), .B1(x[35]), .ZN(y[3]) );
  INR2D1BWP16P90LVT U48 ( .A1(x[4]), .B1(x[35]), .ZN(y[4]) );
  INR2D1BWP16P90LVT U49 ( .A1(x[5]), .B1(x[35]), .ZN(y[5]) );
  INR2D1BWP16P90LVT U50 ( .A1(x[6]), .B1(x[35]), .ZN(y[6]) );
  INR2D1BWP16P90LVT U51 ( .A1(x[7]), .B1(x[35]), .ZN(y[7]) );
  INR2D1BWP16P90LVT U52 ( .A1(x[8]), .B1(x[35]), .ZN(y[8]) );
  INR2D1BWP16P90LVT U53 ( .A1(x[9]), .B1(x[35]), .ZN(y[9]) );
  INR2D1BWP16P90LVT U54 ( .A1(x[10]), .B1(x[35]), .ZN(y[10]) );
  INR2D1BWP16P90LVT U55 ( .A1(x[11]), .B1(x[35]), .ZN(y[11]) );
  INR2D1BWP16P90LVT U56 ( .A1(x[12]), .B1(x[35]), .ZN(y[12]) );
  INR2D1BWP16P90LVT U57 ( .A1(x[13]), .B1(x[35]), .ZN(y[13]) );
  INR2D1BWP16P90LVT U58 ( .A1(x[14]), .B1(x[35]), .ZN(y[14]) );
  INR2D1BWP16P90LVT U59 ( .A1(x[15]), .B1(x[35]), .ZN(y[15]) );
  INR2D1BWP16P90LVT U60 ( .A1(x[16]), .B1(x[35]), .ZN(y[16]) );
  INR2D1BWP16P90LVT U61 ( .A1(x[17]), .B1(x[35]), .ZN(y[17]) );
  INR2D1BWP16P90LVT U62 ( .A1(x[18]), .B1(x[35]), .ZN(y[18]) );
  INR2D1BWP16P90LVT U63 ( .A1(x[19]), .B1(x[35]), .ZN(y[19]) );
  INR2D1BWP16P90LVT U64 ( .A1(x[20]), .B1(x[35]), .ZN(y[20]) );
  INR2D1BWP16P90LVT U65 ( .A1(x[21]), .B1(x[35]), .ZN(y[21]) );
  INR2D1BWP16P90LVT U66 ( .A1(x[22]), .B1(x[35]), .ZN(y[22]) );
  INR2D1BWP16P90LVT U67 ( .A1(x[23]), .B1(x[35]), .ZN(y[23]) );
  INR2D1BWP16P90LVT U68 ( .A1(x[24]), .B1(x[35]), .ZN(y[24]) );
  INR2D1BWP16P90LVT U69 ( .A1(x[25]), .B1(x[35]), .ZN(y[25]) );
  INR2D1BWP16P90LVT U70 ( .A1(x[26]), .B1(x[35]), .ZN(y[26]) );
  INR2D1BWP16P90LVT U71 ( .A1(x[27]), .B1(x[35]), .ZN(y[27]) );
  INR2D1BWP16P90LVT U72 ( .A1(x[28]), .B1(x[35]), .ZN(y[28]) );
  INR2D1BWP16P90LVT U73 ( .A1(x[29]), .B1(x[35]), .ZN(y[29]) );
  INR2D1BWP16P90LVT U74 ( .A1(x[30]), .B1(x[35]), .ZN(y[30]) );
  INR2D1BWP16P90LVT U75 ( .A1(x[31]), .B1(x[35]), .ZN(y[31]) );
  INR2D1BWP16P90LVT U76 ( .A1(x[32]), .B1(x[35]), .ZN(y[32]) );
  INR2D1BWP16P90LVT U77 ( .A1(x[33]), .B1(x[35]), .ZN(y[33]) );
  INR2D1BWP16P90LVT U78 ( .A1(x[34]), .B1(x[35]), .ZN(y[34]) );
endmodule

