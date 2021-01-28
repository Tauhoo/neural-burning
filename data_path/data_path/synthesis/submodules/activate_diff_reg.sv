module activate_diff_reg (
    predict_value, 
    cost_type,
    dense_type,
    w, 
    x, 

    z,
    backprop_controll,
    
    predict_value_out,
    cost_type_out,
    dense_type_out,
    w_out,
    x_out,
    z_out,
    backprop_controll_out,
    clk
);
    parameter size = 3;
    parameter data_size = 16;
    parameter cost_type_size = 8;
    parameter dense_type_size = 4;
    parameter backprop_controll_size = 32*3 + 4 ;

    input [data_size*size - 1:0] predict_value;
    input [cost_type_size - 1:0] cost_type;
    input [dense_type_size - 1:0] dense_type;
    input [data_size*size - 1:0] w;
    input [data_size*size - 1:0] x;

    input [data_size*size - 1:0] z;
    input [backprop_controll_size - 1:0] backprop_controll;

    input clk;

    output [data_size*size - 1:0] predict_value_out;
    output [cost_type_size - 1:0] cost_type_out;
    output [dense_type_size - 1:0] dense_type_out;
    output [data_size*size - 1:0] w_out;
    output [data_size*size - 1:0] x_out;

    output [data_size*size - 1:0] z_out;
    output [backprop_controll_size - 1:0] backprop_controll_out;

    delay #(.data_size(data_size), .size(size)) 
    delay_inst_predict_value(.bus_in(predict_value), .bus_out(predict_value_out), .clk(clk));

    delay #(.data_size(cost_type_size), .size(1)) 
    delay_inst_cost_type(.bus_in(cost_type), .bus_out(cost_type_out), .clk(clk));

    delay #(.data_size(dense_type_size), .size(1))
    delay_inst_dense_type(.bus_in(dense_type), .bus_out(dense_type_out), .clk(clk));

    delay #(.data_size(data_size), .size(size))
    delay_inst_w(.bus_in(w), .bus_out(w_out), .clk(clk));

    delay #(.data_size(data_size), .size(size))
    delay_inst_x(.bus_in(x), .bus_out(x_out), .clk(clk));

    delay #(.data_size(data_size), .size(size))
    delay_inst_z(.bus_in(z), .bus_out(z_out), .clk(clk));

    delay #(.data_size(backprop_controll_size), .size(1))
    delay_inst_backprop_controll(.bus_in(backprop_controll), .bus_out(backprop_controll_out), .clk(clk));

endmodule