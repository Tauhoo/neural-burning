module activation(in_data, act, out_data);
    import gdo::gdo_linear;
    import gdo::gdo_binary;
    import gdo::gdo_sigmoid;
    import gdo::gdo_tanh;

    parameter data_size = 16;
    parameter size = 3;
    parameter activate_size = 4;

	input [data_size*size - 1:0] in_data;
    input [activate_size - 1:0] act;
    
    output  [data_size*size - 1:0] out_data;

    //activation type
    localparam LINEAR = 0;
    localparam BINARY = 1;
    localparam SIGMOID = 2;
    localparam TANH = 3;

    function [data_size - 1:0] activate_mux;
        input [data_size - 1:0] in_data;
        input [activate_size - 1:0] act_index;
        begin
            case (act_index)
                LINEAR: return gdo_linear(in_data); 
                BINARY: return gdo_binary(in_data);
                SIGMOID: return gdo_sigmoid(in_data);
                TANH: return gdo_tanh(in_data);
                default: return gdo_linear(in_data);
            endcase
        end
    endfunction

    genvar gen_index;
    generate
        for (gen_index = 0; gen_index < size; gen_index = gen_index + 1) begin : set_up_output
            assign out_data[(size - gen_index)*data_size - 1 -: data_size] = activate_mux(in_data[(size - gen_index)*data_size - 1 -: data_size], act); 
        end
    endgenerate

endmodule
