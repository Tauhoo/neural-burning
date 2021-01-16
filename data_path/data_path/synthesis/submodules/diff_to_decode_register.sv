module diff_to_decode_register (
    is_cost_layer,
    predict_value,
    z,
    w_layer_index,
    w_row_index,

    is_cost_layer_out,
    predict_value_out,
    z_out,
    w_layer_index_out,
    w_row_index_out,

    clk
);
    parameter size = 3;
    parameter data_size = 16;

    input is_cost_layer;
    input [data_size*size - 1:0] predict_value;
    input [data_size*size - 1:0] z;
    input clk;
    input [31:0] w_layer_index;
    input [31:0] w_row_index;

    output is_cost_layer_out;
    output [data_size*size - 1:0] predict_value_out;
    output [data_size*size - 1:0] z_out;
    output [31:0] w_layer_index_out;
    output [31:0] w_row_index_out;

    delay #(.data_size(1), .size(1)) 
    delay_inst_is_cost_layer(.bus_in(is_cost_layer), .bus_out(is_cost_layer_out), .clk(clk));

    delay #(.data_size(data_size), .size(size)) 
    delay_inst_predict_value(.bus_in(predict_value), .bus_out(predict_value_out), .clk(clk));

    delay #(.data_size(data_size), .size(size)) 
    delay_inst_z(.bus_in(z), .bus_out(z_out), .clk(clk));

    delay #(.data_size(32), .size(1)) 
    delay_inst_w_layer_index(.bus_in(w_layer_index), .bus_out(w_layer_index_out), .clk(clk));

    delay #(.data_size(32), .size(1)) 
    delay_inst_w_row_index(.bus_in(w_row_index), .bus_out(w_row_index_out), .clk(clk));
endmodule