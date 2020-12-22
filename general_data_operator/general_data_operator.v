module general_data_operator (out_data);
    `include "G:\\neural-burning\\general_data_operator\\src\\gdo_parameter.v"
    `include "G:\\neural-burning\\general_data_operator\\src\\gdo_add.v"
    `include "G:\\neural-burning\\general_data_operator\\src\\gdo_sub.v"
    `include "G:\\neural-burning\\general_data_operator\\src\\gdo_mult.v"
    `include "G:\\neural-burning\\general_data_operator\\src\\gdo_pow.v"
    
    output [16:0] out_data;
    reg [16:0] data;
    
    assign out_data = data;
    
    
    initial begin
        data = gdo_add(8'b0000_1000, 8'b0000_1000);
        $write("add : %b\n", gdo_add(-8'b0000_1000, 8'b0000_1000));
        $write("mult : %b\n", gdo_mult(-8'b0000_1000, 8'b0000_1000));
        $write("sub : %b\n", gdo_sub(8'b0000_1000, 8'b0000_1000));
        $write("pow : %b\n", gdo_pow(8'b0010_0000, 8'b0011_0000));
    end
endmodule
