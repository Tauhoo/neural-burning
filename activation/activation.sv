module activation(in_data, activtion, out_data);
    parameter data_size = 16;
    parameter size = 3;
    parameter activate_size = 4;

	input [data_size*size - 1:0] in_data;
    input [activate_size - 1:0] activtion;
    
    output  [data_size*size - 1:0] out_data;

    assign out_data = in_data;

endmodule
