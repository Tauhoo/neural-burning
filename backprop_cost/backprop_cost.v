module backprop_cost(y_stream,
                     label_stream,
                     clk,
                     cost);
    parameter data_size = 4;
    parameter size      = 3;
    input [data_size*size - 1:0] y_stream;
    input [data_size*size - 1:0] label_stream;
    input clk;
    
    output [data_size*size - 1:0] cost;
    
    reg [data_size - 1:0] result;
    reg [data_size - 1:0] temp_y;
    reg [data_size - 1:0] temp_label;
    integer index;
    
    assign cost = result;
    
    always @(posedge clk) begin
        for (index = 0; index  < size; index = index + 1) begin
            temp_label                                  = label_stream[(size - index)*data_size - 1 -: data_size];
            temp_y                                      = y_stream[(size - index)*data_size - 1 -: data_size];
            cost[(size - index)*data_size -: data_size] = (temp_label - temp_y) * 2;
        end
    end
endmodule
