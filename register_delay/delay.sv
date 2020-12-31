module delay(bus_in, bus_out, clk);
    parameter data_size = 16;
    parameter size = 1;
    parameter cycle = 1;

    input [data_size*size - 1:0] bus_in;
    input clk;
    output [data_size*size - 1:0] bus_out;

    reg [data_size*size - 1:0] buffer [cycle - 1:0];

    assign bus_out = buffer[cycle  - 1];

    always @(posedge clk ) begin
        buffer[0] <= bus_in;
        for (int index = 1; index  < cycle; index = index + 1) begin
            buffer[index - 1] <= buffer[index];
        end
    end
endmodule
