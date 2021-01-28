module parse(
    code,
    op,
    param_a,
    param_b,
    param_c,

    act_type,
    dense_type,
    cost_type,
    learning_rate
);

    parameter op_size = 4;
	parameter param_a_size = 4;
    parameter param_b_size = 4;
    parameter data_size = 16;

    input [param_a_size + param_b_size + op_size - 1:0] code;
    
    output [op_size - 1:0] op;
    output [param_a_size - 1:0] param_a;
    output [param_b_size - 1:0] param_b;
    output [param_a_size + param_b_size - 1:0] param_c;

    output [param_a_size - 1:0] act_type;
    output [param_b_size - 1:0] dense_type;
    output [param_a_size + param_b_size - 1:0] cost_type;
    output [data_size - 1:0] learning_rate;

    assign op = code[param_a_size + param_b_size + op_size - 1 -:op_size];
    assign param_a = code[param_a_size + param_b_size - 1 -:param_a_size];
    assign param_b = code[param_b_size - 1 -:param_b_size];
    assign param_c = code[param_a_size + param_b_size - 1 -:param_a_size + param_b_size];

    assign act_type = param_a;
    assign dense_type = param_b;
    assign cost_type = param_c;
    assign learning_rate = {{(data_size - (param_a_size + param_b_size)){1'b0}}, param_c};

endmodule
