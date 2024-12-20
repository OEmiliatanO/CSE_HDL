`timescale 1ns / 1ns
`define period           10
`define img_max_size     224*224*3+54
`define padding_img_size 226*226
`define img_size 224*224
//---------------------------------------------------------------
//You need specify the path of image in/out
//---------------------------------------------------------------
`define path_img_in     "./cat224.bmp"
`define path_w_layer1_in "./conv1_kernel_hex.txt"
`define path_w_layer2_in "./conv2_kernel_hex.txt"
`define path_b_layer1_in "./conv1_bias_hex.txt"
`define path_b_layer2_in "./conv2_bias_hex.txt"

module HDL_HW5_TB;
    integer img_in;
    integer img_out_fp[0:1][0:63], w_layer1_in_fp, w_layer2_in_fp, b_layer1_in_fp, b_layer2_in_fp;
    integer offset;
    integer img_h;
    integer img_w;
    integer idx, h, w, i, j, k, channel;
    integer header, p;
    string img_out[0:1][0:63];
    
    reg         clk;
    reg         rst;
    wire        en0, en1, en2, en3;

    reg signed [7:0]  img_data [0:`img_max_size-1]; // load first
    reg [7:0] w_layer1_raw[0:10367];
    reg [7:0] w_layer2_raw[0:221183];
    reg [7:0] bias_layer1_raw[0:383], bias_layer2_raw[0:383];
    reg signed [15:0] w_layer1[0:63][0:2][0:8];   // load first
    reg signed [15:0] w_layer2[0:63][0:63][0:8];  // load first
    reg signed [15:0] bias_layer1[0:63];   // load first
    reg signed [15:0] bias_layer2[0:63];   // load first

    reg signed [8:0]  x0, x1, x2, x3;
    reg signed [15:0] wi[0:3][0:8];
    reg signed [15:0] b[0:3];
    reg signed [35:0] in_x0, in_x1, in_x2, in_x3;
    reg signed [7:0]  padding_img [0:2][0:`padding_img_size-1];
    wire signed [35:0] out0, out1, out2, out3;
    wire signed [35:0] out_y0, out_y1, out_y2, out_y3;

    reg signed [35:0] tmp0[0:`img_size-1];
    reg signed [35:0] tmp1[0:`img_size-1];
    reg signed [35:0] tmp2[0:`img_size-1];
    reg signed [35:0] tmp3[0:`img_size-1];
    reg signed [35:0] feature_layer1_padding[63:0][0:`padding_img_size-1];
    reg signed [35:0] feature_layer1[63:0][0:`img_size-1];
    reg signed [35:0] feature_layer2[63:0][0:`img_size-1];

    //---------------------------------------------------------------
    //Insert your  verilog module at here
    //
    Conv2d UUT0(.clk(clk), .rst(rst), .x(x0), .w0(wi[0][0]), .w1(wi[0][1]), .w2(wi[0][2]), .w3(wi[0][3]), .w4(wi[0][4]), .w5(wi[0][5]), .w6(wi[0][6]), .w7(wi[0][7]), .w8(wi[0][8]), .b(b[0]), .out(out0), .en(en0));
    ReLU UUT0_(.x(in_x0), .y(out_y0));
    Conv2d UUT1(.clk(clk), .rst(rst), .x(x1), .w0(wi[1][0]), .w1(wi[1][1]), .w2(wi[1][2]), .w3(wi[1][3]), .w4(wi[1][4]), .w5(wi[1][5]), .w6(wi[1][6]), .w7(wi[1][7]), .w8(wi[1][8]), .b(b[1]), .out(out1), .en(en1));
    ReLU UUT1_(.x(in_x1), .y(out_y1));
    Conv2d UUT2(.clk(clk), .rst(rst), .x(x2), .w0(wi[2][0]), .w1(wi[2][1]), .w2(wi[2][2]), .w3(wi[2][3]), .w4(wi[2][4]), .w5(wi[2][5]), .w6(wi[2][6]), .w7(wi[2][7]), .w8(wi[2][8]), .b(b[2]), .out(out2), .en(en2));
    ReLU UUT2_(.x(in_x2), .y(out_y2));
    Conv2d UUT3(.clk(clk), .rst(rst), .x(x3), .w0(wi[3][0]), .w1(wi[3][1]), .w2(wi[3][2]), .w3(wi[3][3]), .w4(wi[3][4]), .w5(wi[3][5]), .w6(wi[3][6]), .w7(wi[3][7]), .w8(wi[3][8]), .b(b[3]), .out(out3), .en(en3));
    ReLU UUT3_(.x(in_x3), .y(out_y3));
    //
    //---------------------------------------------------------------

//---------------------------------------------------------------------------------------Take out the color image(cat) of RGB----------------------------------------------
    //---------------------------------------------------------------
    //This initial block write the pixel 
    //---------------------------------------------------------------
    initial begin
        rst = 1'b1;
        clk = 1'b1;
        
        #(`period/2.0)
        rst = 1'b0;
        // clk = 0
        #(`period/2.0)
        rst = 1'b1;
        // clk = 1
        //loading after padding file to your module
        $display("layer1 begin");
        // layer1
        for (i=0; i<16; i=i+1) begin
            for (channel=0; channel<3; channel=channel+1) begin
                for (k = 0; k<`img_size; k=k+1) begin
                    tmp0[k] <= 0; tmp1[k] <= 0; tmp2[k] <= 0; tmp3[k] <= 0;
                end
                // load the weight that pass into Conv2d
                for (j=0; j<4; j=j+1) begin
                    for (k=0; k<9; k=k+1) begin
                        //wi[j][k] <= w_layer1[(4*i+j)*3*9+channel*9+k]; 
                        wi[j][k] = w_layer1[4*i+j][channel][k];
                        //$display("wi[%d][%d]=%d", j, k, wi[j][k]);
                    end
                    b[j] = bias_layer1[i*4+j];
                end

                
                //for (j=0; j<4; j=j+1) begin
                //    for (k=0; k<9; k=k+1) begin
                //        $display("wi[%d][%d]=%d", j, k, wi[j][k]);
                //    end
                //end
                

                // calculate the conv
                for(idx=0, j=0; idx<`padding_img_size; idx=idx+1) begin
                    x0 <= {1'd0, padding_img[channel][idx]};
                    x1 <= {1'd0, padding_img[channel][idx]};
                    x2 <= {1'd0, padding_img[channel][idx]};
                    x3 <= {1'd0, padding_img[channel][idx]};
                    #(`period);
                    if (en0 && en1 && en2 && en3 && idx>226+226-1 && j<`img_size) begin
                        tmp0[j] <= tmp0[j] + out0;
                        tmp1[j] <= tmp1[j] + out1;
                        tmp2[j] <= tmp2[j] + out2;
                        tmp3[j] <= tmp3[j] + out3;
                        //$display("at j=%d, out1=%d",j,out1);
                        //$display("channel=%d, [%d]=%d",channel,idx,out1);
                        j=j+1;
                    end
                end

                // flush
                rst = 1'b0;
                #(`period/2.0)
                rst = 1'b1;
                #(`period/2.0);

                //for (idx=0; idx<`img_size; idx=idx+1) begin
                //    $display("channel=%d, tmp1[%d]=%d",channel,idx,tmp1[idx]);
                //end
            end

            // ReLU
            for (idx = 0; idx<`img_size; idx=idx+1) begin
                in_x0 <= tmp0[idx];
                in_x1 <= tmp1[idx];
                in_x2 <= tmp2[idx];
                in_x3 <= tmp3[idx];
                
                #(`period/2.0) feature_layer1[i*4+0][idx] <= out_y0;
                #(`period/2.0) feature_layer1[i*4+1][idx] <= out_y1;
                #(`period/2.0) feature_layer1[i*4+2][idx] <= out_y2;
                #(`period/2.0) feature_layer1[i*4+3][idx] <= out_y3;

                //$display("tmp0[%d]=%d", idx, tmp0[idx]);
            end

            for(j=0; j<4; j=j+1) begin
                for(idx = 0; idx < `img_size; idx = idx+1) begin
                    $fwrite(img_out_fp[0][i*4+j], "%c", feature_layer1[i*4+j][idx][11:4]);
                    $fwrite(img_out_fp[0][i*4+j], "%c", feature_layer1[i*4+j][idx][11:4]);
                    $fwrite(img_out_fp[0][i*4+j], "%c", feature_layer1[i*4+j][idx][11:4]);
                end
                $fclose(img_out_fp[0][i*4+j]);
            end
            $display("output layer1 feature %d~%d end", i*4, i*4+3);
        end
        $display("layer1 end");
        
        $display("padding");
        // padding the feature map from layer 1
        for (i=0;i<64;i=i+1) begin
            for (idx = 0; idx<`padding_img_size; idx=idx+1)
                feature_layer1_padding[i][idx] <= 0;
        end
        for (i=0;i<64;i=i+1) begin
            for (h=0; h<224; h=h+1)
                for (w=0; w<224; w=w+1)
                    feature_layer1_padding[i][226*(h+1)+(w+1)] <= feature_layer1[i][h*224+w];
        end

        #(`period)
        // reset the conv unit
        rst = 1'b1;
        clk = 1'b1;
        #(`period/2.0)
        rst = 1'b0;
        // clk = 0
        #(`period/2.0)
        rst = 1'b1;
        // clk = 1

        $display("layer2 begin");
        // layer 2
        for (i=0; i<64; ++i) begin
            for (channel=0; channel<16; channel=channel+1) begin
                for (idx = 0; idx<`img_size; idx=idx+1) begin
                    tmp0[idx] <= 0;
                end
                // load the weight that pass into Conv2d
                for (j=0; j<4; j=j+1) begin
                    for (k=0; k<9; k=k+1) begin
                        //wi[j][k] <= w_layer2[i*64*9+(channel*4+j)*9+k];
                        wi[j][k] <= w_layer2[i][channel*4+j][k];
                    end
                    b[j] <= bias_layer2[i];
                end

                // calculate the conv
                for(idx=0, j=0; idx<`padding_img_size; idx=idx+1) begin
                    x0 <= {1'd0, feature_layer1_padding[channel*4+0][idx][11:4]};
                    x1 <= {1'd0, feature_layer1_padding[channel*4+1][idx][11:4]};
                    x2 <= {1'd0, feature_layer1_padding[channel*4+2][idx][11:4]};
                    x3 <= {1'd0, feature_layer1_padding[channel*4+3][idx][11:4]};
                    #(`period);
                    if (en0 && en1 && en2 && en3 && idx>226+226-1 && j<`img_size) begin
                        tmp0[j] <= tmp0[j] + out0 + out1 + out2 + out3;
                        j=j+1;
                    end
                end

                // flush
                rst = 1'b0;
                #(`period/2.0)
                rst = 1'b1;
                #(`period/2.0);
            end

            // ReLU
            for (idx = 0; idx<`img_size; idx=idx+1) begin
                in_x0 <= tmp0[idx];
                #(`period/2.0) feature_layer2[i][idx] <= out_y0;
            end

            for(idx = 0; idx < `img_size; idx = idx+1) begin
                $fwrite(img_out_fp[1][i], "%c", feature_layer2[i][idx][14:7]);
                $fwrite(img_out_fp[1][i], "%c", feature_layer2[i][idx][14:7]);
                $fwrite(img_out_fp[1][i], "%c", feature_layer2[i][idx][14:7]);
            end
            $display("output layer2 feature %d end", i);
            $fclose(img_out_fp[1][i]);

            rst = 1'b0;
            // clk = 0
            #(`period/2.0)
            rst = 1'b1;
        end
        $display("layer2 end");

        $fclose(img_in);
        $fclose(w_layer1_in_fp);
        $fclose(w_layer2_in_fp);
        $fclose(b_layer1_in_fp);
        $fclose(b_layer2_in_fp);
        $finish;
    end

    //---------------------------------------------------------------
    //This initial block read the pixel 
    //---------------------------------------------------------------
    initial begin
        //Open file
        img_in  = $fopen(`path_img_in, "rb");
        w_layer1_in_fp = $fopen(`path_w_layer1_in, "rb");
        w_layer2_in_fp = $fopen(`path_w_layer2_in, "rb");
        b_layer1_in_fp = $fopen(`path_b_layer1_in, "rb");
        b_layer2_in_fp = $fopen(`path_b_layer2_in, "rb");

        for (i=0; i<64; i=i+1) begin
            $sformat(img_out[0][i], "./layer1/layer1_%d.bmp", i);
            img_out_fp[0][i] = $fopen(img_out[0][i], "wb");
            $sformat(img_out[1][i], "./layer2/layer2_%d.bmp", i);
            img_out_fp[1][i] = $fopen(img_out[1][i], "wb");
        end

        //Read input file
        $fread(img_data, img_in);
        $fread(w_layer1_raw, w_layer1_in_fp);
        $fread(w_layer2_raw, w_layer2_in_fp);
        $fread(bias_layer1_raw, b_layer1_in_fp);
        $fread(bias_layer2_raw, b_layer2_in_fp);

        //Read header information of input file
        img_w   = {img_data[21],img_data[20],img_data[19],img_data[18]};
        img_h   = {img_data[25],img_data[24],img_data[23],img_data[22]};
        offset  = {img_data[13],img_data[12],img_data[11],img_data[10]};

        //Write header of output bmp file 
        for(header = 0; header < 54; header = header + 1) begin
            for (i=0; i<64; i=i+1) begin
                $fwrite(img_out_fp[0][i], "%c", img_data[header]);
                $fwrite(img_out_fp[1][i], "%c", img_data[header]);
            end
        end
        for (p = 54; p < offset; p = p + 1) begin
            for (i=0; i<64; i=i+1) begin
                $fwrite(img_out_fp[0][i], "%c", 0);
                $fwrite(img_out_fp[1][i], "%c", 0);
            end
        end

        //zero padding 
        for(idx=0; idx<`padding_img_size; idx=idx+1) begin
            padding_img[0][idx] = 0;
            padding_img[1][idx] = 0;
            padding_img[2][idx] = 0;
        end

        for(h = 0; h < img_h; h = h+1) begin
            for(w = 0; w < img_w; w = w+1) begin
                padding_img[2][h*226+w+227] = img_data[(h*224+w)*3 + offset + 2];
                padding_img[1][h*226+w+227] = img_data[(h*224+w)*3 + offset + 1];
                padding_img[0][h*226+w+227] = img_data[(h*224+w)*3 + offset + 0];
            end
        end

        for (i=0; i<64; i=i+1) begin
            for (j=0; j<3; j=j+1) begin
                for (k=0; k<9; k=k+1) begin
                    w_layer1[i][j][k] = (w_layer1_raw[(i*27+j*9+k)*6+0] >= 8'd97 && w_layer1_raw[(i*27+j*9+k)*6+0] <= 8'd102 ? w_layer1_raw[(i*27+j*9+k)*6+0] - 8'd97 + 10 : w_layer1_raw[(i*27+j*9+k)*6+0] - 8'd48)*(16'd16)*(16'd16)*(16'd16) + 
                                        (w_layer1_raw[(i*27+j*9+k)*6+1] >= 8'd97 && w_layer1_raw[(i*27+j*9+k)*6+1] <= 8'd102 ? w_layer1_raw[(i*27+j*9+k)*6+1] - 8'd97 + 10 : w_layer1_raw[(i*27+j*9+k)*6+1] - 8'd48)*(16'd16)*(16'd16) + 
                                        (w_layer1_raw[(i*27+j*9+k)*6+2] >= 8'd97 && w_layer1_raw[(i*27+j*9+k)*6+2] <= 8'd102 ? w_layer1_raw[(i*27+j*9+k)*6+2] - 8'd97 + 10 : w_layer1_raw[(i*27+j*9+k)*6+2] - 8'd48)*(16'd16) + 
                                        (w_layer1_raw[(i*27+j*9+k)*6+3] >= 8'd97 && w_layer1_raw[(i*27+j*9+k)*6+3] <= 8'd102 ? w_layer1_raw[(i*27+j*9+k)*6+3] - 8'd97 + 10 : w_layer1_raw[(i*27+j*9+k)*6+3] - 8'd48);
                end
            end

            for (j=0; j<64; j=j+1) begin
                for (k=0; k<9; k=k+1) begin
                    w_layer2[i][j][k] = (w_layer2_raw[(i*576+j*9+k)*6+0] >= 8'd97 && w_layer2_raw[(i*576+j*9+k)*6+0] <= 8'd102 ? w_layer2_raw[(i*576+j*9+k)*6+0] - 8'd97 + 10 : w_layer2_raw[(i*576+j*9+k)*6+0] - 8'd48)*(16'd16)*(16'd16)*(16'd16) + 
                                        (w_layer2_raw[(i*576+j*9+k)*6+1] >= 8'd97 && w_layer2_raw[(i*576+j*9+k)*6+1] <= 8'd102 ? w_layer2_raw[(i*576+j*9+k)*6+1] - 8'd97 + 10 : w_layer2_raw[(i*576+j*9+k)*6+1] - 8'd48)*(16'd16)*(16'd16) + 
                                        (w_layer2_raw[(i*576+j*9+k)*6+2] >= 8'd97 && w_layer2_raw[(i*576+j*9+k)*6+2] <= 8'd102 ? w_layer2_raw[(i*576+j*9+k)*6+2] - 8'd97 + 10 : w_layer2_raw[(i*576+j*9+k)*6+2] - 8'd48)*(16'd16) + 
                                        (w_layer2_raw[(i*576+j*9+k)*6+3] >= 8'd97 && w_layer2_raw[(i*576+j*9+k)*6+3] <= 8'd102 ? w_layer2_raw[(i*576+j*9+k)*6+3] - 8'd97 + 10 : w_layer2_raw[(i*576+j*9+k)*6+3] - 8'd48);
                end
            end

            bias_layer1[i] = (bias_layer1_raw[i*6+0] >= 8'd97 && bias_layer1_raw[i*6+0] <= 8'd102 ? bias_layer1_raw[i*6+0] - 8'd97 + 10 : bias_layer1_raw[i*6+0] - 8'd48)*(16'd16)*(16'd16)*(16'd16) + 
                             (bias_layer1_raw[i*6+1] >= 8'd97 && bias_layer1_raw[i*6+1] <= 8'd102 ? bias_layer1_raw[i*6+1] - 8'd97 + 10 : bias_layer1_raw[i*6+1] - 8'd48)*(16'd16)*(16'd16) + 
                             (bias_layer1_raw[i*6+2] >= 8'd97 && bias_layer1_raw[i*6+2] <= 8'd102 ? bias_layer1_raw[i*6+2] - 8'd97 + 10 : bias_layer1_raw[i*6+2] - 8'd48)*(16'd16) + 
                             (bias_layer1_raw[i*6+3] >= 8'd97 && bias_layer1_raw[i*6+3] <= 8'd102 ? bias_layer1_raw[i*6+3] - 8'd97 + 10 : bias_layer1_raw[i*6+3] - 8'd48);

            bias_layer2[i] = (bias_layer2_raw[i*6+0] >= 8'd97 && bias_layer2_raw[i*6+0] <= 8'd102 ? bias_layer2_raw[i*6+0] - 8'd97 + 10 : bias_layer2_raw[i*6+0] - 8'd48)*(16'd16)*(16'd16)*(16'd16) + 
                             (bias_layer2_raw[i*6+1] >= 8'd97 && bias_layer2_raw[i*6+1] <= 8'd102 ? bias_layer2_raw[i*6+1] - 8'd97 + 10 : bias_layer2_raw[i*6+1] - 8'd48)*(16'd16)*(16'd16) + 
                             (bias_layer2_raw[i*6+2] >= 8'd97 && bias_layer2_raw[i*6+2] <= 8'd102 ? bias_layer2_raw[i*6+2] - 8'd97 + 10 : bias_layer2_raw[i*6+2] - 8'd48)*(16'd16) + 
                             (bias_layer2_raw[i*6+3] >= 8'd97 && bias_layer2_raw[i*6+3] <= 8'd102 ? bias_layer2_raw[i*6+3] - 8'd97 + 10 : bias_layer2_raw[i*6+3] - 8'd48);
        end
        //$display("%d %d %d %d %d %d %d %d %d", w_layer1[0][0][0],w_layer1[0][0][1],w_layer1[0][0][2],w_layer1[0][0][3],w_layer1[0][0][4],w_layer1[0][0][5],w_layer1[0][0][6],w_layer1[0][0][7],w_layer1[0][0][8]);
        //$display("%d %d %d %d %d %d %d %d %d", w_layer1[0][1][0],w_layer1[0][1][1],w_layer1[0][1][2],w_layer1[0][1][3],w_layer1[0][1][4],w_layer1[0][1][5],w_layer1[0][1][6],w_layer1[0][1][7],w_layer1[0][1][8]);
        //$display("%d %d %d %d %d %d %d %d %d", w_layer1[1][0][0],w_layer1[1][0][1],w_layer1[1][0][2],w_layer1[1][0][3],w_layer1[1][0][4],w_layer1[1][0][5],w_layer1[1][0][6],w_layer1[1][0][7],w_layer1[1][0][8]);
        
    end
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    always begin
		#(`period/2.0) clk <= ~clk;
	end

    /*
    initial begin
		$sdf_annotate (`path_sdf, <your instance name>);
	end
    */
endmodule
