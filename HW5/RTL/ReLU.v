module ReLU(x, y);
    input signed [35:0] x;
    output signed [35:0] y;
    assign y = x < 0 ? 0 : x;
endmodule