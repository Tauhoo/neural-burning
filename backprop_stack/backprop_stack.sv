module backprop_stack(backprop_dense,
                      backprop_to_all,
                      backprop_start,
                      clk,
                      reset,
                      current_layer_index,
                      dc_dw_layer_index,
                      copy,
                      cal_dy_dy_old,
                      dc_dw_stream);
    
    parameter data_size      = 8;
    parameter size           = 3;
    parameter max_layer_size = 4;
    
    import gdo::gdo_add;
    import gdo::gdo_mult;
	import gdo::gdo_size;

    input clk;
    input reset;
    input copy;
    input cal_dy_dy_old;
    input [32:0] current_layer_index;
    input [32:0] dc_dw_layer_index;
    
    input [data_size*size - 1:0] backprop_dense;
    wire signed [data_size - 1:0] backprop_dense_wire [0:size - 1];
    
    input [data_size*size - 1:0] backprop_to_all;
    wire signed [data_size - 1:0] backprop_to_all_wire [0:size - 1];
    
    input [data_size*size - 1:0] backprop_start;
    wire signed [data_size - 1:0] backprop_start_wire [0:size - 1];
    
    output [data_size*size - 1:0] dc_dw_stream;
    
    genvar gen_index;
    
    reg signed [data_size - 1:0] dy_dw [0:size - 1][0:size - 1][0:max_layer_size - 1];
    reg signed [data_size - 1:0] dy_dy_old [0:size - 1][0:size - 1][0:max_layer_size - 1];
    reg signed [data_size - 1:0] dy_dy_dense [0:size - 1][0:size - 1];
    reg signed [data_size - 1:0] dc_dw [0:size - 1];
    reg signed [data_size - 1:0] copy_dy_dw [0:size - 1][0:size - 1];
    
    generate
    for (gen_index = 0; gen_index < size; gen_index = gen_index + 1) begin : set_tp_wire
    assign backprop_start_wire[gen_index]                              = backprop_start[(size - gen_index)*data_size - 1 -: data_size];
    assign backprop_to_all_wire[gen_index]                             = backprop_to_all[(size - gen_index)*data_size - 1 -: data_size];
    assign backprop_dense_wire[gen_index]                              = backprop_dense[(size - gen_index)*data_size - 1 -: data_size];
    assign dc_dw_stream[(size - gen_index)*data_size - 1 -: data_size] = dc_dw[gen_index];
    end
    endgenerate
    
    //temp variable
    integer colum;
    integer row;
    integer index;
    integer layer_index;
    reg signed [data_size - 1:0] temp_matrix [0:size - 1][0:size - 1];
    
    initial begin
        for (layer_index = 0; layer_index < max_layer_size; layer_index = layer_index + 1) begin
            for (row = 0; row < size; row = row + 1) begin
                for (colum = 0; colum < size; colum = colum + 1) begin
                    dy_dw[colum][row][layer_index]     = 0;
                    dy_dy_old[colum][row][layer_index] = 0;
                end
            end
        end
        
        for (row = 0; row < size; row = row + 1) begin
            for (colum = 0; colum < size; colum = colum + 1) begin
                dy_dy_dense[colum][row] = 0;
                temp_matrix[colum][row] = 0;
                copy_dy_dw[colum][row]  = 0;
            end
        end
        
        for (colum = 0; colum < size; colum = colum + 1) begin
            dc_dw[colum] = 0;
        end
    end
    
    always @(posedge clk) begin
        $write(" ==  ==  ==  ==  ==  ==  == \n");
        //copy
        if (copy) begin
            for (row = 0; row < size; row = row + 1) begin
                for (colum = 0; colum < size; colum = colum + 1) begin
                    copy_dy_dw[colum][row] = dy_dw[colum][row][current_layer_index];
                end
            end
        end
        
        //reset
        if (reset) begin
            for (row = 0; row < size; row = row + 1) begin
                for (colum = 0; colum < size; colum = colum + 1) begin
                    dy_dw[colum][row][current_layer_index] = 0;
                end
            end
        end
        
        //update cost dy_old_dw * dy_dy_old
        for (row = 0; row < size; row = row + 1) begin
            dc_dw[row] = 0;
            for (colum = 0; colum < size; colum = colum + 1) begin
                dc_dw[row] = gdo_add(dc_dw[row], gdo_mult(copy_dy_dw[colum][dc_dw_layer_index], dy_dy_old[row][colum][current_layer_index + 1]));
            end
        end
        
        //update dy_dw
        for (colum = 0; colum < size; colum = colum + 1) begin
            for (row = 0; row < size; row = row + 1) begin
                dy_dw[colum][row][current_layer_index] = gdo_add(dy_dw[colum][row][current_layer_index], backprop_start_wire[row]);
            end
        end
        
        //update dy_dy_old and dy_dy_dense
        for (row = 1; row < size; row = row + 1) begin
            for (colum = 0; colum < size; colum = colum + 1) begin
                dy_dy_old[colum][row - 1][current_layer_index] = dy_dy_old[colum][row][current_layer_index];
                dy_dy_dense[colum][row - 1]                    = dy_dy_dense[colum][row];
            end
        end
        
        for (colum = 0; colum < size; colum = colum + 1) begin
            dy_dy_old[colum][size - 1][current_layer_index] = backprop_to_all_wire[colum];
            dy_dy_dense[colum][size - 1]                    = backprop_dense_wire[colum];
        end
        
        //update to all layer backpropagate
        if (cal_dy_dy_old) begin
            for (layer_index = 0; layer_index < max_layer_size; layer_index = layer_index + 1) begin
                if (layer_index < current_layer_index) begin
                    //update
                    for (row = 0; row < size; row = row + 1) begin
                        for (colum = 0; colum < size; colum = colum + 1) begin
                            for (index = 0; index < size; index = index + 1) begin
                                temp_matrix[colum][row] = gdo_add(temp_matrix[colum][row], gdo_mult(dy_dy_old[index][row][layer_index], dy_dy_dense[colum][index]));
                            end
                        end
                    end
                    
                    for (row = 0; row < size; row = row + 1) begin
                        for (colum = 0; colum < size; colum = colum + 1) begin
                            dy_dy_old[colum][row][layer_index] = temp_matrix[colum][row];
                            temp_matrix[colum][row]            = 0;
                        end
                    end
                end
            end
        end
        
        for (layer_index = 0; layer_index < max_layer_size; layer_index = layer_index + 1) begin
            $write("layer : %d\n", layer_index);
            for (row = 0; row < size; row = row + 1) begin
                for (colum = 0; colum < size; colum = colum + 1) begin
                    $write("%f ",  dy_dw[colum][row][layer_index] * 2.0**(-1.0*gdo_size));
                end
                $write("| ");
                for (colum = 0; colum < size; colum = colum + 1) begin
                    $write("%f ",  dy_dy_old[colum][row][layer_index] * 2.0**(-1.0*gdo_size));
                end
                $write("| ");
                for (colum = 0; colum < size; colum = colum + 1) begin
                    $write("%f ", copy_dy_dw[colum][row] * 2.0**(-1.0*gdo_size));
                end
                $write("\n");
            end
        end
    end
endmodule
