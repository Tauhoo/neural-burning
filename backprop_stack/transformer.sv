module transformer (
    data,
    transformed_data,
    reset_counter,
    clk
);

    parameter data_size      = 16;
    parameter size           = 3;

    input [data_size*size - 1:0] data;
    input reset_counter;
    input clk;

    output [data_size*size - 1:0] transformed_data;

    reg [data_size - 1:0] transform_buffer [size - 1:0][size - 2:0];
    integer counter;
    integer index;

    wire [31:0] counter_wire;
    assign counter_wire = reset_counter ? 0 : counter + 1;

    genvar gen_index;

    generate
        for (gen_index = 0; gen_index < size; gen_index = gen_index + 1) begin : set_up_transformed_data
            assign transformed_data[data_size*(size - gen_index) - 1 -: data_size] = counter_wire == gen_index ? data[data_size*size - 1 -: data_size] : transform_buffer[gen_index][size - 2];
        end
    endgenerate

    initial begin
        for (int i = 0; i < size - 1; i = i + 1) begin
            for (int j = 0; j < size; j = j + 1) begin
                transform_buffer[j][i] = 0;
            end
        end
        counter = 0;
        index = 0;
    end

    always @(posedge clk ) begin
        for (int j = 0; j < size; j = j + 1) begin
            if (counter_wire == j) begin
                transform_buffer[j][0] <= data[data_size - 1 -: data_size];
            end else begin
                transform_buffer[j][0] <= 0;
            end
        end

        for (int i = 1; i < size - 1; i = i + 1) begin
            for (int j = 0; j < size; j = j + 1) begin
                if (counter_wire == j) begin
                    transform_buffer[j][i] <= data[data_size*(size - i) - 1 -: data_size];
                end else begin
                    transform_buffer[j][i] <= transform_buffer[j][i - 1];
                end
            end
        end

        counter <= counter_wire;
    end
endmodule