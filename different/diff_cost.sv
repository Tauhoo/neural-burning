module diff_cost (
    predict_value, 
    z, 
    diff
);
    parameter size = 3;
    parameter data_size = 16;

    input [size*data_size - 1:0] predict_value;
    input [size*data_size - 1:0] z;
    output [size*data_size - 1:0] diff;

    import gdo::gdo_sub;
    import gdo::gdo_mult;

    function reg [size*data_size - 1:0] diff_square_sum;
        input reg signed [size*data_size - 1:0] z;
        input reg signed [size*data_size - 1:0] predict_value;
        begin
            for (int index = 0; index < size; index = index + 1) begin   
                diff_square_sum[(size - index)*data_size - 1 -: data_size] = gdo_mult(
                    {{(data_size/2 - 2){1'b0}}, 2'b10, {(data_size/2){1'b0}}},
                    gdo_sub(predict_value[(size - index)*data_size - 1 -: data_size], z[(size - index)*data_size - 1 -: data_size])
                );
            end
        end
    endfunction

    assign diff = diff_square_sum(z, predict_value);
endmodule