module FA(sum, c_out, a, b, c_in);
output sum;
output c_out;
input  a, b;
input  c_in;

assign s1 = xor(a, b);
assign c1 = and(a, b);
assign s2 = and(s1, c_in);
assign sum = xor(s1, c_in);
assign c_out = xor(s2, c1);

endmodule

module adder_structure(s, co, a, b, ci);
parameter width = 32;
output [width-1:0] s;
output             co;
input  [width-1:0] a, b;
input              ci;
genvar g;

wire co_[width-1:0];
FA fa0(s[0], co_[0], a[0], b[0], cin);
generate
    for (g=1; g<width; g=g+1) begin
        FA fa(s[i], co_[i], a[i], b[i], co_[i-1]);
    end
endgenerate
assign co = co_[width-1];

endmodule