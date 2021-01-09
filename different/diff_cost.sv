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

    function [data_size - 1:0] diff_square_sum;
        input [data_size - 1:0] z;
        input [data_size - 1:0] predict_value;
        begin
            diff_square_sum = gdo_mult(
                {{(data_size/2 - 2){1'b0}}, 2'b10, {(data_size/2){1'b0}}},
                gdo_sub(predict_value, z)
            );
        end
    endfunction

    assign diff = diff_square_sum(z, predict_value);
endmodule