	data_path u0 (
		.clk_clk                                                      (<connected-to-clk_clk>),                                                      //                                               clk.clk
		.code_storage_enable_interface_enable                         (<connected-to-code_storage_enable_interface_enable>),                         //                     code_storage_enable_interface.enable
		.code_storage_write_interface_write_data                      (<connected-to-code_storage_write_interface_write_data>),                      //                      code_storage_write_interface.write_data
		.code_storage_write_interface_is_write                        (<connected-to-code_storage_write_interface_is_write>),                        //                                                  .is_write
		.code_storage_write_interface_write_line                      (<connected-to-code_storage_write_interface_write_line>),                      //                                                  .write_line
		.controller_enable_interface_enable                           (<connected-to-controller_enable_interface_enable>),                           //                       controller_enable_interface.enable
		.fetch_to_decode_register_code_index_out_interface_code_index (<connected-to-fetch_to_decode_register_code_index_out_interface_code_index>), // fetch_to_decode_register_code_index_out_interface.code_index
		.input_storage_is_write_interface_is_write                    (<connected-to-input_storage_is_write_interface_is_write>),                    //                  input_storage_is_write_interface.is_write
		.input_storage_write_interface_write_layer_index              (<connected-to-input_storage_write_interface_write_layer_index>),              //                     input_storage_write_interface.write_layer_index
		.input_storage_write_interface_write_row_index                (<connected-to-input_storage_write_interface_write_row_index>),                //                                                  .write_row_index
		.input_storage_write_interface_write_data                     (<connected-to-input_storage_write_interface_write_data>),                     //                                                  .write_data
		.label_storage_is_write_interface_is_write                    (<connected-to-label_storage_is_write_interface_is_write>),                    //                  label_storage_is_write_interface.is_write
		.label_storage_write_interface_write_layer_index              (<connected-to-label_storage_write_interface_write_layer_index>),              //                     label_storage_write_interface.write_layer_index
		.label_storage_write_interface_write_row_index                (<connected-to-label_storage_write_interface_write_row_index>),                //                                                  .write_row_index
		.label_storage_write_interface_write_data                     (<connected-to-label_storage_write_interface_write_data>),                     //                                                  .write_data
		.matrix_storage_locator_reset_interface_reset                 (<connected-to-matrix_storage_locator_reset_interface_reset>),                 //            matrix_storage_locator_reset_interface.reset
		.parameter_storage_0_learning_rate_interface_learning_rate    (<connected-to-parameter_storage_0_learning_rate_interface_learning_rate>),    //       parameter_storage_0_learning_rate_interface.learning_rate
		.reset_reset_n                                                (<connected-to-reset_reset_n>),                                                //                                             reset.reset_n
		.weight_storage_is_write_interface_is_write                   (<connected-to-weight_storage_is_write_interface_is_write>),                   //                 weight_storage_is_write_interface.is_write
		.weight_storage_write_interface_write_layer_index             (<connected-to-weight_storage_write_interface_write_layer_index>),             //                    weight_storage_write_interface.write_layer_index
		.weight_storage_write_interface_write_row_index               (<connected-to-weight_storage_write_interface_write_row_index>),               //                                                  .write_row_index
		.weight_storage_write_interface_write_data                    (<connected-to-weight_storage_write_interface_write_data>)                     //                                                  .write_data
	);

