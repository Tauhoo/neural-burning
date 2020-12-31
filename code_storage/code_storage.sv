module code_storage(
    code, 
    code_index, 
    active, 
    reset,
    is_write,
    write_line,
    write_data,
    enable,
    clk
);
    parameter code_size = 12;
    parameter max_code_line = 100;

    input active;
    input reset;
    input enable;
    input clk;

    input is_write;
    input [31:0] write_line;
    input [code_size - 1:0] write_data;

    output [code_size - 1:0] code;
    output [31:0] code_index;

    reg [code_size - 1:0] storage [0:max_code_line];
    reg [31:0] code_line;

    assign code_index = enable ? 
                            reset ? 0 : 
                            active ? code_line + 1 :
                            code_line :
                            0;
    assign code = enable ? 
                    reset ? 0 :
                    is_write && write_line == code_index ? write_data : 
                    storage[code_index] :
                  0;

    initial begin
        for (code_line = 0; code_line < max_code_line; code_line = code_line + 1) begin
            storage[code_line] <= 0;
        end
        code_line <= 0;
    end

    always @(posedge clk) begin
        code_line <= code_index;

        if (is_write) begin
            storage[write_line] <= write_data;
        end
    end
endmodule
