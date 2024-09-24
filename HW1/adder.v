module adder(a, b, cin, s, cout);
input  [31:0] a, b;
input         cin;
output [31:0] s;
output        cout;

assign {cout, s} = a + b + cin;

endmodule