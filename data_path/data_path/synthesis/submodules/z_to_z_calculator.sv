module z_to_z_calculator (
    diff_act,
    diff_dense,
    diff_cost,
    set_diff_act,
    diff_z_to_z,
    start_new_layer,
    clk
);

    import gdo::gdo_mult;

    parameter data_size      = 16;
    parameter size           = 3;

    input [data_size*size - 1:0] diff_act;
    input [data_size*size - 1:0] diff_dense;
    input [data_size*size - 1:0] diff_cost;
    input start_new_layer;
    input clk;

    input set_diff_act;

    output [data_size*size - 1:0] diff_z_to_z;

    reg [data_size*size - 1:0] act_reg;
    wire [data_size*size - 1:0] diff_act_wire;
    integer counter;

    initial begin
        act_reg = 0;
    end

    assign diff_act_wire = set_diff_act ? diff_act : act_reg;
    always @(posedge clk) begin
        if (set_diff_act) begin
            act_reg <= diff_act;
        end
        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", diff_z_to_z_wire[data_size*(size - i) - 1 -: data_size] >> 8);
        // end

        // $write("| ");

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", diff_z_to_z_prep_wire[data_size*(size - i) - 1 -: data_size] >> 8);
        // end

        // $write("\n");

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", diff_act_wire[data_size*(size - i) - 1 -: data_size] >> 8);
        // end

        // $write("| ");

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", diff_dense[data_size*(size - i) - 1 -: data_size] >> 8);
        // end
        // $write("\n");
    end

    //calculate z-to-z derivative 
    wire [data_size*size - 1:0] diff_z_to_z_wire;
    genvar colum;
    generate
        for (colum = 0; colum < size; colum = colum + 1) begin : set_up_z_to_z
            assign diff_z_to_z_wire[data_size*(size - colum) - 1 -: data_size] = gdo_mult(diff_act_wire[data_size*(size - colum) - 1 -: data_size], diff_dense[data_size*(size - colum) - 1 -: data_size]);
        end
    endgenerate

    //prepare z-to-z derivative
    // wire [data_size*size - 1:0] diff_z_to_z_prep_wire;
    mult_matrix_prep #(.data_size(data_size), .size(size))
    mult_z_to_z_matrix_prep_inst(
        .input_stream(diff_z_to_z_wire),
        .output_stream(diff_z_to_z),
        .clk(clk)
    );
    
    // cost transform
    // wire [data_size*size - 1:0] transform_diff_z_to_z;
    // transformer #(.size(size), .data_size(data_size))
    // transformer_diff_z_to_z_inst(
    //     .data(diff_z_to_z_wire),
    //     .transformed_data(transform_diff_z_to_z),
    //     .reset_counter(start_new_layer),
    //     .clk(clk)
    // );

    // //cost transform
    // wire [data_size*size - 1:0] transform_cost;
    // transformer #(.size(size), .data_size(data_size))
    // transformer_cost_inst(
    //     .data(diff_cost),
    //     .transformed_data(transform_cost),
    //     .reset_counter(start_new_layer),
    //     .clk(clk)
    // );
    //prepare cost derivative
    // wire [data_size*size - 1:0] diff_cost_prep_wire;
    // mult_matrix_prep #(.data_size(data_size), .size(size))
    // mult_cost_matrix_prep_inst(
    //     .input_stream(diff_cost),
    //     .output_stream(diff_cost_prep_wire),
    //     .clk(clk)
    // );

    // wire start_new_layer_delay;
    // delay #(.data_size(data_size), .size(size), .cycle(size)) 
    // delay_inst_start_new_layer_delay_value(.bus_in(start_new_layer), .bus_out(start_new_layer_delay), .clk(clk));

    // continuous_systolic #(.size(size), .data_size(data_size)) 
    // continuous_systolic(
    //     .a(diff_cost_prep_wire),
    //     .b(diff_z_to_z_prep_wire),
    //     .c(diff_z_to_z),
    //     .reset_counter(start_new_layer_delay),
    //     .clk(clk)
    // );

    // delay #(.data_size(data_size), .size(size), .cycle(size)) 
    // delay_inst_z_to_z(.bus_in(diff_z_to_z_prep_wire), .bus_out(diff_z_to_z), .clk(clk));

endmodule