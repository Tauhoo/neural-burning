function [gdo_data_size - 1:0] gdo_sub;
    input reg signed [gdo_data_size - 1:0] a;
    input reg signed [gdo_data_size - 1:0] b;
    begin
        gdo_sub = a - b;
    end
endfunction
