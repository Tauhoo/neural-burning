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

    wire is_last_row; 

    assign is_last_row = row_reg == size - 1;
    assign layer_index = reset ? 0 : 
                         is_load && is_last_row ? layer_reg + 1 :
                         layer_reg;

    assign row_index = reset ? 0 : 
                       is_load ? 
                        is_last_row ? 0 : 
                        row_reg + 1 :
                       row_reg;
    
    initial begin
        layer_reg = 0;
        row_reg = 2; 
    end

    always @(posedge clk ) begin
        layer_reg = layer_index;
        row_reg = row_index;
    end
endmodule
