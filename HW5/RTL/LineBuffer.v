`define REG_LEN 226+226+3-1
module LineBuffer(clk, rst, Y, en, R0, R1, R2, R3, R4, R5, R6, R7, R8);
    input clk, rst;
    input  signed [8:0] Y;
    output reg en;
    output reg signed [8:0] R0, R1, R2, R3, R4, R5, R6, R7, R8;

    integer i, counter;
    reg signed [8:0] Regs[0:`REG_LEN];

    always @ (posedge clk or negedge rst) begin
        if (~rst) begin
            R0 <= 0;
            R1 <= 0;
            R2 <= 0;
            R3 <= 0;
            R4 <= 0;
            R5 <= 0;
            R6 <= 0;
            R7 <= 0;
            R8 <= 0;
            counter <= 0;
            en <= 0;
            for (i = 0; i < `REG_LEN; i=i+1) begin
                Regs[i] <= 0;
            end
        end
        else begin
            for (i = 0; i < `REG_LEN; i=i+1) begin
                Regs[i] <= Regs[i+1];
            end
            Regs[`REG_LEN] <= Y;
            
            R0 <= Regs[0];
            R1 <= Regs[1];
            R2 <= Regs[2];

            R3 <= Regs[226];
            R4 <= Regs[227];
            R5 <= Regs[228];

            R6 <= Regs[452];
            R7 <= Regs[453];
            R8 <= Regs[454];

            if (counter == 225 || counter == 0)
                en <= 0;
            else
                en <= 1;
            counter <= (counter == 225 ? 0 : counter + 1);
        end
    end
endmodule