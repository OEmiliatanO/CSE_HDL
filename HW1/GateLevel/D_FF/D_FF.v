/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : V-2023.12
// Date      : Tue Oct  1 21:08:06 2024
/////////////////////////////////////////////////////////////


module D_FF ( q, d, clk );
  input d, clk;
  output q;
  wire   n1;

  DFQD2BWP16P90LVT q_reg ( .D(n1), .CP(clk), .Q(q) );
  CKBD1BWP20P90 U3 ( .I(d), .Z(n1) );
endmodule

