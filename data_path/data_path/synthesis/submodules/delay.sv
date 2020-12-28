module delay(bus_in, bus_out, clk);
    parameter data_size = 16;
    parameter size = 1;
    parameter cycle = 1;
    localparam buffer_size = cycle + 1;

    input [data_size*size - 1:0] bus_in;
    input clk;
    output [data_size*size - 1:0] bus_out;

    reg [data_size*size - 1:0] buffer [0:buffer_size - 1];

    integer index;

    initial begin
        for (index = 0; index < buffer_size; index = index + 1) begin
            buffer[index] <= 0;
        end
    end

    assign bus_out = buffer[0];

    always @(posedge clk)
    begin
        for (index = 1; index < buffer_size; index = index + 1) begin
            buffer[index - 1] <= buffer[index];
        end
        buffer[buffer_size - 1] <= bus_in;
    end
endmodule
