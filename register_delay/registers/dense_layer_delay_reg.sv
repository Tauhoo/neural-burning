module dense_layer_delay_reg (
    act_type,
    backprop_cost,
    cost_type,
    is_update,
    predict_value,
    w_layer_index,
    w_row_index,

    dense_type,

    x,
    w,

    act_type_out,
    backprop_cost_out,
    cost_type_out,
    is_update_out,
    predict_value_out,
    w_layer_index_out,
    w_row_index_out,

    dense_type_out,
    
    x_out,
    w_out,

    clk
);

    parameter size = 3;
    parameter data_size = 16;
    parameter cost_type_size = 8;
    parameter dense_type_size = 4;
    parameter act_type_size = 4;
    parameter cycle = 1;
    localparam  bundle_size = act_type_size + 1 + cost_type_size + 1 + 31 + 31 + dense_type_size + data_size*size*3;
    
    input clk;

    input [act_type_size - 1:0] act_type;
    input backprop_cost;
    input [cost_type_size - 1:0] cost_type;
    input is_update;
    input [data_size*size - 1:0] predict_value;
    input [31:0] w_layer_index;
    input [31:0] w_row_index;

    input [dense_type_size - 1:0] dense_type;

    input [data_size*size - 1:0] x;
    input [data_size*size - 1:0] w;

    output [act_type_size - 1:0] act_type_out;
    output backprop_cost_out;
    output [cost_type_size - 1:0] cost_type_out;
    output is_update_out;
    output [data_size*size - 1:0] predict_value_out;
    output [31:0] w_layer_index_out;
    output [31:0] w_row_index_out;

    output [dense_type_size - 1:0] dense_type_out;

    output [data_size*size - 1:0] x_out;
    output [data_size*size - 1:0] w_out;

    wire [bundle_size - 1:0] bundle;
    wire [bundle_size - 1:0] bundle_out;

    assign bundle = {act_type, backprop_cost, cost_type, is_update, predict_value, w_layer_index, w_row_index, dense_type, x, w};
    assign {act_type_out, backprop_cost_out, cost_type_out, is_update_out, predict_value_out, w_layer_index_out, w_row_index_out, dense_type_out, x_out, w_out} = bundle_out;

    delay #(.data_size(bundle_size), .size(1), .cycle(cycle)) 
    delay_inst_is_update(.bus_in(bundle), .bus_out(bundle_out), .clk(clk));


endmodule