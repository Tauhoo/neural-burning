module code_storage(
    code, 
    code_index, 
    active, 
    reset,
    is_write,
    write_line,
    write_data,
    clk
);
    parameter code_size = 12;
    parameter max_code_line = 100;

    input active;
    input reset;
    input clk;

    input is_write;
    input [31:0] write_line;
    input [code_size - 1:0] write_data;

    output [code_size - 1:0] code;
    output [31:0] code_index;

    reg [code_size - 1:0] storage [0:max_code_line];
    reg [31:0] code_line;

    assign code = storage[code_line];
    assign code_index = code_line;

    initial begin
        for (code_line = 0; code_line < max_code_line; code_line = code_line + 1) begin
            storage[code_line] <= 0;
        end
        code_line <= 0;
    end

    always @(posedge clk) begin
        if (reset) begin
            code_line <= 0;
        end else if (active) begin
            code_line <= code_line + 1;
        end

        if (is_write) begin
            storage[write_line] <= write_data;
        end
    end
endmodule
