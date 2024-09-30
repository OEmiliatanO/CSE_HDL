`timescale 1ns / 1ps

module TB;
    parameter width = 32;
    // Clock
    reg clk;
    // Inputs of Adder
    reg [width-1:0]  a;
    reg [width-1:0]  b;
    wire [width-1:0] a1, a2, a3;
    wire [width-1:0] b1, b2, b3;
    wire [width:0]   testa, testb;
    reg              ci1, ci2, ci3;
    // Outputs of Adder
    wire [width-1:0] so1, so2, so3;
    wire             co1, co2, co3;
    reg  [width+1:0] shifted_co1, shifted_co2, shifted_co3;
    // Outputs of Reg of Adder
    wire [width-1:0] s1, s2, s3;
    wire             c1, c2, c3;
    integer i;

    adder_structure uut1 (
        .s(so1), .co(co1), .a(a1), .b(b1), .ci(ci1)
    );
    adder_structure_reg reg_uut1 (
        .si(so1), .ci(co1), .clk(clk), .so(s1), .co(c1)
    );

    adder_dataflow uut2 (
        .s(so2), .co(co2), .a(a2), .b(b2), .ci(ci2)
    );
    adder_dataflow_reg reg_uut2 (
        .si(so2), .ci(co2), .clk(clk), .so(s2), .co(c2)
    );

    adder_behavior uut3 (
        .s(so3), .co(co3), .a(a3), .b(b3), .ci(ci3)
    );
    adder_behavior_reg reg_uut3(
        .si(so3), .ci(co3), .clk(clk), .so(s3), .co(c3)
    );

    assign a1 = a; assign a2 = a; assign a3 = a;
    assign b1 = b; assign b2 = b; assign b3 = b;
    assign testa = a; assign testb = b;

    // Test
    initial begin
        clk = 0;
        a = 32'd0;
        b = 32'd0;
        ci1 = 1'd0; ci2 = 1'd0; ci3 = 1'd0; 

        for (i=1; i<= 10; i=i+1) begin
            #10 a = {$random}; b = {$random}; 
            #1 clk=~clk; // posedge clk
            #1 clk=~clk; // negedge clk
            $display("Adder (structure): %d + %d = %d + %d = %d\n", a, b, s1, shifted_co1, s1 + shifted_co1);
            $display("Adder (dataflow):  %d + %d = %d + %d = %d\n", a, b, s2, shifted_co2, s2 + shifted_co2);
            $display("Adder (behavior):  %d + %d = %d + %d = %d\n", a, b, s3, shifted_co3, s3 + shifted_co3);
            $display("Expected: %d + %d = %d\n", a, b, testa+testb);
        end
        
        #10 $finish;
    end

    always @(*) begin
        shifted_co1 = {c1, 32'b0}; 
        shifted_co2 = {c2, 32'b0}; 
        shifted_co3 = {c3, 32'b0}; 
    end    

endmodule