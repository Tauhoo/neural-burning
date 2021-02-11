// synthesis VERILOG_INPUT_VERSION SYSTEMVERILOG_2005
module general_data_operator (out_data);
    import gdo::gdo_add;
	import gdo::gdo_mult;
    //import gdo::gdo_pow;
    import gdo::gdo_div;
    import gdo::gdo_sigmoid;
    import gdo::gdo_tanh;
    import gdo::gdo_binary;
    import gdo::gdo_e;
    import gdo::gdo_one;
    import gdo::gdo_zero;

    output [16:0] out_data;
    reg [16:0] data;
    
    assign out_data = data;
    initial begin
        data = 3;
        data = gdo_add(16, 16);
        $write("in data : %d\n", (-1)*3*(2**8) << 1);
        $write("add : %d\n", gdo_add(16, 16));
        $write("mult : %d\n", gdo_mult(-128, 128));
        $write("sub : %d\n", gdo_div(1024, 768));
        $write("sub : %d\n", gdo_div(1280, 768));
        $write("sigmoid : %d %b\n", gdo_sigmoid((1)*3*(2**8)), (-1)*3*(2**8));
        $write("sigmoid : %b\n", gdo_sigmoid(gdo_one >> 1));
        $write("binary : %d\n", gdo_binary((1)*3*(2**8)));
        $write("tanh : %d\n", gdo_tanh((1)*1*(2**8)));
        $write("one : %d , zero : %d\n", gdo_one << 1, gdo_zero);
        // $write("pow : %d\n", gdo.pow(8'b0010_0000, 8'b0011_0000));
    end
endmodule
