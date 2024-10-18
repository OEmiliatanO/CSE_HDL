`timescale 1ns / 1ps

module testbench;
    parameter width = 8;
    // Reset & Clock
    reg rst, clk;
    // Inputs
    reg [width-1:0]   a_reg, b_reg, c_reg;
    reg s_reg;
    wire [2*width-1:0] d_nonpipe;
    
    reg [2*width-1:0] nonpipe_arr [0:201];

    reg [width-1:0] a[0:199], b[0:199], c[0:199];
	reg s[0:199];
    integer i, a_in, b_in, c_in, s_in, fp;

    hw2_nonpipe nonpipe_uut (
        .a(a_reg), .b(b_reg), .c(c_reg), .s(s_reg), .d(d_nonpipe)
    );

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

        fp = $fopen("../../test.txt", "r");
        for (i=0; i < 200; i=i+1) begin
            $fscanf(fp, "%d %d %d %d\n", a_in, b_in, c_in, s_in);
            a[i] = a_in; b[i] = b_in; c[i] = c_in; s[i] = s_in;
        end
        $fclose(fp);

        for (i=0; i < 200; i=i+1) begin
            #10 a_reg = a[i]; b_reg = b[i]; c_reg = c[i]; s_reg = s[i];
            #1 clk=~clk; // posedge clk
            #1 clk=~clk; // negedge clk
            nonpipe_arr[i] = d_nonpipe;
        end
        
        for (i=0; i < 200; i=i+1) begin
            if (s[i]) begin
                $display("clock gating: (%d + %d) * %d = %d\n", a[i], b[i], c[i], nonpipe_arr[i]);
                $display("Expected:     (%d + %d) * %d = %d\n", a[i], b[i], c[i], 16'b0+(a[i]+b[i])*c[i]);
            end else begin
                $display("clock gating: (%d - %d) * %d = %d\n", a[i], b[i], c[i], nonpipe_arr[i]);
                $display("Expected:     (%d - %d) * %d = %d\n", a[i], b[i], c[i], 16'b0+(a[i]-b[i])*c[i]);
            end
        end

        #10 $finish;
    end

endmodule
