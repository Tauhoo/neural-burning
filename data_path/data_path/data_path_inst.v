	data_path u0 (
		.clk_clk                                            (<connected-to-clk_clk>),                                            //                                    clk.clk
		.code_storage_enable_interface_enable               (<connected-to-code_storage_enable_interface_enable>),               //          code_storage_enable_interface.enable
		.code_storage_write_interface_write_data            (<connected-to-code_storage_write_interface_write_data>),            //           code_storage_write_interface.write_data
		.code_storage_write_interface_is_write              (<connected-to-code_storage_write_interface_is_write>),              //                                       .is_write
		.code_storage_write_interface_write_line            (<connected-to-code_storage_write_interface_write_line>),            //                                       .write_line
		.controller_enable_interface_enable                 (<connected-to-controller_enable_interface_enable>),                 //            controller_enable_interface.enable
		.controller_forward_control_interface_is_update     (<connected-to-controller_forward_control_interface_is_update>),     //   controller_forward_control_interface.is_update
		.controller_forward_control_interface_load_w        (<connected-to-controller_forward_control_interface_load_w>),        //                                       .load_w
		.controller_forward_control_interface_backprop_cost (<connected-to-controller_forward_control_interface_backprop_cost>), //                                       .backprop_cost
		.controller_use_z_interface_use_z                   (<connected-to-controller_use_z_interface_use_z>),                   //             controller_use_z_interface.use_z
		.controller_weigth_interface_w_layer_index          (<connected-to-controller_weigth_interface_w_layer_index>),          //            controller_weigth_interface.w_layer_index
		.controller_weigth_interface_w_row_index            (<connected-to-controller_weigth_interface_w_row_index>),            //                                       .w_row_index
		.controller_weigth_interface_is_load                (<connected-to-controller_weigth_interface_is_load>),                //                                       .is_load
		.input_storage_is_write_interface_is_write          (<connected-to-input_storage_is_write_interface_is_write>),          //       input_storage_is_write_interface.is_write
		.input_storage_read_data_interface_read_data        (<connected-to-input_storage_read_data_interface_read_data>),        //      input_storage_read_data_interface.read_data
		.input_storage_write_interface_write_layer_index    (<connected-to-input_storage_write_interface_write_layer_index>),    //          input_storage_write_interface.write_layer_index
		.input_storage_write_interface_write_row_index      (<connected-to-input_storage_write_interface_write_row_index>),      //                                       .write_row_index
		.input_storage_write_interface_write_data           (<connected-to-input_storage_write_interface_write_data>),           //                                       .write_data
		.matrix_storage_locator_reset_interface_reset       (<connected-to-matrix_storage_locator_reset_interface_reset>),       // matrix_storage_locator_reset_interface.reset
		.parse_0_parameter_type_interface_act_type          (<connected-to-parse_0_parameter_type_interface_act_type>),          //       parse_0_parameter_type_interface.act_type
		.parse_0_parameter_type_interface_dense_type        (<connected-to-parse_0_parameter_type_interface_dense_type>),        //                                       .dense_type
		.parse_0_parameter_type_interface_cost_type         (<connected-to-parse_0_parameter_type_interface_cost_type>),         //                                       .cost_type
		.reset_reset_n                                      (<connected-to-reset_reset_n>),                                      //                                  reset.reset_n
		.label_storage_write_interface_write_layer_index    (<connected-to-label_storage_write_interface_write_layer_index>),    //          label_storage_write_interface.write_layer_index
		.label_storage_write_interface_write_row_index      (<connected-to-label_storage_write_interface_write_row_index>),      //                                       .write_row_index
		.label_storage_write_interface_write_data           (<connected-to-label_storage_write_interface_write_data>),           //                                       .write_data
		.label_storage_read_data_interface_read_data        (<connected-to-label_storage_read_data_interface_read_data>),        //      label_storage_read_data_interface.read_data
		.label_storage_is_write_interface_is_write          (<connected-to-label_storage_is_write_interface_is_write>)           //       label_storage_is_write_interface.is_write
	);

