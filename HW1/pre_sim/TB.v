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
    wire [width-1:0] structure_s, dataflow_s, behavior_s;
    wire             structure_c, datflow_c, behavior_c;
    reg  [width+1:0] shifted_structure_c, shifted_datflow_c, shifted_behavior_c;
    // Outputs of Reg of Adder
    wire [width-1:0] structure_reg_s, dataflow_reg_s, behavior_reg_s;
    wire             structure_reg_c, dataflow_reg_c, behavior_reg_c;
    integer i;

    adder_structure uut1 (
        .s(structure_s), .co(structure_c), .a(a1), .b(b1), .ci(ci1)
    );
    adder_structure_reg reg_uut1 (
        .si(structure_s), .ci(structure_c), .clk(clk), .so(structure_reg_s), .co(structure_reg_c)
    );

    adder_dataflow uut2 (
        .s(dataflow_s), .co(datflow_c), .a(a2), .b(b2), .ci(ci2)
    );
    adder_dataflow_reg reg_uut2 (
        .si(dataflow_s), .ci(datflow_c), .clk(clk), .so(dataflow_reg_s), .co(dataflow_reg_c)
    );

    adder_behavior uut3 (
        .s(behavior_s), .co(behavior_c), .a(a3), .b(b3), .ci(ci3)
    );
    adder_behavior_reg reg_uut3(
        .si(behavior_s), .ci(behavior_c), .clk(clk), .so(behavior_reg_s), .co(behavior_reg_c)
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
            $display("Adder (structure): %d + %d = %d + %d = %d\n", a, b, structure_reg_s, shifted_structure_c, structure_reg_s + shifted_structure_c);
            $display("Adder (dataflow):  %d + %d = %d + %d = %d\n", a, b, dataflow_reg_s, shifted_datflow_c, dataflow_reg_s + shifted_datflow_c);
            $display("Adder (behavior):  %d + %d = %d + %d = %d\n", a, b, behavior_reg_s, shifted_behavior_c, behavior_reg_s + shifted_behavior_c);
            $display("Expected: %d + %d = %d\n", a, b, testa+testb);
        end
        
        #10 $finish;
    end

    always @(*) begin
        shifted_structure_c = {structure_reg_c, 32'b0}; 
        shifted_datflow_c = {dataflow_reg_c, 32'b0}; 
        shifted_behavior_c = {behavior_reg_c, 32'b0}; 
    end    

endmodule
