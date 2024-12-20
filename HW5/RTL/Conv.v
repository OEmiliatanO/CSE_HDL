/**
module Conv(threshold, R0, R1, R2, R3, R4, R5, R6, R7, R8, x, y);
    input signed [19:0] threshold;
    input signed [19:0] R0, R1, R2, R3, R4, R5, R6, R7, R8;
    output reg [7:0] x, y;
    reg signed [19:0] Gx, Gy;
    always @ (*) begin
        Gx <= ((R2 - R0) + (R5 - R3)) + ((R5 - R3) + (R8 - R6));
        if (Gx > threshold)
            x <= 8'd255;
        else
            x <= 0;

        Gy <= ((R0 - R6) + (R1 - R7)) + ((R1 - R7) + (R2 - R8));
        if (Gy > threshold)
            y <= 8'd255;
        else
            y <= 0;
    end
endmodule
**/

module Conv(R0, R1, R2, R3, R4, R5, R6, R7, R8, w0, w1, w2, w3, w4, w5, w6, w7, w8, b, res);
    input signed [8:0] R0, R1, R2, R3, R4, R5, R6, R7, R8;
    input signed [15:0] w0, w1, w2, w3, w4, w5, w6, w7, w8;
    input signed [15:0] b;
    output signed [35:0] res;
    assign res = R0*w0 + R1*w1 + R2*w2 + R3*w3 + R4*w4 + R5*w5 + R6*w6 + R7*w7 + R8*w8 + { {21{b[15]}}, b[14:0]};
endmodule

module Conv2d(clk, rst, x, w0, w1, w2, w3, w4, w5, w6, w7, w8, b, out, en);
    input clk, rst;
    input signed [8:0] x;
    input signed [15:0] w0, w1, w2, w3, w4, w5, w6, w7, w8;
    input signed [15:0] b;
    output signed [35:0] out;
    output en;

    wire signed [8:0] R0, R1, R2, R3, R4, R5, R6, R7, R8;
    LineBuffer step0(.clk(clk), .rst(rst), .Y(x), .en(en), .R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4), .R5(R5), .R6(R6), .R7(R7), .R8(R8));
    Conv step1(.R0(R0), .R1(R1), .R2(R2), .R3(R3), .R4(R4), .R5(R5), .R6(R6), .R7(R7), .R8(R8), .w0(w0), .w1(w1), .w2(w2), .w3(w3), .w4(w4), .w5(w5), .w6(w6), .w7(w7), .w8(w8), .b(b), .res(out));
endmodule
