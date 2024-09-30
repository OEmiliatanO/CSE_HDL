module D_FF (q, d, clk);
    output reg q;
    input d, clk;
    always @(posedge clk)
        q <= d;
endmodule