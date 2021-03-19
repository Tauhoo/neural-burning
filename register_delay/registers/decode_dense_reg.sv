module decode_dense_reg (
    act_type,
    dense_type,
    cost_type, //parse code
    w, // single
    load_w,
    x, // single
    label_in, // single
    backprop_controll,
    learning_rate,

    act_type_out,
    dense_type_out,
    cost_type_out,
    w_out,
    load_w_out,
    x_out,
    label_out,
    backprop_controll_out,
    learning_rate_out,
    clk
);
    parameter size = 3;
    parameter data_size = 16;
    parameter cost_type_size = 8;
    parameter dense_type_size = 4;
    parameter learning_rate_size = 16;
    parameter act_type_size = 4;
    parameter backprop_controll_size = 1 + 1 + 32 + 32 ;

    input [act_type_size - 1:0] act_type;
    input [dense_type_size - 1:0] dense_type;
    input [cost_type_size - 1:0] cost_type;
    input [data_size*size - 1:0] w;
    input load_w;
    input [data_size*size - 1:0] x;
    input [data_size*size - 1:0] label_in;
    input [backprop_controll_size - 1:0] backprop_controll;
    input [learning_rate_size - 1:0] learning_rate;

    input clk;

    output [act_type_size - 1:0] act_type_out;
    output [dense_type_size - 1:0] dense_type_out;
    output [cost_type_size - 1:0] cost_type_out;
    output [data_size*size - 1:0] w_out;
    output load_w_out;
    output [data_size*size - 1:0] x_out;
    output [data_size*size - 1:0] label_out;
    output [backprop_controll_size - 1:0] backprop_controll_out;
    output [learning_rate_size - 1:0] learning_rate_out;

    delay #(.data_size(learning_rate_size), .size(1)) 
    delay_inst_learning_rate(.bus_in(learning_rate), .bus_out(learning_rate_out), .clk(clk));

    delay #(.data_size(act_type_size), .size(1)) 
    delay_inst_act_type(.bus_in(act_type), .bus_out(act_type_out), .clk(clk));
    
    delay #(.data_size(dense_type_size), .size(1)) 
    delay_inst_dense_type(.bus_in(dense_type), .bus_out(dense_type_out), .clk(clk));
    
    delay #(.data_size(cost_type_size), .size(1)) 
    delay_inst_cost_type(.bus_in(cost_type), .bus_out(cost_type_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_w(.bus_in(w), .bus_out(w_out), .clk(clk));
    
    delay #(.data_size(1), .size(1)) 
    delay_inst_load_w(.bus_in(load_w), .bus_out(load_w_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_x(.bus_in(x), .bus_out(x_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_label(.bus_in(label_in), .bus_out(label_out), .clk(clk));

    delay #(.data_size(backprop_controll_size), .size(1))
    delay_inst_backprop_controll(.bus_in(backprop_controll), .bus_out(backprop_controll_out), .clk(clk));

endmodule