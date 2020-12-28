module parse(
    code,
    op,
    act_type,
    dense_type,
    cost_type,
    clk
);

    parameter op_size = 4;
	parameter param_a_size = 4;
    parameter param_b_size = 4;

    input [param_a_size + param_b_size + op_size - 1:0] code;
    input clk;
    
    output [op_size - 1:0] op;
    output [param_a_size - 1:0] act_type;
    output [param_b_size - 1:0] dense_type;
    output [param_a_size + param_b_size - 1:0] cost_type;

    reg [op_size - 1:0] op_reg;
    reg [param_a_size - 1:0] act_type_reg;
    reg [param_b_size - 1:0] dense_type_reg;
    reg [param_a_size + param_b_size - 1:0] cost_type_reg;

    assign op = op_reg;
    assign act_type = act_type_reg;
    assign dense_type = dense_type_reg;
    assign cost_type = cost_type_reg;

    always @(posedge clk) begin
        op_reg = code[param_a_size + param_b_size + op_size - 1 -:op_size];
        act_type_reg = code[param_a_size + param_b_size - 1 -:param_a_size];
        dense_type_reg = code[param_b_size - 1 -:param_b_size];
        cost_type_reg = code[param_a_size + param_b_size - 1 -:param_a_size + param_b_size];
    end
endmodule
