
module data_path (
	clk_clk,
	code_storage_enable_interface_enable,
	code_storage_write_interface_write_data,
	code_storage_write_interface_is_write,
	code_storage_write_interface_write_line,
	controller_forward_control_interface_is_update,
	controller_forward_control_interface_load_w,
	controller_forward_control_interface_backprop_cost,
	controller_i_is_load_interface_i_is_load,
	controller_use_z_interface_use_z,
	controller_weigth_interface_w_layer_index,
	controller_weigth_interface_w_row_index,
	controller_weigth_interface_is_load,
	parse_0_parameter_type_interface_act_type,
	parse_0_parameter_type_interface_dense_type,
	parse_0_parameter_type_interface_cost_type,
	reset_reset_n,
	controller_enable_interface_enable);	

	input		clk_clk;
	input		code_storage_enable_interface_enable;
	input	[11:0]	code_storage_write_interface_write_data;
	input		code_storage_write_interface_is_write;
	input	[31:0]	code_storage_write_interface_write_line;
	output		controller_forward_control_interface_is_update;
	output		controller_forward_control_interface_load_w;
	output		controller_forward_control_interface_backprop_cost;
	output		controller_i_is_load_interface_i_is_load;
	output		controller_use_z_interface_use_z;
	output		controller_weigth_interface_w_layer_index;
	output		controller_weigth_interface_w_row_index;
	output		controller_weigth_interface_is_load;
	output	[3:0]	parse_0_parameter_type_interface_act_type;
	output	[3:0]	parse_0_parameter_type_interface_dense_type;
	output	[7:0]	parse_0_parameter_type_interface_cost_type;
	input		reset_reset_n;
	input		controller_enable_interface_enable;
endmodule
