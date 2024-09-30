module FA(sum, c_out, a, b, c_in);
    output sum;
    output c_out;
    input  a, b;
    input  c_in;
    wire s1, s2, c1;

    xor U1(s1, a, b);
    and U2(c1, a, b);
    and U3(s2, s1, c_in);
    xor U4(sum, s1, c_in);
    xor U5(c_out, s2, c1);
endmodule

module adder_structure(s, co, a, b, ci);
    parameter width = 32;
    output [width-1:0] s;
    output             co;
    input  [width-1:0] a, b;
    input              ci;
    genvar g;

    wire co_[width-1:0];
    FA fa0(s[0], co_[0], a[0], b[0], ci);
    generate
        for (g=1; g<width; g=g+1) begin : generate_FAs
            FA fa(s[g], co_[g], a[g], b[g], co_[g-1]);
        end
    endgenerate
    assign co = co_[width-1];
endmodule
