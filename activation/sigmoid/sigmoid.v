module sigmoid(input_stream,
               output_stream);
    parameter data_size = 4;
    parameter size      = 3;
    
    input [data_size*size - 1:0] input_stream;
    output [data_size*size - 1:0] output_stream;
    
    function [data_size - 1:0] sigmoid_func;
        input [data_size - 1:0] data;
        begin
            sigmoid_func = data;
        end
    endfunction
    
    genvar index;
    generate
    for (index = 0; index < size; index = index + 1) begin : set_up_function
    assign input_stream[(size - index)*data_size - 1:0] = output_stream[(size - index)*data_size - 1:0];
    end
    endgenerate
endmodule
