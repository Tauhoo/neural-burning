module mult_matrix_prep(input_stream,
                        output_stream,
                        clk);
    
    parameter data_size = 4;
    parameter size      = 3;
    
    input [data_size*size - 1:0] input_stream;
    wire [data_size - 1:0] input_wire [0:size - 1];
    input clk;
    
    genvar gen_colum;
    
    generate
    for (gen_colum = 0; gen_colum < size; gen_colum = gen_colum + 1) begin : set_up_input
    assign input_wire[gen_colum] = input_stream[(size - gen_colum) * data_size - 1 -: data_size];
    end
    endgenerate
    
    output [data_size*size - 1:0] output_stream;
    
    reg [data_size - 1:0] buffer [0:size - 1][0:size - 1];
    
    genvar gen_row;
    generate
    for (gen_row = 1; gen_row < size; gen_row = gen_row + 1) begin : set_up_output
    assign output_stream[(size - gen_row)*data_size - 1 -: data_size] = buffer[gen_row][0];
    end
    endgenerate

    assign output_stream[size*data_size - 1 -: data_size] = input_wire[0];
    
    integer colum;
    integer row;
    
    initial begin
        for (row = 0; row < size; row = row + 1) begin
            for (colum = 0; colum < size; colum = colum + 1) begin
                buffer[colum][row] = 0;
            end
        end
    end
    
    always @(posedge clk) begin
        //set input
        for (row = 0; row < size; row = row + 1) begin
            buffer[row][row] = input_wire[row];
        end

        //update output
        for (row = 1; row < size; row = row + 1) begin
            for (colum = 0; colum < size; colum = colum + 1) begin
                buffer[colum][row - 1] = buffer[colum][row];
            end
        end
        
        for (colum = 0; colum < size; colum = colum + 1) begin
            buffer[colum][size - 1] = 0;
        end
    end
endmodule
