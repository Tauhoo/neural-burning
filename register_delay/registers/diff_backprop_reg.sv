module diff_backprop_reg (
    w_layer_index,
    w_row_index,
    backprop_cost,
    diff_to_all,
    diff_start,
    diff_dense,
    diff_cost,
    dense_type,
    is_update,

    w_layer_index_out,
    w_row_index_out,
    backprop_cost_out,
    diff_to_all_out,
    diff_start_out,
    diff_dense_out,
    diff_cost_out,
    dense_type_out,
    is_update_out,

    clk,
    clk_out
);

    parameter size = 3;
    parameter data_size = 16;
    parameter dense_type_size = 4;
    parameter act_type_size = 4;

    input [31:0] w_layer_index;
    input [31:0] w_row_index;
    input backprop_cost;
    input [size*data_size - 1:0] diff_to_all;
    input [size*data_size - 1:0] diff_start;
    input [size*data_size - 1:0] diff_dense;
    input [size*data_size - 1:0] diff_cost;
    input [31:0] dense_type;
    input is_update;

    input clk;

    output [31:0] w_layer_index_out;
    output [31:0] w_row_index_out;
    output backprop_cost_out;
    output [size*data_size - 1:0] diff_to_all_out;
    output [size*data_size - 1:0] diff_start_out;
    output [size*data_size - 1:0] diff_dense_out;
    output [size*data_size - 1:0] diff_cost_out;
    output [31:0] dense_type_out;
    output is_update_out;

    output clk_out;

    wire delay_inst_w_layer_index_wire;
    wire delay_inst_w_row_index_wire;
    wire delay_inst_backprop_cost_wire;
    wire delay_inst_diff_to_all_wire;
    wire delay_inst_diff_start_wire;
    wire delay_inst_diff_dense_wire;
    wire delay_inst_diff_cost_wire;
    wire delay_inst_dense_type_wire;
    wire delay_inst_is_update_wire;

    assign clk_out = delay_inst_w_layer_index_wire &
              delay_inst_w_row_index_wire &
              delay_inst_backprop_cost_wire &
              delay_inst_diff_to_all_wire &
              delay_inst_diff_start_wire &
              delay_inst_diff_dense_wire &
              delay_inst_diff_cost_wire &
              delay_inst_dense_type_wire &
              delay_inst_is_update_wire;
    
    delay #(.data_size(32), .size(1)) 
    delay_inst_w_layer_index(.bus_in(w_layer_index), .bus_out(w_layer_index_out), .clk(clk), .clk_out(delay_inst_w_layer_index_wire));
    
    delay #(.data_size(32), .size(1)) 
    delay_inst_w_row_index(.bus_in(w_row_index), .bus_out(w_row_index_out), .clk(clk), .clk_out(delay_inst_w_row_index_wire));
    
    delay #(.data_size(1), .size(1)) 
    delay_inst_backprop_cost(.bus_in(backprop_cost), .bus_out(backprop_cost_out), .clk(clk), .clk_out(delay_inst_backprop_cost_wire));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_diff_to_all(.bus_in(diff_to_all), .bus_out(diff_to_all_out), .clk(clk), .clk_out(delay_inst_diff_to_all_wire));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_diff_start(.bus_in(diff_start), .bus_out(diff_start_out), .clk(clk), .clk_out(delay_inst_diff_start_wire));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_diff_dense(.bus_in(diff_dense), .bus_out(diff_dense_out), .clk(clk), .clk_out(delay_inst_diff_dense_wire));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_diff_cost(.bus_in(diff_cost), .bus_out(diff_cost_out), .clk(clk), .clk_out(delay_inst_diff_cost_wire));
    
    delay #(.data_size(dense_type_size), .size(1)) 
    delay_inst_dense_type(.bus_in(dense_type), .bus_out(dense_type_out), .clk(clk), .clk_out(delay_inst_dense_type_wire));
    
    delay #(.data_size(1), .size(1)) 
    delay_inst_is_update(.bus_in(is_update), .bus_out(is_update_out), .clk(clk), .clk_out(delay_inst_is_update_wire));
    
endmodule