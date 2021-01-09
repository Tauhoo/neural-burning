	data_path u0 (
		.clk_clk                                              (<connected-to-clk_clk>),                                              //                                     clk.clk
		.code_storage_enable_interface_enable                 (<connected-to-code_storage_enable_interface_enable>),                 //           code_storage_enable_interface.enable
		.code_storage_write_interface_write_data              (<connected-to-code_storage_write_interface_write_data>),              //            code_storage_write_interface.write_data
		.code_storage_write_interface_is_write                (<connected-to-code_storage_write_interface_is_write>),                //                                        .is_write
		.code_storage_write_interface_write_line              (<connected-to-code_storage_write_interface_write_line>),              //                                        .write_line
		.controller_enable_interface_enable                   (<connected-to-controller_enable_interface_enable>),                   //             controller_enable_interface.enable
		.controller_use_z_interface_use_z                     (<connected-to-controller_use_z_interface_use_z>),                     //              controller_use_z_interface.use_z
		.input_storage_is_write_interface_is_write            (<connected-to-input_storage_is_write_interface_is_write>),            //        input_storage_is_write_interface.is_write
		.input_storage_write_interface_write_layer_index      (<connected-to-input_storage_write_interface_write_layer_index>),      //           input_storage_write_interface.write_layer_index
		.input_storage_write_interface_write_row_index        (<connected-to-input_storage_write_interface_write_row_index>),        //                                        .write_row_index
		.input_storage_write_interface_write_data             (<connected-to-input_storage_write_interface_write_data>),             //                                        .write_data
		.label_storage_is_write_interface_is_write            (<connected-to-label_storage_is_write_interface_is_write>),            //        label_storage_is_write_interface.is_write
		.label_storage_write_interface_write_layer_index      (<connected-to-label_storage_write_interface_write_layer_index>),      //           label_storage_write_interface.write_layer_index
		.label_storage_write_interface_write_row_index        (<connected-to-label_storage_write_interface_write_row_index>),        //                                        .write_row_index
		.label_storage_write_interface_write_data             (<connected-to-label_storage_write_interface_write_data>),             //                                        .write_data
		.matrix_storage_locator_reset_interface_reset         (<connected-to-matrix_storage_locator_reset_interface_reset>),         //  matrix_storage_locator_reset_interface.reset
		.reset_reset_n                                        (<connected-to-reset_reset_n>),                                        //                                   reset.reset_n
		.weight_storage_is_update_interface_is_update         (<connected-to-weight_storage_is_update_interface_is_update>),         //      weight_storage_is_update_interface.is_update
		.weight_storage_is_write_interface_is_write           (<connected-to-weight_storage_is_write_interface_is_write>),           //       weight_storage_is_write_interface.is_write
		.weight_storage_update_weight_interface_dc_dw         (<connected-to-weight_storage_update_weight_interface_dc_dw>),         //  weight_storage_update_weight_interface.dc_dw
		.weight_storage_update_weight_interface_layer_index   (<connected-to-weight_storage_update_weight_interface_layer_index>),   //                                        .layer_index
		.weight_storage_update_weight_interface_row_index     (<connected-to-weight_storage_update_weight_interface_row_index>),     //                                        .row_index
		.weight_storage_write_interface_write_layer_index     (<connected-to-weight_storage_write_interface_write_layer_index>),     //          weight_storage_write_interface.write_layer_index
		.weight_storage_write_interface_write_row_index       (<connected-to-weight_storage_write_interface_write_row_index>),       //                                        .write_row_index
		.weight_storage_write_interface_write_data            (<connected-to-weight_storage_write_interface_write_data>),            //                                        .write_data
		.backpropagator_0_dc_dw_stream_interface_dc_dw_stream (<connected-to-backpropagator_0_dc_dw_stream_interface_dc_dw_stream>)  // backpropagator_0_dc_dw_stream_interface.dc_dw_stream
	);

