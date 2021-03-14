module start_store (
    load,
    load_address,
    load_row,
    load_data_set,
    load_data,
    reset_counter,

    store,
    store_address,
    store_row,
    store_start_data,
    store_act_data,

    clk
);

    import gdo::gdo_mult;

    parameter data_size = 16;
    parameter size = 3;
    parameter max_layer_size = 5;

    input load;
    input [31:0] load_address;
    input [31:0] load_row;
    input [31:0] load_data_set;
    output [data_size*size - 1:0] load_data;

    input store;
    input [31:0] store_address;
    input [31:0] store_row;
    input [data_size*size - 1:0] store_start_data;
    input [data_size*size - 1:0] store_act_data;

    input reset_counter;
    input clk;

    reg [data_size*size - 1:0]  act_storage [size - 1:0][max_layer_size - 1:0];
    reg [data_size*size - 1:0]  start_storage [size - 1:0][max_layer_size - 1:0];

    wire [data_size*size - 1:0] act;
    wire [data_size*size - 1:0] start;
    wire [data_size*size - 1:0] start_no_repeat;

    assign act = load ? ( store && store_address == load_address && store_row == load_row ? store_act_data : act_storage[load_row][load_address]) : 0;
    assign start_no_repeat = start_storage[load_data_set][load_address];
    assign start = load ? (store && store_address == load_address && store_row == load_data_set ? {size{store_start_data[data_size*(size - load_row) - 1 -: data_size]}} : {size{start_no_repeat[data_size*(size - load_row) - 1 -: data_size]}}) : 0;

    wire [data_size*size - 1:0] diff_act_start;

    genvar gen_index;
    generate
        for (gen_index = 0; gen_index < size; gen_index = gen_index + 1) begin : set_up_data
            assign diff_act_start[data_size*(size - gen_index) - 1 -: data_size] = gdo_mult(act[data_size*(size - gen_index) - 1 -: data_size], start[data_size*(size - gen_index) - 1 -: data_size]);
        end
    endgenerate

    assign load_data = diff_act_start;

    initial begin
        for (int index = 0; index < max_layer_size; index = index + 1) begin
            for (int row = 0; row < size; row = row + 1) begin
                act_storage[row][index] = 0; 
                start_storage[row][index] = 0;
            end
        end
    end
    
    always @(posedge clk ) begin
        if (store) begin
          act_storage[store_row][store_address]  <= store_act_data;
          start_storage[store_row][store_address]  <= store_start_data;
        end
    end
    
endmodule