
module data_path (
	clk_clk,
	code_storage_enable_interface_enable,
	code_storage_write_interface_write_data,
	code_storage_write_interface_is_write,
	code_storage_write_interface_write_line,
	controller_enable_interface_enable,
	controller_forward_control_interface_is_update,
	controller_forward_control_interface_load_w,
	controller_forward_control_interface_backprop_cost,
	controller_use_z_interface_use_z,
	controller_weigth_interface_w_layer_index,
	controller_weigth_interface_w_row_index,
	controller_weigth_interface_is_load,
	input_storage_is_write_interface_is_write,
	input_storage_read_data_interface_read_data,
	input_storage_write_interface_write_layer_index,
	input_storage_write_interface_write_row_index,
	input_storage_write_interface_write_data,
	matrix_storage_locator_reset_interface_reset,
	parse_0_parameter_type_interface_act_type,
	parse_0_parameter_type_interface_dense_type,
	parse_0_parameter_type_interface_cost_type,
	reset_reset_n,
	label_storage_write_interface_write_layer_index,
	label_storage_write_interface_write_row_index,
	label_storage_write_interface_write_data,
	label_storage_read_data_interface_read_data,
	label_storage_is_write_interface_is_write);	

	input		clk_clk;
	input		code_storage_enable_interface_enable;
	input	[11:0]	code_storage_write_interface_write_data;
	input		code_storage_write_interface_is_write;
	input	[31:0]	code_storage_write_interface_write_line;
	input		controller_enable_interface_enable;
	output		controller_forward_control_interface_is_update;
	output		controller_forward_control_interface_load_w;
	output		controller_forward_control_interface_backprop_cost;
	output		controller_use_z_interface_use_z;
	output		controller_weigth_interface_w_layer_index;
	output		controller_weigth_interface_w_row_index;
	output		controller_weigth_interface_is_load;
	input		input_storage_is_write_interface_is_write;
	output	[47:0]	input_storage_read_data_interface_read_data;
	input	[31:0]	input_storage_write_interface_write_layer_index;
	input	[31:0]	input_storage_write_interface_write_row_index;
	input	[47:0]	input_storage_write_interface_write_data;
	input		matrix_storage_locator_reset_interface_reset;
	output	[3:0]	parse_0_parameter_type_interface_act_type;
	output	[3:0]	parse_0_parameter_type_interface_dense_type;
	output	[7:0]	parse_0_parameter_type_interface_cost_type;
	input		reset_reset_n;
	input	[31:0]	label_storage_write_interface_write_layer_index;
	input	[31:0]	label_storage_write_interface_write_row_index;
	input	[47:0]	label_storage_write_interface_write_data;
	output	[47:0]	label_storage_read_data_interface_read_data;
	input		label_storage_is_write_interface_is_write;
endmodule
