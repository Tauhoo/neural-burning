
module data_path (
	clk_clk,
	code_storage_enable_interface_enable,
	code_storage_write_interface_write_data,
	code_storage_write_interface_is_write,
	code_storage_write_interface_write_line,
	controller_enable_interface_enable,
	controller_use_z_interface_use_z,
	input_storage_is_write_interface_is_write,
	input_storage_write_interface_write_layer_index,
	input_storage_write_interface_write_row_index,
	input_storage_write_interface_write_data,
	label_storage_is_write_interface_is_write,
	label_storage_write_interface_write_layer_index,
	label_storage_write_interface_write_row_index,
	label_storage_write_interface_write_data,
	matrix_storage_locator_reset_interface_reset,
	reset_reset_n,
	weight_storage_is_update_interface_is_update,
	weight_storage_is_write_interface_is_write,
	weight_storage_update_weight_interface_dc_dw,
	weight_storage_update_weight_interface_layer_index,
	weight_storage_update_weight_interface_row_index,
	weight_storage_write_interface_write_layer_index,
	weight_storage_write_interface_write_row_index,
	weight_storage_write_interface_write_data,
	decode_to_dense_register_0_out_weight_interface_w_out,
	decode_to_dense_register_0_out_input_interface_x_out,
	decode_to_dense_register_0_out_load_w_interface_load_w_out,
	decode_to_dense_register_0_out_forward_interface_act_type_out,
	decode_to_dense_register_0_out_forward_interface_cost_type_out,
	decode_to_dense_register_0_out_forward_interface_w_layer_index_out,
	decode_to_dense_register_0_out_forward_interface_w_row_index_out,
	decode_to_dense_register_0_out_forward_interface_is_update_out,
	decode_to_dense_register_0_out_forward_interface_backprop_cost_out,
	decode_to_dense_register_0_out_forward_interface_label_out,
	decode_to_dense_register_0_out_dense_type_interface_dense_type_out);	

	input		clk_clk;
	input		code_storage_enable_interface_enable;
	input	[11:0]	code_storage_write_interface_write_data;
	input		code_storage_write_interface_is_write;
	input	[31:0]	code_storage_write_interface_write_line;
	input		controller_enable_interface_enable;
	output		controller_use_z_interface_use_z;
	input		input_storage_is_write_interface_is_write;
	input	[31:0]	input_storage_write_interface_write_layer_index;
	input	[31:0]	input_storage_write_interface_write_row_index;
	input	[47:0]	input_storage_write_interface_write_data;
	input		label_storage_is_write_interface_is_write;
	input	[31:0]	label_storage_write_interface_write_layer_index;
	input	[31:0]	label_storage_write_interface_write_row_index;
	input	[47:0]	label_storage_write_interface_write_data;
	input		matrix_storage_locator_reset_interface_reset;
	input		reset_reset_n;
	input		weight_storage_is_update_interface_is_update;
	input		weight_storage_is_write_interface_is_write;
	input	[47:0]	weight_storage_update_weight_interface_dc_dw;
	input	[31:0]	weight_storage_update_weight_interface_layer_index;
	input	[31:0]	weight_storage_update_weight_interface_row_index;
	input	[31:0]	weight_storage_write_interface_write_layer_index;
	input	[31:0]	weight_storage_write_interface_write_row_index;
	input	[47:0]	weight_storage_write_interface_write_data;
	output	[47:0]	decode_to_dense_register_0_out_weight_interface_w_out;
	output	[47:0]	decode_to_dense_register_0_out_input_interface_x_out;
	output		decode_to_dense_register_0_out_load_w_interface_load_w_out;
	output	[3:0]	decode_to_dense_register_0_out_forward_interface_act_type_out;
	output	[7:0]	decode_to_dense_register_0_out_forward_interface_cost_type_out;
	output	[31:0]	decode_to_dense_register_0_out_forward_interface_w_layer_index_out;
	output	[31:0]	decode_to_dense_register_0_out_forward_interface_w_row_index_out;
	output		decode_to_dense_register_0_out_forward_interface_is_update_out;
	output		decode_to_dense_register_0_out_forward_interface_backprop_cost_out;
	output	[47:0]	decode_to_dense_register_0_out_forward_interface_label_out;
	output	[3:0]	decode_to_dense_register_0_out_dense_type_interface_dense_type_out;
endmodule