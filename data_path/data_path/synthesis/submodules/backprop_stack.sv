module backprop_stack(
    start_new_layer,
    current_input_layer,
    current_input_row,
    is_last_layer,
    read_update_data,
    active_train,
    learning_rate,

    diff_start,
    diff_act,
    diff_dense,
    diff_cost,

    is_update_weight,
    update_weight_layer,
    update_weight_row,
    update_weight_value,

    clk);
    parameter data_size      = 16;
    parameter size           = 3;
    parameter max_layer_size = 4;
    parameter learning_rate_size = 16;

    import gdo::gdo_add;
    import gdo::gdo_mult;
	import gdo::gdo_size;

    input start_new_layer;
    input [31:0] current_input_layer;
    input [31:0] current_input_row;
    input is_last_layer;
    input read_update_data;
    input active_train;
    input [learning_rate_size - 1:0] learning_rate;

    input [size*data_size - 1:0] diff_start;
    input [size*data_size - 1:0] diff_act;
    input [size*data_size - 1:0] diff_dense;
    input [size*data_size - 1:0] diff_cost;

    input clk;

    output [31:0] update_weight_layer;
    output [31:0] update_weight_row;
    output is_update_weight;
    output [size*data_size - 1:0] update_weight_value;

    //=========================== store diff cost =========================================//
    reg [data_size*size - 1:0] diff_cost_store[size - 1:0];
    initial begin
        for (int i = 0; i < size; i = i + 1) begin
            diff_cost_store[i] = 0;
        end
    end
    always @(posedge clk) begin
        if (is_last_layer) begin
            diff_cost_store[current_input_row] <= diff_cost;
        end
    end

    //========================= set up address and replace pattern ==============================================//
    wire [31:0] address;
    reg [31:0] address_count_reg;
    wire [size - 1:0] replace_pattern;

    assign address = read_update_data ? (address_count_reg / size) : 0;
    assign replace_pattern = read_update_data ? ({1'b0 ,{(size - 1){1'b1}}} >> (address_count_reg % size)) : {size{1'b1}};

    initial begin
        address_count_reg = 0;
    end

    always @(posedge clk ) begin
        if (read_update_data) begin
            address_count_reg <= address_count_reg + 1;
        end else begin
            address_count_reg <= 0;
        end
    end

    //=========================== set up one_address and systolic_array_current_layer =========================//
    wire [size - 1:0] one_address;
    wire [size*2 - 1:0] one_address_start_pattern;
    reg [31:0] systolic_array_current_layer_reg;
    wire [31:0] systolic_array_current_layer;
    assign one_address_start_pattern = {{size{1'b1}}, {size{1'b0}}} >> (systolic_array_current_layer_reg % (size << 1));
    assign systolic_array_current_layer = (active_train ? systolic_array_current_layer_reg : 0)/(size << 1);
    assign one_address = active_train ? one_address_start_pattern[size - 1:0] : 0;

    initial begin
        systolic_array_current_layer_reg = 0;
    end

    always @(posedge clk ) begin
        if (active_train) begin
            systolic_array_current_layer_reg <= systolic_array_current_layer_reg + 1;
        end else begin
             systolic_array_current_layer_reg <= 0;
        end
    end

    //=========================== set up z_to_z_calculator =================================//
    reg [size*data_size - 1:0] z_to_z_diff_dense[size - 2:0];
    reg [size*data_size - 1:0] z_to_z_diff_cost[size - 2:0];
    reg z_to_z_start_new_layer[size - 2:0];
    reg [31:0] z_to_z_current_row[size - 2:0];

    initial begin
        for (int i = 0; i < size - 1; i = i + 1) begin
            z_to_z_diff_dense[i] = 0;
            z_to_z_diff_cost[i] = 0;
            z_to_z_start_new_layer[i] = 0;
            z_to_z_current_row[i] = 0;
        end
    end

    wire [size*data_size - 1:0] z_to_z_diff_z_to_z[size - 1:0];

    genvar z_to_z_gen_index;
    generate
        for (z_to_z_gen_index = 0; z_to_z_gen_index < size; z_to_z_gen_index = z_to_z_gen_index + 1) begin : set_up_z_to_z_calculator
            z_to_z_calculator #(
                .data_size(data_size),
                .size(size)
            )
            z_to_z_calculator_inst(
                .diff_act(diff_act),
                .diff_dense(z_to_z_gen_index == 0 ? diff_dense : z_to_z_diff_dense[z_to_z_gen_index - 1]),
                .diff_cost(z_to_z_gen_index == 0 ? diff_cost : z_to_z_diff_cost[z_to_z_gen_index - 1]),
                .set_diff_act(current_input_row == z_to_z_gen_index ? 1'b1 : 1'b0),
                .diff_z_to_z(z_to_z_diff_z_to_z[z_to_z_gen_index]),
                .start_new_layer(z_to_z_gen_index == 0 ? start_new_layer : z_to_z_start_new_layer[z_to_z_gen_index - 1]),

                .clk(clk)
            );
        end
    endgenerate

    always @(posedge clk) begin
        z_to_z_diff_dense[0] <= diff_dense;
        z_to_z_diff_cost[0] <= diff_cost;
        for (int i = 1; i < size - 1; i = i + 1) begin
            z_to_z_diff_dense[i] <= z_to_z_diff_dense[i - 1];
            z_to_z_diff_cost[i] <= z_to_z_diff_cost[i - 1];
            z_to_z_start_new_layer[i] <= z_to_z_start_new_layer[i - 1];
        end
    end
    //=========================== set up systolic_array_to_z_to_z_out ===================================//
    // systolic_array_current_layer = 32
    // address                      = 32
    // replace_pattern              = 3
    // start_new_layer              = 1 
    // one_address                  = 3
 
    localparam systolic_array_to_z_to_z_size = 32 + 32 + 3 + 1 + 3;
    wire [systolic_array_to_z_to_z_size - 1:0] systolic_array_to_z_to_z_out;
    assign systolic_array_to_z_to_z_out = { systolic_array_current_layer, address, replace_pattern, start_new_layer, one_address };

    //=========================== set up systolic_array_to_store_single_out ===================================//
    // load                 => read_update_data
    // load_address         => addr(read_update_data)
    // load_row             => row(read_update_data)
    // load_data_set        => gen()
    // reset_counter        => reset(read_update_data)

    // store                => !read_update_data && active_train
    // store_address        => current_layer
    // store_row            => current_row
    // store_start_data     => diff_start
    // store_act_data       => diff_act
    //
    // read_update_data     = 1
    // active_train         = 1
    // current_layer        = 32
    // current_row          = 32
    // diff_start           = data_size*size
    // diff_act             = data_size*size

    localparam systolic_array_to_z_to_z_single_out_size = 1 + 1 + 32 + 32;
    wire [systolic_array_to_z_to_z_single_out_size - 1:0] systolic_array_to_z_to_z_single_out;
    // assign systolic_array_to_z_to_z_single_out = {
    //         read_update_data,
    //         active_train,
    //         current_input_layer,
    //         current_input_row
    //      };

    delay #(.data_size(systolic_array_to_z_to_z_single_out_size), .size(1), .cycle(size)) 
    delay_inst_to_store_single(
        .bus_in({
            read_update_data,
            active_train,
            current_input_layer,
            current_input_row
        }), 
        .bus_out(systolic_array_to_z_to_z_single_out), 
        .clk(clk)
    );

    wire [data_size*size - 1:0] systolic_array_to_z_to_z_single_diff_start_row[size - 1:0];
    wire [data_size*size - 1:0] systolic_array_to_z_to_z_single_diff_act_row[size - 1:0];

    reg [data_size*size - 1:0] systolic_array_to_z_to_z_single_diff_act_start_reg[size - 2:0];
    reg [data_size*size - 1:0] systolic_array_to_z_to_z_single_diff_act_start_present_reg[size - 1:0];

    initial begin
        for (int i = 0; i < size - 1; i = i + 1) begin
            systolic_array_to_z_to_z_single_diff_act_start_reg[i] = 0;
            systolic_array_to_z_to_z_single_diff_act_start_present_reg[i] = 0;
        end
        systolic_array_to_z_to_z_single_diff_act_start_present_reg[size - 1] = 0;
    end

    always @(posedge clk ) begin
        if (current_input_row == size - 1) begin
            for (int i = 0; i < size - 1; i = i + 1) begin
                systolic_array_to_z_to_z_single_diff_act_start_present_reg[i] <=  systolic_array_to_z_to_z_single_diff_act_start_reg[i];
            end
            systolic_array_to_z_to_z_single_diff_act_start_present_reg[size - 1] <= diff_act;
        end else begin
            systolic_array_to_z_to_z_single_diff_act_start_reg[current_input_row] <= diff_act;
        end
    end

    wire [data_size*size - 1:0] transformed_diff_start;
    transformer #(.size(size), .data_size(data_size))
    transformer_cost_inst(
        .data(diff_start),
        .transformed_data(transformed_diff_start),
        .reset_counter(current_input_row == 0 ? 1'b1 : 1'b0),
        .clk(clk)
    );

    wire [data_size*size - 1:0] transformed_diff_start_plain;
    mult_matrix_revert #(.data_size(data_size), .size(size))
    mult_transformed_diff_start_revert_inst( 
       .input_stream(transformed_diff_start),
        .output_stream(transformed_diff_start_plain),
        .clk(clk)
    ); 

    genvar systolic_array_to_z_to_z_single_index;
    generate
        for(systolic_array_to_z_to_z_single_index = 0; systolic_array_to_z_to_z_single_index < size; systolic_array_to_z_to_z_single_index = systolic_array_to_z_to_z_single_index + 1) begin : set_up_systolic_array_to_z_to_z_single_diff
            // assign systolic_array_to_z_to_z_single_diff_start_row[systolic_array_to_z_to_z_single_index] = {size{ diff_start[data_size*(size - systolic_array_to_z_to_z_single_index) - 1 -: data_size] }};
            delay #(.data_size(data_size), .size(size), .cycle(1)) 
            delay_inst_systolic_array_to_z_to_z_single(
                .bus_in({size{ transformed_diff_start_plain[data_size*(size - systolic_array_to_z_to_z_single_index) - 1 -: data_size] }}), 
                .bus_out(systolic_array_to_z_to_z_single_diff_start_row[systolic_array_to_z_to_z_single_index]), 
                .clk(clk)
            );
            assign systolic_array_to_z_to_z_single_diff_act_row[systolic_array_to_z_to_z_single_index] = systolic_array_to_z_to_z_single_diff_act_start_present_reg[systolic_array_to_z_to_z_single_index];
        end    
    endgenerate

    //=========================== set up systolic array ========================================================//

    reg [systolic_array_to_z_to_z_size - 1:0] systolic_array_to_z_to_z_out_reg[size - 2:0];

    initial begin
        for (int i = 0; i < size - 1; i = i + 1) begin
            systolic_array_to_z_to_z_out_reg[i] = 0;
        end
    end

    always @(posedge clk) begin
        systolic_array_to_z_to_z_out_reg[0] <= systolic_array_to_z_to_z_out;
        for (int i = 1; i < size - 1; i = i + 1) begin
            systolic_array_to_z_to_z_out_reg[i] <= systolic_array_to_z_to_z_out_reg[i - 1];
        end 
    end

    wire [size*data_size - 1:0] systolic_array_acc_z_to_z[size - 1:0];
    wire [size*data_size - 1:0] systolic_array_acc_z_to_z_transformed[size - 1:0];
    
    genvar systolic_array_index;
    generate
        for (systolic_array_index = 0; systolic_array_index < size; systolic_array_index = systolic_array_index + 1) begin : set_up_systolic_array
            wire [31:0] systolic_array_current_layer;
            wire [31:0] systolic_array_address;
            wire [size - 1:0] systolic_array_replace_pattern;
            wire systolic_array_reset_counter_in;
            wire [size - 1:0] systolic_array_one_address;
            wire [data_size*size - 1:0] systolic_array_acc_z_to_z_result;
            wire [data_size*size - 1:0] systolic_array_mult_cost_result;
            wire [data_size*size - 1:0] systolic_array_cost;
            wire [data_size*size - 1:0] systolic_array_revert_result;
            wire [data_size*size - 1:0] systolic_trasform_result;
            wire transform_reset_counter;
            wire transform_reset_counter_delay;

            assign systolic_array_cost = transform_reset_counter ? diff_cost_store[systolic_array_index] : 0;

            wire [data_size*size - 1:0] systolic_array_cost_trnasform;
            transformer #(.size(size), .data_size(data_size))
            transformer_cost_inst(
                .data(systolic_array_cost),
                .transformed_data(systolic_array_cost_trnasform),
                .reset_counter(transform_reset_counter),
                .clk(clk)
            );

            // systolic_array_current_layer, address, replace_pattern, start_new_layer, one_address 
            assign { 
                systolic_array_current_layer, 
                systolic_array_address, 
                systolic_array_replace_pattern, 
                systolic_array_reset_counter_in,
                systolic_array_one_address
            } = systolic_array_index == 0 ? systolic_array_to_z_to_z_out : systolic_array_to_z_to_z_out_reg[systolic_array_index - 1];

            systolic_array #(
                .data_size(data_size),
                .size(size),
                .max_layer_size(max_layer_size)
            )
            systolic_array(
                .current_layer(systolic_array_current_layer),
                .address(systolic_array_address),
                .output_replace_pattern(systolic_array_replace_pattern),
                .reset_counter_in(systolic_array_reset_counter_in),
                .z_to_z(z_to_z_diff_z_to_z[systolic_array_index]),
                .one_address(systolic_array_one_address),
                .acc_z_to_z(systolic_array_acc_z_to_z_result),
                .clk(clk)
            );


            continuous_systolic #(.size(size), .data_size(data_size)) 
            continuous_systolic(
                .a(systolic_array_acc_z_to_z_result),
                .b(systolic_array_cost_trnasform),
                .c(systolic_array_mult_cost_result),
                .reset_counter(transform_reset_counter),
                .clk(clk)
            );

            assign transform_reset_counter = systolic_array_replace_pattern == {1'b0, {(size - 1){1'b1}}} ? 1'b1 : 1'b0;

            mult_matrix_revert #(.data_size(data_size), .size(size))
            mult_systolic_matrix_revert_inst( 
                .input_stream(systolic_array_mult_cost_result),
                .output_stream(systolic_array_revert_result),
                .clk(clk)
            ); 

            delay #(.data_size(1), .size(1), .cycle(size - 1)) 
            delay_transform_reset_counter(.bus_in(transform_reset_counter), .bus_out(transform_reset_counter_delay), .clk(clk));

            transformer #(.size(size), .data_size(data_size))
            transformer_systolic_inst(
                .data({size{systolic_array_revert_result[data_size*size - 1 -: data_size]}}),
                .transformed_data(systolic_trasform_result),
                .reset_counter(transform_reset_counter_delay),
                .clk(clk)
            );

            mult_matrix_revert #(.data_size(data_size), .size(size))
            mult_systolic_transform_matrix_revert_inst( 
                .input_stream(systolic_trasform_result),
                .output_stream(systolic_array_acc_z_to_z[systolic_array_index]),
                .clk(clk)
            ); 

        end
        for (systolic_array_index = 0; systolic_array_index < size - 1; systolic_array_index = systolic_array_index + 1) begin : delay_systolic_transformed_result
            delay #(.data_size(data_size), .size(size), .cycle(size - 1 - systolic_array_index)) 
            delay_inst_systolic_array_result(
                .bus_in(systolic_array_acc_z_to_z[systolic_array_index]), 
                .bus_out(systolic_array_acc_z_to_z_transformed[systolic_array_index]), 
                .clk(clk)
            );
        end
        assign systolic_array_acc_z_to_z_transformed[size - 1] = systolic_array_acc_z_to_z[size - 1];
    endgenerate

    //=========================== set up start store =================================================================//
    wire start_read_update_data;
    wire start_active_train;
    wire [31:0] start_current_layer;
    wire [31:0] start_current_row;

    assign {
        start_read_update_data,
        start_active_train,
        start_current_layer,
        start_current_row
    } = systolic_array_to_z_to_z_single_out;



    wire start_store;
    reg [31:0] start_count_reg;
    wire [31:0] start_count;
    wire [31:0] start_load_address;
    wire [31:0] start_load_row;
    wire [data_size*size - 1:0] start_diff_start[size - 1:0];
    wire [data_size*size - 1:0] start_diff_act[size - 1:0];
    wire [data_size*size - 1:0] start_load_data[size - 1:0];

    localparam  start_load_info_size = 32 + 32 + 1;
    wire [start_load_info_size - 1:0] start_load_info;

    assign start_store = active_train && ~start_read_update_data;
    assign start_count = start_read_update_data ? start_count_reg : 0;
    assign start_load_row = start_count % size;
    assign start_load_address = start_count / size;

    genvar start_index;
    generate
        for(start_index = 0; start_index < size; start_index = start_index + 1) begin : set_up_start_diff
            wire [data_size*size - 1:0] start_store_load_data;
            assign start_diff_start[start_index] = start_store ? systolic_array_to_z_to_z_single_diff_start_row[start_index] : 0;
            assign start_diff_act[start_index] = start_store ? systolic_array_to_z_to_z_single_diff_act_row[start_index] : 0;
            //set up start store
            start_store #(
                .data_size(data_size),
                .size(size),
                .max_layer_size(max_layer_size)
            )

            start_store_inst(
                .load(start_read_update_data),
                .load_address(start_load_address),
                .load_row(start_load_row),
                .load_data_set(start_index),
                .load_data(start_store_load_data),
                .reset_counter(start_current_row == 0 ? 1'b1 : 1'b0),

                .store(start_store),
                .store_address(start_current_layer),
                .store_row(start_current_row),
                .store_start_data(start_diff_start[start_index]),
                .store_act_data(start_diff_act[start_index]),

                .clk(clk)
            );

            delay #(.data_size(data_size), .size(size), .cycle(3*(size - 1))) 
            delay_inst_systolic_array_result(
                .bus_in(start_store_load_data), 
                .bus_out(start_load_data[start_index]), 
                .clk(clk)
            );

        end
        delay #(.data_size(start_load_info_size), .size(1), .cycle(3*(size - 1))) 
        delay_inst_systolic_array_result(
            .bus_in({start_load_address, start_load_row, start_read_update_data}), 
            .bus_out(start_load_info), 
            .clk(clk)
        );
    endgenerate

    //=========================================== delay to concluder ============================================

    wire [data_size*size - 1:0] dc_dw [size - 1:0];
    wire [data_size*size - 1:0] sum [size - 1:0];


    genvar conclude_i;
    genvar conclude_j;
    generate
        assign sum[0] = dc_dw[0];
        for (conclude_i = 0; conclude_i < size; conclude_i = conclude_i + 1) begin : set_up_dc_dw_i
            for (conclude_j = 0; conclude_j < size; conclude_j = conclude_j + 1) begin : set_up_dc_dw_j
                assign dc_dw[conclude_i][data_size*(size - conclude_j) - 1 -: data_size] = gdo_mult(
                    systolic_array_acc_z_to_z_transformed[conclude_i][data_size*(size - conclude_j) - 1 -: data_size],
                    start_load_data[conclude_i][data_size*(size - conclude_j) - 1 -: data_size]
                );
            end
        end
        for (conclude_i = 1; conclude_i < size; conclude_i = conclude_i + 1) begin : set_up_sum_i
            for (conclude_j = 0; conclude_j < size; conclude_j = conclude_j + 1) begin : set_up_sum_j
                assign sum[conclude_i][data_size*(size - conclude_j) - 1 -: data_size] = gdo_add(
                    sum[conclude_i - 1][data_size*(size - conclude_j) - 1 -: data_size], 
                    dc_dw[conclude_i][data_size*(size - conclude_j) - 1 -: data_size]
                );
            end
        end
        for (conclude_i = 0; conclude_i < size; conclude_i = conclude_i + 1) begin : assign_result
            assign update_weight_value[data_size*(size - conclude_i) - 1 -: data_size] = gdo_mult(sum[size - 1][data_size*(size - conclude_i) - 1 -: data_size], learning_rate);
            // assign update_weight_value[data_size*size - 1 -: data_size] = sum[size - 1][data_size*size - 1 -: data_size];
        end
    endgenerate

    assign {update_weight_layer, update_weight_row, is_update_weight} = start_load_info;

    always @(posedge clk ) begin
        if (start_read_update_data) begin
            start_count_reg <= start_count_reg + 1;
        end else begin
            start_count_reg <= 0;
        end
        
        //================================= systolic ============================
        // $write("%d\n ", learning_rate);
        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%f ", real'(signed'(systolic_array_acc_z_to_z_transformed[0][data_size*(size - i) - 1 -: data_size])) / 2**8);
        // end
        // $write("| ");
        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%f ", real'(signed'(systolic_array_acc_z_to_z_transformed[1][data_size*(size - i) - 1 -: data_size])) / 2**8);
        // end
        // $write("| ");
        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%f ", real'(signed'(systolic_array_acc_z_to_z_transformed[2][data_size*(size - i) - 1 -: data_size])) / 2**8);
        // end

        // $write("| ");

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%f ", real'(signed'(start_load_data[0][data_size*(size - i) - 1 -: data_size])) / 2**8);
        // end

        // $write("| ");

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%f ", real'(signed'(start_load_data[1][data_size*(size - i) - 1 -: data_size])) / 2**8);
        // end
        
        // $write("| ");

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%f ", real'(signed'(start_load_data[2][data_size*(size - i) - 1 -: data_size])) / 2**8);
        // end

        // $write("|\n ");

        // // $write("= %d %d %b |", update_weight_layer, update_weight_row, is_update_weight);

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%f ", real'(signed'(start_diff_start[0][data_size*(size - i) - 1 -: data_size])) / 2**8);
        // end

        // $write("| ");

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%f ", real'(signed'(start_diff_start[1][data_size*(size - i) - 1 -: data_size])) / 2**8);
        // end

        // $write("| ");

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%f ", real'(signed'(start_diff_start[2][data_size*(size - i) - 1 -: data_size])) / 2**8);
        // end

        // $write("| ");

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%f ", real'(signed'(start_diff_act[0][data_size*(size - i) - 1 -: data_size])) / 2**8);
        // end

        // $write("| ");

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%f ", real'(signed'(start_diff_act[1][data_size*(size - i) - 1 -: data_size])) / 2**8);
        // end

        // $write("| ");

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%f ", real'(signed'(start_diff_act[2][data_size*(size - i) - 1 -: data_size])) / 2**8);
        // end

        // $write("\n");

        //================================= calculate z_to_z ============================

        // $write("diff_act = ");
        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", diff_act[data_size*(size - i) - 1 -: data_size] >> 8);
        // end

        // $write("| diff_dense = ");

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", diff_dense[data_size*(size - i) - 1 -: data_size] >> 8);
        // end

        // $write("| diff_cost = ");

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", diff_cost[data_size*(size - i) - 1 -: data_size] >> 8);
        // end

        // $write("| set_act = ");

        // $write("%b ", current_input_row == 0 ? 1'b1 : 1'b0);

        // $write("| z_to_z_diff_z_to_z = ");
        
        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", z_to_z_diff_z_to_z[0][data_size*(size - i) - 1 -: data_size] >> 8);
        // end

        // $write("| start_new_layer = ");

        // $write("%b \n",  start_new_layer);
    end

    initial begin
        start_count_reg = 0;
    end

    
endmodule
