module delay(bus_in, bus_out, clk);
    parameter data_size = 16;
    parameter size = 1;
    parameter cycle = 1;
    parameter default_value = 0;

    input [data_size*size - 1:0] bus_in;
    input clk;
    output [data_size*size - 1:0] bus_out;

    reg [data_size*size - 1:0] buffer [cycle - 1:0];

    initial begin
        for (int i = 0; i < cycle; i++) begin
            buffer[i] = default_value;
        end
    end

    assign bus_out = buffer[cycle  - 1];

    always @(posedge clk ) begin
        buffer[0] <= bus_in;
        for (int index = 1; index  < cycle; index = index + 1) begin
            buffer[index] <= buffer[index - 1];
        end
    end
endmodule
