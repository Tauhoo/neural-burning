module matrix_storage_locator (
    layer_index,
    row_index, 
    is_load, 
    reset, 
    clk
);

    parameter size = 3;

    input is_load;
    input reset;
    input clk;

    output [31:0] layer_index;
    output [31:0] row_index;

    reg [31:0] layer_reg;
    reg [31:0] row_reg;

    assign layer_index = layer_reg;
    assign row_index = row_reg;
    
    initial begin
        layer_reg = 0;
        row_reg = 2; 
    end

    always @(posedge clk ) begin
        if (reset) begin
            layer_reg = 0;
            row_reg = 0;
        end else if(is_load) begin
            if (row_reg == size - 1) begin
                layer_reg = layer_reg + 1;
                row_reg = 0;
            end else begin 
                row_reg = row_reg + 1;
            end
        end
    end
endmodule
