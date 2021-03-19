module code_count(
    count,
    reset, 
    clk
);
    input clk;
    input reset;

    output [31:0] count;

    reg [31:0] count_reg;

    assign count = count_reg;

    initial begin
        count_reg = 0;
    end

    always @(posedge clk ) begin
        if (reset === 1'b1) begin
            count_reg <= 0;
        end else begin
            count_reg <= count_reg + 1;
        end
    end
endmodule
