module adder_dataflow_reg(si, ci, clk, so, co);
    parameter width = 32;
    input [width-1:0]  si;
    input              ci, clk;
    output [width-1:0] so;
    output             co;
    genvar g;

    generate
        for (g=0; g<width; g=g+1) begin : generate_adder_regs
            D_FF adder_reg(so[g], si[g], clk);
        end
    endgenerate
    D_FF c_result(co, ci, clk);
endmodule