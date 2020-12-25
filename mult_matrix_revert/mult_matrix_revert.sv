module mult_matrix_revert(input_stream,
                          output_stream,
                          clk);
    
    parameter data_size = 4;
    parameter size      = 3;
    
    input clk;
    input [data_size*size - 1:0] input_stream;
    output [data_size*size - 1:0] output_stream;
    
    reg [data_size - 1:0] buffer [size - 1:0][size - 1:0];
    
    integer row;
    integer colum;
    
    genvar gen_row;
    
    generate
    for (gen_row = 0; gen_row < size; gen_row = gen_row + 1) begin : set_up_output
    assign output_stream[(size - gen_row)*data_size - 1 -: data_size] = buffer[size - 1][gen_row];
    end
    endgenerate
    
    initial begin
        for (row = 0; row < size; row = row + 1) begin
            for (colum = 0; colum < size; colum = colum + 1) begin
                buffer[colum][row] = 0;
            end
        end
    end
    
    always @(posedge clk) begin
        //update buffer
        for (row = 0; row < size; row = row + 1) begin
            for (colum = size - 1; colum > 0; colum = colum - 1) begin
                buffer[colum][row] = buffer[colum - 1][row];
            end
        end
        
        //update input
        for (row = 0; row < size; row = row + 1) begin
            buffer[row][row] = input_stream[(size - row)*data_size - 1 -: data_size];
        end
    end
    
endmodule
