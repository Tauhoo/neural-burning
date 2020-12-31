module parse(
    code,
    op,
    act_type,
    dense_type,
    cost_type
);

    parameter op_size = 4;
	parameter param_a_size = 4;
    parameter param_b_size = 4;

    input [param_a_size + param_b_size + op_size - 1:0] code;
    
    output [op_size - 1:0] op;
    output [param_a_size - 1:0] act_type;
    output [param_b_size - 1:0] dense_type;
    output [param_a_size + param_b_size - 1:0] cost_type;

    assign op = code[param_a_size + param_b_size + op_size - 1 -:op_size];
    assign act_type = code[param_a_size + param_b_size - 1 -:param_a_size];
    assign dense_type = code[param_b_size - 1 -:param_b_size];
    assign cost_type = code[param_a_size + param_b_size - 1 -:param_a_size + param_b_size];

endmodule
