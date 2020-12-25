module fetch_layer(
    stop,
    clk,
    reset,
    instruction
    );

    parameter max_code_line = 10;
    parameter max_batch_size = 3;
    parameter instruction_size = 12;

    input stop;
    input clk;
    input reset;
    output [instruction_size - 1:0] instruction;

    integer line; 

    reg [instruction_size - 1:0] code_mem [0:max_code_line - 1];
    reg [instruction_size - 1:0] instruction_reg;

    assign instruction = instruction_reg;

    initial begin
        code_mem[0] = 12'b000100000000;
        code_mem[1] = 12'b000100000000;
        code_mem[2] = 12'b001000000000;
        line = 0;
    end

    always @(posedge clk) begin
        if (reset) begin
            line = 0;
        end

        if (!stop) begin
            instruction_reg = code_mem[line];
            line = line + 1;
        end
    end

endmodule
