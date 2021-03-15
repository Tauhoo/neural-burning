module diff_to_all (
    x,
    diff,
    act_type
);
    import gdo::gdo_diff_linear;
    import gdo::gdo_diff_binary;
    import gdo::gdo_diff_sigmoid;
    import gdo::gdo_diff_tanh;

    parameter size = 3;
	parameter data_size = 16;
    parameter act_type_size = 4;

    input [size*data_size - 1:0] x;
    input [act_type_size - 1:0] act_type;
    output [size*data_size - 1:0] diff;

    //activation type
    localparam LINEAR = 0;
    localparam BINARY = 1;
    localparam SIGMOID = 2;
    localparam TANH = 3;

    function [data_size - 1:0] activate_mux;
        input [data_size - 1:0] in_data;
        input [act_type_size - 1:0] act_index;
        begin
            case (act_index)
                LINEAR: return gdo_diff_linear(in_data); 
                BINARY: return gdo_diff_binary(in_data);
                SIGMOID: return gdo_diff_sigmoid(in_data);
                TANH: return gdo_diff_tanh(in_data);
                default: return gdo_diff_linear(in_data);
            endcase
        end
    endfunction

    genvar gen_index;
    generate
        for (gen_index = 0; gen_index < size; gen_index = gen_index + 1) begin : set_up_output
            assign diff[(size - gen_index)*data_size - 1 -: data_size] = activate_mux(x[(size - gen_index)*data_size - 1 -: data_size], act_type); 
        end
    endgenerate
endmodule