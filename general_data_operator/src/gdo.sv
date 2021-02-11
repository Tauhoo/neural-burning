// synthesis VERILOG_INPUT_VERSION SYSTEMVERILOG_2005
package gdo;
    parameter gdo_size = 8;
    parameter gdo_data_size = 2*gdo_size;
    parameter gdo_e = (271828 * (2**gdo_size))/(10**5);
    const reg signed [gdo_data_size - 1:0] gdo_one = {{(gdo_size - 1){1'b0}},1'b1,{gdo_size{1'b0}}};
    const reg signed [gdo_data_size - 1:0] gdo_zero = {gdo_data_size{1'b0}};

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

    function [gdo_data_size + gdo_size - 1:0] gdo_div;
        input reg signed [gdo_data_size - 1:0] a;
        input reg signed [gdo_data_size - 1:0] b;
        reg signed [gdo_data_size + gdo_size - 1:0] ab;
        begin
            ab       = {a, {gdo_size{1'b0}}} / {{gdo_size{1'b0}}, b};
            return ab[gdo_data_size - 1:0];
        end
    endfunction

    function [gdo_data_size - 1:0] gdo_pow;
        input reg signed [gdo_data_size - 1:0] a;
        input reg signed [gdo_data_size - 1:0] b;
        reg signed [gdo_data_size - 1:0] ab;
        begin
            return ((a / (2**gdo_size))**(b / (2**gdo_size)))*2**gdo_size;
        end
    endfunction

    function [gdo_data_size - 1:0] gdo_sigmoid;
        input reg signed [gdo_data_size - 1:0] x;
        reg signed [gdo_data_size - 1:0] x_abs;
        reg signed [gdo_data_size - 1:0] x_acc;
        reg signed [gdo_data_size - 1:0] result;
        begin
            if (x >= 0) begin
                x_abs = x;
            end else begin
                x_abs = -1 * x;
            end
            
            result = gdo_one << 1;

            x_acc = x_abs;
            result = gdo_add(result, x_acc);

            x_acc = gdo_mult(x_acc, x_abs) >> 1;
            result = gdo_add(result, x_acc);

            x_acc = gdo_mult(x_acc, x_abs) >> 2;
            result = gdo_add(result, x_acc);

            x_acc = gdo_mult(x_acc, x_abs) >> 1;
            result = gdo_add(result, x_acc);

            x_acc = gdo_mult(x_acc, x_abs) >> 3;
            result = gdo_add(result, x_acc);

            result = gdo_div(gdo_one ,result);
            if (x > 0) begin
                result = gdo_sub(gdo_one, result);
            end 
            
            return result;
        end
    endfunction

    function [gdo_data_size - 1:0] gdo_sub;
        input reg signed [gdo_data_size - 1:0] a;
        input reg signed [gdo_data_size - 1:0] b;
        begin
            return a - b;
        end
    endfunction

    function [gdo_data_size - 1:0] gdo_linear;
        input reg signed [gdo_data_size - 1:0] in_data;
        begin
            return in_data;
        end
    endfunction

    function [gdo_data_size - 1:0] gdo_binary;
        input reg signed [gdo_data_size - 1:0] in_data;
        begin
            if (in_data < 0) begin
                return gdo_zero;
            end else begin
                return gdo_one;
            end
        end
    endfunction

    function [gdo_data_size - 1:0] gdo_tanh;
        input reg signed [gdo_data_size - 1:0] in_data;
        begin
            return gdo_sub(gdo_sigmoid(in_data << 1) << 1, gdo_one);
        end
    endfunction

endpackage
