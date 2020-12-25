// synthesis VERILOG_INPUT_VERSION SYSTEMVERILOG_2005
package gdo;
    parameter gdo_size = 8;
    parameter gdo_data_size = 2*gdo_size;

    function [gdo_data_size - 1:0] gdo_add;
        input reg signed [gdo_data_size - 1:0] a;
        input reg signed [gdo_data_size - 1:0] b;
        begin
            return a + b;
        end
    endfunction

    function [gdo_data_size - 1:0] gdo_mult;
        input reg signed [gdo_data_size - 1:0] a;
        input reg signed [gdo_data_size - 1:0] b;
        reg signed [gdo_data_size*2 - 1:0] ab;
        begin
            ab       = a * b;
            return ab[gdo_data_size + gdo_size - 1 -: gdo_data_size];
        end
    endfunction

    function [gdo_data_size - 1:0] gdo_pow;
        input reg signed [gdo_data_size - 1:0] a;
        input reg signed [gdo_data_size - 1:0] b;
        reg signed [gdo_data_size - 1:0] ab;
        begin
            return $rtoi((a * 2.0 ** (-1.0*gdo_size))**(b * 2.0 ** (-1.0*gdo_size)) * 2.0 ** gdo_size);
        end
    endfunction

    function [gdo_data_size - 1:0] gdo_sub;
        input reg signed [gdo_data_size - 1:0] a;
        input reg signed [gdo_data_size - 1:0] b;
        begin
            return a - b;
        end
    endfunction

endpackage
