module fetch_decode_reg (
    code,
    code_index,
    reset_code_count,
    code_out,
    code_index_out,
    reset_code_count_out,
    clk
);

    parameter code_size = 12;

    input [code_size - 1:0] code;
    input [31:0] code_index;
    input reset_code_count;
    input clk;

    output [code_size - 1:0] code_out;
    output [31:0] code_index_out;
    output reset_code_count_out;

    delay #(.data_size(code_size), .size(1)) 
    delay_inst_code(.bus_in(code), .bus_out(code_out), .clk(clk));

    delay #(.data_size(32), .size(1)) 
    delay_inst_code_index(.bus_in(code_index), .bus_out(code_index_out), .clk(clk));

    delay #(.data_size(1), .size(1)) 
    delay_inst_reset_code_count(.bus_in(reset_code_count), .bus_out(reset_code_count_out), .clk(clk));

endmodule