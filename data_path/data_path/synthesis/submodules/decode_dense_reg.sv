module decode_dense_reg (
    act_type,
    dense_type,
    cost_type, //parse code
    w, // single
    w_layer_index,// single
    w_row_index,// single
    is_update,
    load_w,
    backprop_cost, //control
    x, // single
    label_in, // single
    act_type_out,
    dense_type_out,
    cost_type_out,
    w_out,
    w_layer_index_out,
    w_row_index_out,
    is_update_out,
    load_w_out,
    backprop_cost_out,
    x_out,
    label_out,
    clk
);
    parameter size = 3;
    parameter data_size = 16;
    parameter cost_type_size = 8;
    parameter dense_type_size = 4;
    parameter act_type_size = 4;

    input [act_type_size - 1:0] act_type;
    input [dense_type_size - 1:0] dense_type;
    input [cost_type_size - 1:0] cost_type;
    input [data_size*size - 1:0] w;
    input [31:0] w_layer_index;
    input [31:0] w_row_index;
    input is_update;
    input load_w;
    input backprop_cost;
    input [data_size*size - 1:0] x;
    input [data_size*size - 1:0] label_in;

    input clk;

    output [act_type_size - 1:0] act_type_out;
    output [dense_type_size - 1:0] dense_type_out;
    output [cost_type_size - 1:0] cost_type_out;
    output [data_size*size - 1:0] w_out;
    output [31:0] w_layer_index_out;
    output [31:0] w_row_index_out;
    output is_update_out;
    output load_w_out;
    output backprop_cost_out;
    output [data_size*size - 1:0] x_out;
    output [data_size*size - 1:0] label_out;

    delay #(.data_size(32), .size(1)) 
    delay_inst_act_type(.bus_in(act_type), .bus_out(act_type_out), .clk(clk));
    
    delay #(.data_size(32), .size(1)) 
    delay_inst_dense_type(.bus_in(dense_type), .bus_out(dense_type_out), .clk(clk));
    
    delay #(.data_size(32), .size(1)) 
    delay_inst_cost_type(.bus_in(cost_type), .bus_out(cost_type_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_w(.bus_in(w), .bus_out(w_out), .clk(clk));
    
    delay #(.data_size(32), .size(1)) 
    delay_inst_w_layer_index(.bus_in(w_layer_index), .bus_out(w_layer_index_out), .clk(clk));
    
    delay #(.data_size(32), .size(1)) 
    delay_inst_w_row_index(.bus_in(w_row_index), .bus_out(w_row_index_out), .clk(clk));
    
    delay #(.data_size(1), .size(1)) 
    delay_inst_is_update(.bus_in(is_update), .bus_out(is_update_out), .clk(clk));
    
    delay #(.data_size(1), .size(1)) 
    delay_inst_load_w(.bus_in(load_w), .bus_out(load_w_out), .clk(clk));
    
    delay #(.data_size(1), .size(1)) 
    delay_inst_backprop_cost(.bus_in(backprop_cost), .bus_out(backprop_cost_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_x(.bus_in(x), .bus_out(x_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_label(.bus_in(label_in), .bus_out(label_out), .clk(clk));

endmodule