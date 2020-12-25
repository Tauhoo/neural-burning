// synthesis VERILOG_INPUT_VERSION SYSTEMVERILOG_2005
module general_data_operator (out_data);
    import gdo::gdo_add;
	import gdo::gdo_mult;

    output [16:0] out_data;
    reg [16:0] data;
    
    assign out_data = data;
    initial begin
        data = 3;
        data = gdo_add(16, 16);
        $write("add : %d\n", gdo_add(16, 16));
        $write("mult : %d\n", gdo_mult(-128, 128));
        // $write("sub : %d\n", gdo.sub(8'b0000_1000, 8'b0000_1000));
        // $write("pow : %d\n", gdo.pow(8'b0010_0000, 8'b0011_0000));
    end
endmodule
