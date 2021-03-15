module backprop_stack_controller(
    backprop_controll_bundle,

    diff_dense,
    diff_start,
    diff_cost,
    diff_to_all,

    diff_dense_out,
    diff_start_out,
    diff_cost_out,
    diff_to_all_out,

    current_layer_out,
    current_row_out,
    is_last_layer,
    start_new_layer,
    read_update_data,
    active_train,

    clk
    );

    parameter size = 3;
    parameter data_size = 16;
    parameter backprop_controll_size = 1 + 1 + 32 + 32;
    parameter max_layer_size = 4;

    input [backprop_controll_size - 1:0] backprop_controll_bundle;

    input [data_size*size - 1:0] diff_dense;
    input [data_size*size - 1:0] diff_cost;
    input [data_size*size - 1:0] diff_start;
    input [data_size*size - 1:0] diff_to_all;

    input clk;

    output [data_size*size - 1:0] diff_dense_out;
    output [data_size*size - 1:0] diff_cost_out;
    output [data_size*size - 1:0] diff_start_out;
    output [data_size*size - 1:0] diff_to_all_out;

    output [31:0] current_layer_out;
    output [31:0] current_row_out;
    output is_last_layer;
    output start_new_layer;
    output read_update_data;
    output active_train;

    wire is_store;
    wire start_train;
    wire [31:0] current_input_layer;
    wire [31:0] current_input_row;

    assign {
        is_store,
        start_train,
        current_input_layer,
        current_input_row
    } = backprop_controll_bundle;

    reg [31:0] temp_last_layer;
    reg [31:0] last_layer;
    reg [31:0] counter;
    reg training;

    reg [data_size*size - 1:0] diff_dense_store[size - 1:0][max_layer_size - 1:0];
    reg [data_size*size - 1:0] diff_start_store[size - 1:0][max_layer_size - 1:0];
    reg [data_size*size - 1:0] diff_cost_store[size - 1:0];
    reg [data_size*size - 1:0] diff_to_all_store[size - 1:0][max_layer_size - 1:0];

    initial begin
        for (int i = 0; i < max_layer_size; i = i + 1) begin 
            for (int j = 0; j < size; j = j + 1) begin 
                diff_dense_store[j][i] = 0;
                diff_start_store[j][i] = 0;
                diff_to_all_store[j][i] = 0;
            end
        end
        for (int j = 0; j < size; j = j + 1) begin 
            diff_cost_store[j] = 0;
        end
        temp_last_layer = 0;
        last_layer = 0;
        counter = 0;
        training = 0;
    end

    always @(posedge clk ) begin
        if (is_store) begin
            diff_dense_store[current_input_row][current_input_layer] <= diff_dense;
            diff_start_store[current_input_row][current_input_layer] <= diff_start;
            diff_cost_store[current_input_row] <= diff_cost;
            diff_to_all_store[current_input_row][current_input_layer] <= diff_to_all;
            temp_last_layer <= current_input_layer;
        end
    end

    wire first_phase;
    wire second_phase;
    wire last_phase;

    assign first_phase = counter/size <= last_layer;
    assign second_phase = counter/size > last_layer && counter/size < 2*(last_layer + 1);
    assign last_phase = counter/size == 2*(last_layer + 1);

    assign current_layer_out = first_phase && training ? counter/size : 0 ;
    assign current_row_out = first_phase && training ? counter%size : 0;

    assign diff_dense_out = training && first_phase ? diff_dense_store[current_row_out][current_layer_out] : 0;
    assign diff_start_out = training && first_phase ? diff_start_store[current_row_out][current_layer_out] : 0;
    assign diff_cost_out = training && first_phase ? diff_cost_store[current_row_out] : 0;
    assign diff_to_all_out = training && first_phase ? diff_to_all_store[current_row_out][current_layer_out] : 0;

    assign is_last_layer = current_layer_out == last_layer && training ? 1'b1 : 1'b0;
    assign start_new_layer = current_row_out == 0 && first_phase && training ? 1'b1 : 1'b0;
    assign read_update_data = (second_phase || last_phase) && training ? 1'b1 : 1'b0;
    assign active_train = training && !last_phase ? 1'b1 : 1'b0;
    
    always @(posedge clk ) begin
        if (start_train) begin
            training <= 1;
            last_layer <= temp_last_layer;
        end

        // $write("training = %b, last_phase = %b, is_last_layer = %b, start_new_layer = %b, read_update_data = %b, active_train = %d, current_layer_out = %d, current_row_out = %d\n", 
        //     training, 
        //     last_phase,
        //     is_last_layer, 
        //     start_new_layer, 
        //     read_update_data, 
        //     active_train, 
        //     current_layer_out, 
        //     current_row_out
        // );

        if (training) begin
            if (counter == size*(2*(last_layer + 1) + 1) - 1) begin
                counter <= 0;
                training <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule