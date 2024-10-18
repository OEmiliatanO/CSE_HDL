`timescale 1ns / 1ps

module testbench;
    parameter width = 8;
    // Reset & Clock
    reg rst, clk;
    // Inputs
    reg [width-1:0]   a_reg, b_reg, c_reg;
    reg s_reg;
    wire [2*width-1:0] d_cg;
    
    reg [2*width-1:0] cg_arr [0:1][0:102];

    reg [width-1:0] a[0:1][0:99], b[0:1][0:99], c[0:1][0:99];
	reg s[0:1][0:99];
    integer i, a_in, b_in, c_in, s_in, randints_f, randints_c0_f;

	hw2_cg cg_uut (
		.a(a_reg), .b(b_reg), .c(c_reg), .s(s_reg), .rst(rst), .clk(clk), .d(d_cg)
	);
    initial begin
        $dumpvars();
        $dumpfile("clockgating_wave.vcd");
        $sdf_annotate("/home/B103040012_HDL/HDL/HW2/GateLevel/Clock_gating/dc_out_file/hw2_clock_gating_syn.sdf", cg_uut);
    end

    // Test
    initial begin
        clk = 0;
		rst = 1;
        a_reg = 0;
        b_reg = 0;
		c_reg = 0;
        s_reg = 1;
		#1
		rst = 0;
        
        randints_f = $fopen("../../randints.txt", "r");
        randints_c0_f = $fopen("../../randints_c0.txt", "r");
        for (i=0; i < 100; i=i+1) begin
            $fscanf(randints_f, "%d %d %d %d\n", a_in, b_in, c_in, s_in);
            a[0][i] = a_in; b[0][i] = b_in; c[0][i] = c_in; s[0][i] = s_in;
            $fscanf(randints_c0_f, "%d %d %d %d\n", a_in, b_in, c_in, s_in);
            a[1][i] = a_in; b[1][i] = b_in; c[1][i] = c_in; s[1][i] = s_in;
        end
        $fclose(randints_f);
        $fclose(randints_c0_f);

        for (i=0; i < 100; i=i+1) begin
            #10 a_reg = a[0][i]; b_reg = b[0][i]; c_reg = c[0][i]; s_reg = s[0][i];
            #1 clk=~clk; // posedge clk
            #1 clk=~clk; // negedge clk
            cg_arr[0][i] = d_cg;
        end
        for (i=100; i < 103; i=i+1) begin
            #1 clk=~clk; // posedge clk
            #1 clk=~clk; // negedge clk
            cg_arr[0][i] = d_cg;
        end
        
        for (i=0; i < 100; i=i+1) begin
            if (s[0][i]) begin
                $display("clock gating: (%d + %d) * %d = %d\n", a[0][i], b[0][i], c[0][i], cg_arr[0][i+1]);
                $display("Expected:     (%d + %d) * %d = %d\n", a[0][i], b[0][i], c[0][i], 16'b0+(a[0][i]+b[0][i])*c[0][i]);
            end else begin
                $display("clock gating: (%d - %d) * %d = %d\n", a[0][i], b[0][i], c[0][i], cg_arr[0][i+1]);
                $display("Expected:     (%d - %d) * %d = %d\n", a[0][i], b[0][i], c[0][i], 16'b0+(a[0][i]-b[0][i])*c[0][i]);
            end
        end

        for (i=0; i < 100; i=i+1) begin
            #10 a_reg = a[1][i]; b_reg = b[1][i]; c_reg = c[1][i]; s_reg = s[1][i];
            #1 clk=~clk; // posedge clk
            #1 clk=~clk; // negedge clk
            cg_arr[1][i] = d_cg;
        end
        for (i=100; i < 103; i=i+1) begin
            #1 clk=~clk; // posedge clk
            #1 clk=~clk; // negedge clk
            cg_arr[1][i] = d_cg;
        end
        
        for (i=0; i < 100; i=i+1) begin
            if (s[0][i]) begin
                $display("clock gating: (%d + %d) * %d = %d\n", a[1][i], b[1][i], c[1][i], cg_arr[1][i+1]);
                $display("Expected:     (%d + %d) * %d = %d\n", a[1][i], b[1][i], c[1][i], 16'b0+(a[1][i]+b[1][i])*c[1][i]);
            end else begin
                $display("clock gating: (%d - %d) * %d = %d\n", a[1][i], b[1][i], c[1][i], cg_arr[1][i+1]);
                $display("Expected:     (%d - %d) * %d = %d\n", a[1][i], b[1][i], c[1][i], 16'b0+(a[1][i]-b[1][i])*c[1][i]);
            end
        end

        #10 $finish;
    end

endmodule
