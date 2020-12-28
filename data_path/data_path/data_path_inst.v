	data_path u0 (
		.clk_clk                                                      (<connected-to-clk_clk>),                                                      //                                               clk.clk
		.code_storage_code_control_interface_active                   (<connected-to-code_storage_code_control_interface_active>),                   //               code_storage_code_control_interface.active
		.code_storage_code_control_interface_reset                    (<connected-to-code_storage_code_control_interface_reset>),                    //                                                  .reset
		.code_storage_write_interface_write_data                      (<connected-to-code_storage_write_interface_write_data>),                      //                      code_storage_write_interface.write_data
		.code_storage_write_interface_is_write                        (<connected-to-code_storage_write_interface_is_write>),                        //                                                  .is_write
		.code_storage_write_interface_write_line                      (<connected-to-code_storage_write_interface_write_line>),                      //                                                  .write_line
		.fetch_to_decode_register_code_index_out_interface_code_index (<connected-to-fetch_to_decode_register_code_index_out_interface_code_index>), // fetch_to_decode_register_code_index_out_interface.code_index
		.parse_clock_source_clk                                       (<connected-to-parse_clock_source_clk>),                                       //                                parse_clock_source.clk
		.parse_op_interface_op                                        (<connected-to-parse_op_interface_op>),                                        //                                parse_op_interface.op
		.parse_parameter_type_interface_act_type                      (<connected-to-parse_parameter_type_interface_act_type>),                      //                    parse_parameter_type_interface.act_type
		.parse_parameter_type_interface_dense_type                    (<connected-to-parse_parameter_type_interface_dense_type>),                    //                                                  .dense_type
		.parse_parameter_type_interface_cost_type                     (<connected-to-parse_parameter_type_interface_cost_type>),                     //                                                  .cost_type
		.reset_reset_n                                                (<connected-to-reset_reset_n>)                                                 //                                             reset.reset_n
	);

