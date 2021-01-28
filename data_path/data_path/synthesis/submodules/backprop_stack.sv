module backprop_stack(backprop_dense,
                      backprop_to_all,
                      backprop_start,
                      backprop_cost,
                      update_storage,

                      current_layer,

                      update_dy_dy_old,

                      cal_dc_dw,
                      dc_dw_layer,
                      dc_dw_row,

                      dc_dw_stream,

                      clk,
                      reset);
                      
                    //   current_layer,
                    //   dc_dw_layer,
                    //   dc_dw_row,

                    //   update_storage,
                    //   update_dy_dy_old,
                    //   cal_dc_dw,
                    //   reset

    parameter data_size      = 16;
    parameter size           = 3;
    parameter max_layer_size = 4;
    
    import gdo::gdo_add;
    import gdo::gdo_mult;
	import gdo::gdo_size;

    input [data_size*size - 1:0] backprop_dense;
    wire signed [data_size - 1:0] backprop_dense_wire [0:size - 1];
    
    input [data_size*size - 1:0] backprop_to_all;
    wire signed [data_size - 1:0] backprop_to_all_wire [0:size - 1];
    
    input [data_size*size - 1:0] backprop_start;
    wire signed [data_size - 1:0] backprop_start_wire [0:size - 1];

    input [data_size*size - 1:0] backprop_cost;
    wire signed [data_size - 1:0] backprop_cost_wire [0:size - 1];

    input clk;
    input reset;
    input update_storage;
    input [31:0] current_layer;
    input update_dy_dy_old;

    input cal_dc_dw;
    input [31:0] dc_dw_layer;
    input [31:0] dc_dw_row;
    
    output [data_size*size - 1:0] dc_dw_stream;
    
    reg signed [data_size - 1:0] dc_dw [0:size - 1];
    
    genvar gen_index;
    generate
    for (gen_index = 0; gen_index < size; gen_index = gen_index + 1) begin : set_tp_wire
    assign backprop_start_wire[gen_index]                              = backprop_start[(size - gen_index)*data_size - 1 -: data_size];
    assign backprop_to_all_wire[gen_index]                             = backprop_to_all[(size - gen_index)*data_size - 1 -: data_size];
    assign backprop_dense_wire[gen_index]                              = backprop_dense[(size - gen_index)*data_size - 1 -: data_size];
    assign backprop_cost_wire[gen_index]                              = backprop_cost[(size - gen_index)*data_size - 1 -: data_size];
    assign dc_dw_stream[(size - gen_index)*data_size - 1 -: data_size] = dc_dw[gen_index];
    end
    endgenerate
    
    reg signed [data_size - 1:0] start_storage [size - 1:0][size - 1:0][max_layer_size - 1:0];
    reg signed [data_size - 1:0] to_all_storage [size - 1:0][size - 1:0][max_layer_size - 1:0];

    reg signed [data_size - 1:0] dense_storage [size - 1:0][size - 1:0];
    reg signed [data_size - 1:0] cost_storage [size - 1:0][size - 1:0];

    reg signed [data_size - 1:0] temp_data;
    reg signed [data_size - 1:0] temp_data_bus [size - 1:0];
    reg [31:0] lastest_layer;
    reg [31:0] temp_lastest_layer;
    reg contain_x_or_z;

    initial begin
        for (int row = 0; row < size; row = row + 1) begin
            for (int colum = 0; colum < size; colum = colum + 1) begin
                   for (int layer = 0; layer < max_layer_size; layer = layer + 1) begin
                        start_storage[colum][row][layer] = 0;
                        to_all_storage[colum][row][layer] = 0;
                   end
                   dense_storage[colum][row] = 0;
                   cost_storage[colum][row] = 0;
            end
        end
        temp_data = 0;
        for (int colum = 0; colum < size; colum = colum + 1) begin
            dc_dw[colum] = 0;
            temp_data_bus[colum] = 0;
        end
        lastest_layer = 0;
        contain_x_or_z = 0;
    end

    always @(posedge clk) begin
        temp_lastest_layer = lastest_layer < current_layer && update_storage ? current_layer : lastest_layer;

        contain_x_or_z = 0;
        for (int index = 0; index < 32; index = index + 1) begin
            if (temp_lastest_layer[index] === 1'bx || temp_lastest_layer[index] === 1'bz) begin
                contain_x_or_z = 1;
            end
        end


        if (~contain_x_or_z) begin
            $write("lastest_layer: %d, current_layer: %d, update_storage: %d, temp_lastest_layer: %b \n\n", lastest_layer, current_layer, update_storage, temp_lastest_layer);
            lastest_layer = temp_lastest_layer;
        end
        
        if (update_storage) begin
            for (int row = 0; row < size - 1; row = row + 1) begin
                for (int colum = 0; colum < size; colum = colum + 1) begin                
                    start_storage[colum][row][current_layer] = start_storage[colum][row + 1][current_layer];
                    to_all_storage[colum][row][current_layer] = to_all_storage[colum][row + 1][current_layer];

                    dense_storage[colum][row] = dense_storage[colum][row + 1];
                    cost_storage[colum][row] = cost_storage[colum][row + 1];
                end
            end

            for (int colum = 0; colum < size; colum = colum + 1) begin
                start_storage[colum][size - 1][current_layer] = backprop_start_wire[colum];
                to_all_storage[colum][size - 1][current_layer] = backprop_to_all_wire[colum];

                dense_storage[colum][size - 1] = backprop_dense_wire[colum];
                cost_storage[colum][size - 1] = backprop_cost_wire[colum];
            end
        end

        if (update_dy_dy_old) begin
            for (int layer_index = 1; layer_index < max_layer_size; layer_index = layer_index + 1) begin
                if (layer_index < current_layer) begin
                    for (int row = 0; row < size; row = row + 1) begin
                        for (int colum = 0; colum < size; colum = colum + 1) begin
                            temp_data = 0;
                            for (int index = 0; index  < size; index = index + 1) begin
                                temp_data = gdo_add(temp_data, gdo_mult(to_all_storage[colum][row][layer_index], dense_storage[colum][row]));
                            end
                            to_all_storage[colum][row][layer_index] = temp_data;
                        end
                    end
                end
            end
        end

        for (int colum = 0; colum < size; colum = colum + 1) begin
            dc_dw[colum] = 0;
        end
        if (cal_dc_dw) begin
            for (int colum = 0; colum < size; colum = colum + 1) begin
                temp_data_bus[colum] = 0;
            end
            if (lastest_layer == dc_dw_layer) begin
                for (int data_set = 0; data_set < size; data_set = data_set + 1) begin
                    for (int colum = 0; colum < size; colum = colum + 1) begin
                        temp_data_bus[colum] = gdo_add(temp_data_bus[colum], gdo_mult(cost_storage[colum][data_set], start_storage[dc_dw_row][data_set][dc_dw_layer]));
                    end
                end
            end else begin
                for (int data_set = 0; data_set < size; data_set = data_set + 1) begin
                    temp_data = 0;
                    for (int colum = 0; colum < size; colum = colum + 1) begin
                        temp_data = gdo_add(temp_data, gdo_mult(cost_storage[colum][data_set], to_all_storage[colum][dc_dw_row][dc_dw_layer + 1]));
                    end
                    
                    for (int colum = 0; colum < size; colum = colum + 1) begin
                        temp_data_bus[colum] = gdo_add(temp_data_bus[colum], gdo_mult(temp_data, start_storage[dc_dw_row][data_set][dc_dw_layer]));
                    end
                end
            end
            for (int colum = 0; colum < size; colum = colum + 1) begin
                dc_dw[colum] = temp_data_bus[colum];
            end
        end

        if (reset) begin
            for (int row = 0; row < size; row = row + 1) begin
            for (int colum = 0; colum < size; colum = colum + 1) begin
                   for (int layer = 0; layer < max_layer_size; layer = layer + 1) begin
                        start_storage[colum][row][layer] = 0;
                        to_all_storage[colum][row][layer] = 0;
                   end
                   dense_storage[colum][row] = 0;
                   cost_storage[colum][row] = 0;
                end
            end
            temp_data = 0;
            for (int colum = 0; colum < size; colum = colum + 1) begin
                dc_dw[colum] = 0;
                temp_data_bus[colum] = 0;
            end
            lastest_layer = 0;
        end
        
        for (int layer = 0; layer < size; layer = layer + 1) begin
            $write("layer: %d, lastest_layer: %d\n", layer, lastest_layer);
            for (int row = 0; row < size; row = row + 1) begin
                for (int colum = 0; colum < size; colum = colum + 1) begin
                    $write("%d ", start_storage[colum][row][layer]);
                end
                $write("| ");
                for (int colum = 0; colum < size; colum = colum + 1) begin
                    $write("%d ", to_all_storage[colum][row][layer]);
                end
                $write("| ");
                for (int colum = 0; colum < size; colum = colum + 1) begin
                    $write("%d ", dense_storage[colum][row]);
                end
                $write("| ");
                for (int colum = 0; colum < size; colum = colum + 1) begin
                    $write("%d ", cost_storage[colum][row]);
                end
                $write("\n");
            end
        end
    end
endmodule
