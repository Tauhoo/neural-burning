module backprop_to_all(w_data,
                       clk,
                       dy_dyold);
    parameter data_size = 4;
    parameter size      = 3;
    input clk;
    input [data_size*size - 1:0] w_data;
    output [data_size*size - 1:0] dy_dyold;
    
    assign dy_dyold = w_data;
endmodule
