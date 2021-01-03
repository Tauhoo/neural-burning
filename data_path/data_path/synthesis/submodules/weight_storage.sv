module weight_storage (
    layer_index, row_index, 
    dc_dw, is_update, 
    w_layer_index, 
    w_row_index, 
    is_read, 
    write_layer_index, 
    write_row_index, 
    write_data,
    is_write,
    w, 
    clk);
    parameter data_size = 16;
    parameter size = 3;
    parameter layer_size = 5;

    import gdo::gdo_sub;

    input [31:0] layer_index;
    input [31:0] row_index;
    input is_update; 
    input [data_size*size - 1:0] dc_dw;
    
    input [31:0] w_layer_index;
    input [31:0] w_row_index;
    input is_read;

    input [31:0] write_layer_index;
    input [31:0] write_row_index; 
    input [data_size*size - 1:0] write_data;
    input is_write;
    
    output [data_size*size - 1:0] w;
    input clk;

    reg signed [data_size - 1:0] storage [size - 1:0][size - 1:0][layer_size - 1:0];

    integer index;
    integer layer_index_reg;
    integer row;
    integer colum;


    genvar gen_index;

    generate
        for (gen_index = 0; gen_index < size; gen_index = gen_index + 1) begin : set_output
            assign w[(size - gen_index)*data_size - 1 -: data_size] = is_read ? storage[gen_index][w_row_index][w_layer_index] : 16'b0;
        end
    endgenerate

    initial begin
        for (layer_index_reg = 0; layer_index_reg < size; layer_index_reg = layer_index_reg + 1) begin
            for (row = 0; row < size; row = row + 1) begin
                for (colum = 0; colum < size; colum = colum + 1) begin
                    storage[colum][row][layer_index_reg] = 0;
                end
            end
        end
    end

    always @(negedge clk) begin
        //wrtie
        if (is_write) begin
            for (index = 0; index < size; index = index + 1) begin
                storage[index][write_row_index][write_layer_index] = write_data[(size - index)*data_size - 1 -: data_size];
            end
        end

        //update weight
        if (is_update) begin
            for (index = 0; index < size; index = index + 1) begin
                storage[index][row_index][layer_index_reg] = gdo_sub(storage[index][row_index][layer_index_reg], dc_dw[(size - index)*data_size - 1 -: data_size]);
            end
        end
        
    end
endmodule
