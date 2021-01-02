module code_count(
    count,
    reset, 
    clk
);
    input clk;
    input reset;

    output [31:0] count;

    reg [31:0] count_reg;

    assign count = reset ? 0 : count_reg + 1;

    initial begin
        count_reg <= 0;
    end

    always @(posedge clk ) begin
        count_reg <= count; 
    end
endmodule
