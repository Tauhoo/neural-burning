module continuous_systolic (
    a,
    b,
    c,
    a_out,
    b_out,
    reset_counter,
    clk
);
    import gdo::gdo_add;
    import gdo::gdo_mult;

    parameter size = 3;
    parameter data_size = 16;

    input [data_size*size - 1:0] a;
    input [data_size*size - 1:0] b;
    input reset_counter;
    input clk;

    output [data_size*size - 1:0] c;
    output [data_size*size - 1:0] a_out;
    output [data_size*size - 1:0] b_out;

    integer counter;

    reg [data_size - 1:0] sum_reg [size - 1:0][size - 1:0];
    reg [data_size - 1:0] a_reg [size - 1:0][size - 1:0];
    reg [data_size - 1:0] b_reg [size - 1:0][size - 1:0];

    wire [data_size - 1:0] sum_wire [size - 1:0][size - 1:0];
    wire [31:0] counter_wire;

    initial begin
        for (int i = 0; i < size; i = i + 1) begin
            for (int j = 0; j < size; j = j + 1) begin
                sum_reg[i][j] = 0;
                a_reg[i][j] = 0;
                b_reg[i][j] = 0;
            end
        end

        counter = 0;
    end

    assign counter_wire = reset_counter ? 0 : counter + 1;

    wire [data_size*size - 1:0] reverted_a;
    mult_matrix_revert #(.data_size(data_size) , .size(size))
    a_matrix_revert_inst( 
        .output_stream(reverted_a),
        .input_stream (a),
        .clk(clk)
    ); 

    wire reset_counter_delay;
    delay #(.data_size(data_size), .size(size), .cycle(size)) 
    delay_inst_reset_counter(.bus_in(reset_counter), .bus_out(reset_counter_delay), .clk(clk));

    wire [data_size*size - 1:0] reverted_a_delay;
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_reverted_a_delay(.bus_in(reverted_a), .bus_out(reverted_a_delay), .clk(clk));

    transformer #(.size(size), .data_size(data_size))
    transformer_reverted_inst(
        .data(reverted_a_delay),
        .transformed_data(a_out),
        .reset_counter(reset_counter_delay),
        .clk(clk)
    );

    genvar gen_i;
    genvar gen_j;
    generate
        for (gen_i = 0; gen_i < size; gen_i = gen_i + 1) begin : set_up_c
            assign c[data_size*(size - gen_i) - 1 -: data_size] = sum_wire[gen_i][(size - gen_i + counter_wire) % size];
        end
        for (gen_i = 0; gen_i < size; gen_i = gen_i + 1) begin : set_up_a_out
            assign b_out[data_size*(size - gen_i) - 1 -: data_size] = b_reg[gen_i][size - 1];
        end
        for (gen_i = 0; gen_i < size; gen_i = gen_i + 1) begin : set_up_sum_row
            for (gen_j = 0; gen_j < size; gen_j = gen_j + 1) begin : set_up_sum_colum
                assign sum_wire[gen_j][gen_i] = gdo_add(sum_reg[gen_j][gen_i], gdo_mult(a_reg[gen_j][gen_i], b_reg[gen_j][gen_i]));
            end
        end
    endgenerate

    always @(posedge clk ) begin

        //update a
        for (int j = 0; j < size; j = j + 1) begin
            a_reg[0][j] <= a[data_size*(size - j) - 1 -: data_size];
        end

        for (int j = 0; j < size; j = j + 1) begin
            for (int i = 1; i < size; i = i + 1) begin
                a_reg[i][j] <= a_reg[i - 1][j];
            end
        end

        //update b
        for (int i = 0; i < size; i = i + 1) begin
            b_reg[i][0] <= b[data_size*(size - i) - 1 -: data_size];
        end

        for (int j = 1; j < size; j = j + 1) begin
            for (int i = 0; i < size; i = i + 1) begin
                b_reg[i][j] <= b_reg[i][j - 1];
            end
        end

        //update sum
        for (int i = 0; i < size; i = i + 1) begin
            for (int j = 0; j < size; j = j + 1) begin
                if ((size - j + counter_wire) % size == i) begin
                  sum_reg[j][i] <= 0;
                end else begin
                  sum_reg[j][i] <= sum_wire[j][i];
                end
            end
        end
        counter <= counter_wire;
        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", c[data_size*(size - i) - 1 -: data_size] >> 8);
        // end
        // $write("| ");
        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", a_out[data_size*(size - i) - 1 -: data_size] >> 8);
        // end
        // $write("| ");
        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", reverted_a_delay[data_size*(size - i) - 1 -: data_size] >> 8);
        // end
        // $write("| %b ", reset_counter_delay);
        // $write("\n");
    end
endmodule