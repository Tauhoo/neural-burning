module activate_diff_reg (
    label, 
    cost_type,
    dense_type,
    backprop_cost,
    w, 
    x, 
    w_layer_index, 
    w_row_index, 
    is_update,

    z,
    
    label_out,
    cost_type_out,
    dense_type_out,
    backprop_cost_out,
    w_out,
    x_out,
    w_layer_index_out,
    w_row_index_out,
    is_update_out,
    z_out,
    clk,
    clk_out
);
    parameter size = 3;
    parameter data_size = 16;
    parameter cost_type_size = 8;
    parameter dense_type_size = 4;

    input [data_size*size - 1:0] label;
    input [cost_type_size - 1:0] cost_type;
    input [dense_type_size - 1:0] dense_type;
    input backprop_cost;
    input [data_size*size - 1:0] w;
    input [data_size*size - 1:0] x;
    input [31:0] w_layer_index;
    input [31:0] w_row_index;
    input is_update;

    input [data_size*size - 1:0] z;

    input clk;

    output [data_size*size - 1:0] label_out;
    output [cost_type_size - 1:0] cost_type_out;
    output [dense_type_size - 1:0] dense_type_out;
    output backprop_cost_out;
    output [data_size*size - 1:0] w_out;
    output [data_size*size - 1:0] x_out;
    output [31:0] w_layer_index_out;
    output [31:0] w_row_index_out;
    output is_update_out;

    output [data_size*size - 1:0] z_out;

    output clk_out;

    wire delay_inst_label_wire;
    wire delay_inst_cost_type_wire;
    wire delay_inst_dense_type_wire;
    wire delay_inst_backprop_cost_wire;
    wire delay_inst_w_wire;
    wire delay_inst_x_wire;
    wire delay_inst_w_layer_index_wire;
    wire delay_inst_w_row_index_wire;
    wire delay_inst_is_update_wire;
    wire delay_inst_z_wire;

    assign clk_out =  delay_inst_label_wire & 
                      delay_inst_cost_type_wire & 
                      delay_inst_dense_type_wire & 
                      delay_inst_backprop_cost_wire & 
                      delay_inst_w_wire & 
                      delay_inst_x_wire & 
                      delay_inst_w_layer_index_wire & 
                      delay_inst_w_row_index_wire & 
                      delay_inst_is_update_wire & 
                      delay_inst_z_wire;

    delay #(.data_size(1), .size(1)) 
    delay_inst_label(.bus_in(label), .bus_out(label_out), .clk(clk), .clk_out(delay_inst_label_wire));

    delay #(.data_size(cost_type_size), .size(1)) 
    delay_inst_cost_type(.bus_in(cost_type), .bus_out(cost_type_out), .clk(clk), .clk_out(delay_inst_cost_type_wire));

    delay #(.data_size(dense_type_size), .size(1))
    delay_inst_dense_type(.bus_in(dense_type), .bus_out(dense_type_out), .clk(clk), .clk_out(delay_inst_dense_type_wire));

    delay #(.data_size(1), .size(1))
    delay_inst_backprop_cost(.bus_in(backprop_cost), .bus_out(backprop_cost_out), .clk(clk), .clk_out(delay_inst_backprop_cost_wire));

    delay #(.data_size(data_size), .size(size))
    delay_inst_w(.bus_in(w), .bus_out(w_out), .clk(clk), .clk_out(delay_inst_w_wire));

    delay #(.data_size(data_size), .size(size))
    delay_inst_x(.bus_in(x), .bus_out(x_out), .clk(clk), .clk_out(delay_inst_x_wire));

    delay #(.data_size(32), .size(1))
    delay_inst_w_layer_index(.bus_in(w_layer_index), .bus_out(w_layer_index_out), .clk(clk), .clk_out(delay_inst_w_layer_index_wire));

    delay #(.data_size(32), .size(1))
    delay_inst_w_row_index(.bus_in(w_row_index), .bus_out(w_row_index_out), .clk(clk), .clk_out(delay_inst_w_row_index_wire));

    delay #(.data_size(1), .size(1))
    delay_inst_is_update(.bus_in(is_update), .bus_out(is_update_out), .clk(clk), .clk_out(delay_inst_is_update_wire));

    delay #(.data_size(data_size), .size(size))
    delay_inst_z(.bus_in(z), .bus_out(z_out), .clk(clk), .clk_out(delay_inst_z_wire));

endmodule