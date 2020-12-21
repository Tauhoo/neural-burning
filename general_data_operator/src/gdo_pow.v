function [gdo_data_size - 1:0] gdo_pow;
    input reg signed [gdo_data_size - 1:0] a;
    input reg signed [gdo_data_size - 1:0] b;
    reg signed [gdo_data_size - 1:0] ab;
    begin
        ab      = $rtoi((a * 2.0 ** (-1.0*gdo_size))**(b * 2.0 ** (-1.0*gdo_size)) * 2.0 ** gdo_size);
        gdo_pow = ab;
    end
endfunction
