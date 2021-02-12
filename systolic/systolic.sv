module systolic(data_stream,
                w_stream,
                y_stream,
                clk,
                set_w);
    
    parameter data_size = 16;
    parameter size      = 3;

    import gdo::gdo_add;
    import gdo::gdo_mult;
    
    genvar index;
    
    input [data_size * size - 1:0] data_stream;
    wire [data_size - 1:0] data [0:size - 1];
    
    generate
    for (index = 0; index < size; index = index + 1) begin : set_up_data
        assign data[index] = data_stream[(size - index) * data_size - 1 -: data_size];
    end
    endgenerate
    
    input [data_size * size - 1:0] w_stream;
    wire [data_size - 1:0] w [0:size - 1];
    
    generate
    for (index = 0; index < size; index = index + 1) begin : set_up_w
        assign w[index] = w_stream[(size - index) * data_size - 1 -: data_size];
    end
    endgenerate
    
    input clk;
    input set_w;
    
    output [data_size * size - 1:0] y_stream;
    
    reg [data_size - 1:0] w_reg [0:size - 1] [0:size - 1];
    reg [data_size - 1:0] a_reg [0:size - 1] [0:size - 1];
    reg [data_size - 1:0] sum_reg [0:size - 1] [0:size - 1];
    
    genvar gen_colum;
    generate
    for (gen_colum = 0; gen_colum < size; gen_colum = gen_colum + 1) begin : output_set_up
        assign y_stream[(size - gen_colum) * data_size - 1 -: data_size] = gdo_add(sum_reg[gen_colum][size - 1], gdo_mult(w_reg[gen_colum][size - 1], a_reg[gen_colum][size - 1]));
    end
    endgenerate
    
    integer row;
    integer colum;
    integer w_round;
    
    initial begin
        w_round = 0;
        for (row = 0; row < size; row = row + 1) begin
            for (colum = 0; colum < size; colum = colum + 1) begin
                w_reg[colum][row]        = 0;
                a_reg[colum][row]        = 0;
                sum_reg[colum][row]      = 0;
            end
        end
    end
    
    always @(posedge clk) begin
        if (set_w) begin
            if (w_round < size) begin
                //update w
                for (colum = 0; colum < size; colum = colum + 1) begin
                    w_reg[colum][w_round] <= w[colum];
                end
                w_round <= w_round + 1;
            end
        end else begin
            w_round <= 0;
        end

        //update input
        for (row = 0; row < size; row = row + 1) begin
            a_reg[0][row] <= data[row];
        end

        for (colum = 1; colum < size; colum = colum + 1) begin
            for (row = 0; row < size; row = row + 1) begin
                a_reg[colum][row] <= a_reg[colum - 1][row];
            end
        end

        //update sum
        for (colum = 0; colum < size; colum = colum + 1) begin
            sum_reg[colum][0] <= 0;
        end

        for (row = 1; row < size; row = row + 1) begin
            for (colum = 0; colum < size; colum = colum + 1) begin
                sum_reg[colum][row] <= gdo_add(sum_reg[colum][row - 1], gdo_mult(w_reg[colum][row - 1], a_reg[colum][row - 1]));
            end
        end
    end
endmodule
