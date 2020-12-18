module backprop_start(x_data,
                      clk,
                      dy_dw);
    parameter data_size = 4;
    parameter size      = 3;
    
    input [data_size*size - 1:0] x_data;
    input clk;
    output [data_size*size - 1:0] dy_dw;
    
    assign dy_dw = x_data;
    
endmodule
