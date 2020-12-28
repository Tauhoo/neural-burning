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
    reg [data_size*size - 1:0] w_reg;

    integer index;
    integer layer_index;
    integer row;
    integer colum;

    assign w = w_reg;

    initial begin
        for (layer_index = 0; layer_index < size; layer_index = layer_index - 1) begin
            for (row = 0; row < size; row = row + 1) begin
                for (colum = 0; colum < size; colum = colum + 1) begin
                    storage[colum][row][layer_index] = 0;
                end
            end
        end

        for (row = 0; row < size; row = row + 1) begin
            for (colum = 0; colum < size; colum = colum + 1) begin
                w_reg[colum][row] = 0;
            end
        end
        
    end

    always @(posedge clk) begin
        //wrtie
        if (is_write) begin
            for (index = 0; index < size; index = index + 1) begin
                storage[index][write_row_index][write_layer_index] = write_data[(size - index)*data_size - 1 -: data_size];
            end
        end

        //update weight
        if (is_update) begin
            for (index = 0; index < size; index = index + 1) begin
                storage[index][row_index][layer_index] = gdo_sub(storage[index][row_index][layer_index], dc_dw[(size - index)*data_size - 1 -: data_size]);
            end
        end
        
        //update
        if (is_read) begin
            for (index = 0; index < size; index = index + 1) begin 
                w_reg[(size - index)*data_size - 1 -: data_size] = storage[index][w_row_index][w_layer_index];
            end
        end else begin
            for (index = 0; index < size; index = index + 1) begin 
                w_reg[(size - index)*data_size - 1 -: data_size] = 0;
            end
        end
    end
endmodule
