
module data_path (
	clk_clk,
	code_storage_code_control_interface_active,
	code_storage_code_control_interface_reset,
	code_storage_write_interface_write_data,
	code_storage_write_interface_is_write,
	code_storage_write_interface_write_line,
	fetch_to_decode_register_code_index_out_interface_code_index,
	parse_clock_source_clk,
	parse_op_interface_op,
	parse_parameter_type_interface_act_type,
	parse_parameter_type_interface_dense_type,
	parse_parameter_type_interface_cost_type,
	reset_reset_n);	

	input		clk_clk;
	input		code_storage_code_control_interface_active;
	input		code_storage_code_control_interface_reset;
	input	[11:0]	code_storage_write_interface_write_data;
	input		code_storage_write_interface_is_write;
	input	[31:0]	code_storage_write_interface_write_line;
	output	[31:0]	fetch_to_decode_register_code_index_out_interface_code_index;
	output		parse_clock_source_clk;
	output	[3:0]	parse_op_interface_op;
	output	[3:0]	parse_parameter_type_interface_act_type;
	output	[3:0]	parse_parameter_type_interface_dense_type;
	output	[7:0]	parse_parameter_type_interface_cost_type;
	input		reset_reset_n;
endmodule
