module continuous_systolic (
    a,
    b,
    c,
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

    integer counter;

    reg [data_size - 1:0] sum_reg [size - 1:0][size - 1:0];
    reg [data_size - 1:0] a_reg [size - 1:0][size - 1:0];
    reg [data_size - 1:0] b_reg [size - 1:0][size - 1:0];

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

    function [data_size*size - 1:0] getResultStream;
        input integer counter;
        begin
            for (int i = 0; i < size; i = i + 1) begin
                getResultStream[data_size*(size - i) - 1 -: data_size] = sum_reg[i][(size - i + counter) % size];
            end
        end
    endfunction

    assign c = getResultStream(counter);

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
                if ((size - j + counter) % size == i) begin
                  sum_reg[j][i] <= gdo_mult(a_reg[j][i], b_reg[j][i]);
                end else begin
                  sum_reg[j][i] <= gdo_add(sum_reg[j][i], gdo_mult(a_reg[j][i], b_reg[j][i]));
                end
            end
        end

        for (int i = 0; i < size; i = i + 1) begin
            for (int j = 0; j < size; j = j + 1) begin
                $write("s=%d | ", sum_reg[j][i]);
            end
            $write("\n");
        end

        for (int i = 0; i < size; i = i + 1) begin
            for (int j = 0; j < size; j = j + 1) begin
                $write("a=%d | ", a_reg[j][i]);
            end
            $write("\n");
        end

        for (int i = 0; i < size; i = i + 1) begin
            for (int j = 0; j < size; j = j + 1) begin
                $write("b=%d | ", b_reg[j][i]);
            end
            $write("\n");
        end

        if (reset_counter) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end
endmodule