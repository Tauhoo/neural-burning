module dense_layer_delay_reg (
    act_type,
    cost_type,
    predict_value,

    dense_type,

    x,
    w,

    backprop_controll,

    act_type_out,
    cost_type_out,
    predict_value_out,

    dense_type_out,
    
    x_out,
    w_out,

    backprop_controll_out,
    
    clk
);

    parameter size = 3;
    parameter data_size = 16;
    parameter cost_type_size = 8;
    parameter dense_type_size = 4;
    parameter act_type_size = 4;
    parameter cycle = size*2 - 1;
    parameter backprop_controll_size = 32*3 + 4 ;
    localparam  bundle_size = act_type_size + cost_type_size + dense_type_size + data_size*size*3;
    
    input clk;

    input [act_type_size - 1:0] act_type;
    input [cost_type_size - 1:0] cost_type;
    input [data_size*size - 1:0] predict_value;
    
    input [dense_type_size - 1:0] dense_type;

    input [data_size*size - 1:0] x;
    input [data_size*size - 1:0] w;

    input [backprop_controll_size - 1:0] backprop_controll;

    output [act_type_size - 1:0] act_type_out;
    output [cost_type_size - 1:0] cost_type_out;
    output [data_size*size - 1:0] predict_value_out;

    output [dense_type_size - 1:0] dense_type_out;

    output [data_size*size - 1:0] x_out;
    output [data_size*size - 1:0] w_out;

    output [backprop_controll_size - 1:0] backprop_controll_out;

    wire [bundle_size - 1:0] bundle;
    wire [bundle_size - 1:0] bundle_out;

    assign bundle = {act_type, cost_type, predict_value, dense_type, x, w};
    assign {act_type_out, cost_type_out, predict_value_out, dense_type_out, x_out, w_out} = bundle_out;

    delay #(.data_size(bundle_size), .size(1), .cycle(cycle))
    delay_inst_bundle(.bus_in(bundle), .bus_out(bundle_out), .clk(clk));

    delay #(.data_size(backprop_controll_size), .size(1), .cycle(cycle))
    delay_inst_backprop_controll(.bus_in(backprop_controll), .bus_out(backprop_controll_out), .clk(clk));
endmodule