function [gdo_data_size - 1:0] gdo_mult;
    input reg signed [gdo_data_size - 1:0] a;
    input reg signed [gdo_data_size - 1:0] b;
    reg signed [gdo_data_size*2 - 1:0] ab;
    begin
        ab       = a * b;
        gdo_mult = ab[gdo_data_size + gdo_size - 1 -: gdo_data_size];
    end
endfunction
