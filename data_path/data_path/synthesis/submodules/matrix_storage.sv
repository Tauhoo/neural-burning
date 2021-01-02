module matrix_storage(
	write_data,
	write_layer_index, 
	write_row_index, 
	is_write,
	read_layer_index, 
	read_row_index, 
	is_read,
	read_data,
	clk
);
	parameter size = 3;
	parameter data_size = 16;
	parameter max_layer = 5;

	input [data_size*size - 1:0] write_data;
	input [31:0] write_layer_index; 
	input [31:0] write_row_index; 
	input is_write;
	input [31:0] read_layer_index; 
	input [31:0] read_row_index; 
	input is_read;
	output [data_size*size - 1:0] read_data;
	input clk;

	reg [data_size - 1:0] storage [0:size - 1] [0:size - 1] [0:max_layer - 1];

	integer index;

	genvar gen_index;
	generate
		for (gen_index = 0; gen_index < size; gen_index = gen_index + 1) begin : set_up_output
			assign read_data[(size - gen_index)*data_size - 1 -: data_size] = is_read ? 
				read_row_index == write_layer_index && read_row_index == write_row_index ? write_data[(size - gen_index)*data_size - 1 -: data_size] : 
				storage[gen_index][read_row_index][read_layer_index]:
			0;
		end
	endgenerate

	always @(posedge clk ) begin
		if (is_write) begin
			//write
			for (index = 0; index < size; index = index + 1) begin
				storage[index][write_row_index][write_layer_index] = write_data[(size - index)*data_size - 1 -: data_size];
			end
		end
	end

endmodule
