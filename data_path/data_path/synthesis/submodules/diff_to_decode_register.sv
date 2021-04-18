module diff_to_decode_register (
    predict_value,
    z,
    w_layer_index,
    w_row_index,
    update_weight,
    dc_dw,

    predict_value_out,
    z_out,
    w_layer_index_out,
    w_row_index_out,
    update_weight_out,
    dc_dw_out,

    clk
);
    parameter size = 3;
    parameter data_size = 16;

    input [data_size*size - 1:0] predict_value;
    input [data_size*size - 1:0] z;
    input clk;
    input [31:0] w_layer_index;
    input [31:0] w_row_index;
    input update_weight;
    input [data_size*size - 1:0] dc_dw;

    output [data_size*size - 1:0] predict_value_out;
    output [data_size*size - 1:0] z_out;
    output [31:0] w_layer_index_out;
    output [31:0] w_row_index_out;
    output update_weight_out;
    output [data_size*size - 1:0] dc_dw_out;

    delay #(.data_size(data_size), .size(size)) 
    delay_inst_predict_value(.bus_in(predict_value), .bus_out(predict_value_out), .clk(clk));

    delay #(.data_size(data_size), .size(size)) 
    delay_inst_dc_dw(.bus_in(dc_dw), .bus_out(dc_dw_out), .clk(clk));

    delay #(.data_size(data_size), .size(size)) 
    delay_inst_z(.bus_in(z), .bus_out(z_out), .clk(clk));

    delay #(.data_size(32), .size(1)) 
    delay_inst_w_layer_index(.bus_in(w_layer_index), .bus_out(w_layer_index_out), .clk(clk));

    delay #(.data_size(32), .size(1)) 
    delay_inst_w_row_index(.bus_in(w_row_index), .bus_out(w_row_index_out), .clk(clk));

    delay #(.data_size(1), .size(1)) 
    delay_inst_update_weight(.bus_in(update_weight), .bus_out(update_weight_out), .clk(clk));
endmodule