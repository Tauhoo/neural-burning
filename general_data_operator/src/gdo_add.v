function [gdo_data_size - 1:0] gdo_add;
    input reg signed [gdo_data_size - 1:0] a;
    input reg signed [gdo_data_size - 1:0] b;
    begin
        gdo_add = a + b;
    end
endfunction
