	data_path u0 (
		.clk_clk                                            (<connected-to-clk_clk>),                                            //                                  clk.clk
		.code_storage_enable_interface_enable               (<connected-to-code_storage_enable_interface_enable>),               //        code_storage_enable_interface.enable
		.code_storage_write_interface_write_data            (<connected-to-code_storage_write_interface_write_data>),            //         code_storage_write_interface.write_data
		.code_storage_write_interface_is_write              (<connected-to-code_storage_write_interface_is_write>),              //                                     .is_write
		.code_storage_write_interface_write_line            (<connected-to-code_storage_write_interface_write_line>),            //                                     .write_line
		.controller_forward_control_interface_is_update     (<connected-to-controller_forward_control_interface_is_update>),     // controller_forward_control_interface.is_update
		.controller_forward_control_interface_load_w        (<connected-to-controller_forward_control_interface_load_w>),        //                                     .load_w
		.controller_forward_control_interface_backprop_cost (<connected-to-controller_forward_control_interface_backprop_cost>), //                                     .backprop_cost
		.controller_i_is_load_interface_i_is_load           (<connected-to-controller_i_is_load_interface_i_is_load>),           //       controller_i_is_load_interface.i_is_load
		.controller_use_z_interface_use_z                   (<connected-to-controller_use_z_interface_use_z>),                   //           controller_use_z_interface.use_z
		.controller_weigth_interface_w_layer_index          (<connected-to-controller_weigth_interface_w_layer_index>),          //          controller_weigth_interface.w_layer_index
		.controller_weigth_interface_w_row_index            (<connected-to-controller_weigth_interface_w_row_index>),            //                                     .w_row_index
		.controller_weigth_interface_is_load                (<connected-to-controller_weigth_interface_is_load>),                //                                     .is_load
		.parse_0_parameter_type_interface_act_type          (<connected-to-parse_0_parameter_type_interface_act_type>),          //     parse_0_parameter_type_interface.act_type
		.parse_0_parameter_type_interface_dense_type        (<connected-to-parse_0_parameter_type_interface_dense_type>),        //                                     .dense_type
		.parse_0_parameter_type_interface_cost_type         (<connected-to-parse_0_parameter_type_interface_cost_type>),         //                                     .cost_type
		.reset_reset_n                                      (<connected-to-reset_reset_n>),                                      //                                reset.reset_n
		.controller_enable_interface_enable                 (<connected-to-controller_enable_interface_enable>)                  //          controller_enable_interface.enable
	);

