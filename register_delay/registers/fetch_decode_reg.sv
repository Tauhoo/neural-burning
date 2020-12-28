module fetch_decode_reg (
    code,
    code_index,
    code_out,
    code_index_out,
    clk,
    clk_out
);

    parameter code_size = 12;

    input [code_size - 1:0] code;
    input [31:0] code_index;
    input clk;

    output [code_size - 1:0] code_out;
    output [31:0] code_index_out;

    output clk_out;

    wire delay_inst_code_wire;
    wire delay_inst_code_index_wire;

    assign clk_out = delay_inst_code_wire & delay_inst_code_index_wire;

    delay #(.data_size(code_size), .size(1)) 
    delay_inst_code(.bus_in(code), .bus_out(code_out), .clk(clk), .clk_out(delay_inst_code_wire));

    delay #(.data_size(32), .size(1)) 
    delay_inst_code_index(.bus_in(code_index), .bus_out(code_index_out), .clk(clk), .clk_out(delay_inst_code_index_wire));

endmodule