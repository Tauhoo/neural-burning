module parse(
    code,
    op,
    act_type,
    dense_type,
    cost_type
);

    parameter op_size = 4;
	parameter param_a = 4;
    parameter param_b = 4;
    parameter param_c = param_a + param_b;

    localparam code_size = op_size + param_c;

    input [code_size - 1:0] code;
    
    output [op_size - 1:0] op;
    output [param_a - 1:0] act_type;
    output [param_b - 1:0] dense_type;
    output [param_c - 1:0] cost_type;

    assign op = code[code_size - 1 -:op_size];
    assign act_type = code[code_size - op - 1 -:param_a];
    assign dense_type = code[code_size - op - param_a - 1 -:param_b];
    assign cost_type = code[code_size - op - 1 -:param_c];

endmodule
