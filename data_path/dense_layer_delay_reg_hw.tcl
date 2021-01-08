# TCL File Generated by Component Editor 20.1
# Thu Jan 07 22:42:44 ICT 2021
# DO NOT MODIFY


# 
# dense_layer_delay_reg "dense_layer_delay_reg" v1.0
# Wachirawit Wacharak 2021.01.07.22:42:44
# Use to delay signal in dense layer
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module dense_layer_delay_reg
# 
set_module_property DESCRIPTION "Use to delay signal in dense layer"
set_module_property NAME dense_layer_delay_reg
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP neural_burning/dense_layer
set_module_property AUTHOR "Wachirawit Wacharak"
set_module_property DISPLAY_NAME dense_layer_delay_reg
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL dense_layer_delay_reg
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file dense_layer_delay_reg.sv SYSTEM_VERILOG PATH ../register_delay/registers/dense_layer_delay_reg.sv TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter size INTEGER 3
set_parameter_property size DEFAULT_VALUE 3
set_parameter_property size DISPLAY_NAME size
set_parameter_property size TYPE INTEGER
set_parameter_property size UNITS None
set_parameter_property size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property size HDL_PARAMETER true
add_parameter data_size INTEGER 16
set_parameter_property data_size DEFAULT_VALUE 16
set_parameter_property data_size DISPLAY_NAME data_size
set_parameter_property data_size TYPE INTEGER
set_parameter_property data_size UNITS None
set_parameter_property data_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property data_size HDL_PARAMETER true
add_parameter cost_type_size INTEGER 8
set_parameter_property cost_type_size DEFAULT_VALUE 8
set_parameter_property cost_type_size DISPLAY_NAME cost_type_size
set_parameter_property cost_type_size TYPE INTEGER
set_parameter_property cost_type_size UNITS None
set_parameter_property cost_type_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property cost_type_size HDL_PARAMETER true
add_parameter dense_type_size INTEGER 4
set_parameter_property dense_type_size DEFAULT_VALUE 4
set_parameter_property dense_type_size DISPLAY_NAME dense_type_size
set_parameter_property dense_type_size TYPE INTEGER
set_parameter_property dense_type_size UNITS None
set_parameter_property dense_type_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property dense_type_size HDL_PARAMETER true
add_parameter act_type_size INTEGER 4
set_parameter_property act_type_size DEFAULT_VALUE 4
set_parameter_property act_type_size DISPLAY_NAME act_type_size
set_parameter_property act_type_size TYPE INTEGER
set_parameter_property act_type_size UNITS None
set_parameter_property act_type_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property act_type_size HDL_PARAMETER true
add_parameter cycle INTEGER 1
set_parameter_property cycle DEFAULT_VALUE 1
set_parameter_property cycle DISPLAY_NAME cycle
set_parameter_property cycle TYPE INTEGER
set_parameter_property cycle UNITS None
set_parameter_property cycle ALLOWED_RANGES -2147483648:2147483647
set_parameter_property cycle HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point x_and_w_interface
# 
add_interface x_and_w_interface conduit end
set_interface_property x_and_w_interface associatedClock ""
set_interface_property x_and_w_interface associatedReset ""
set_interface_property x_and_w_interface ENABLED true
set_interface_property x_and_w_interface EXPORT_OF ""
set_interface_property x_and_w_interface PORT_NAME_MAP ""
set_interface_property x_and_w_interface CMSIS_SVD_VARIABLES ""
set_interface_property x_and_w_interface SVD_ADDRESS_GROUP ""

add_interface_port x_and_w_interface w w Input data_size*size
add_interface_port x_and_w_interface x x Input data_size*size


# 
# connection point out_forward_signal_interface
# 
add_interface out_forward_signal_interface conduit end
set_interface_property out_forward_signal_interface associatedClock ""
set_interface_property out_forward_signal_interface associatedReset ""
set_interface_property out_forward_signal_interface ENABLED true
set_interface_property out_forward_signal_interface EXPORT_OF ""
set_interface_property out_forward_signal_interface PORT_NAME_MAP ""
set_interface_property out_forward_signal_interface CMSIS_SVD_VARIABLES ""
set_interface_property out_forward_signal_interface SVD_ADDRESS_GROUP ""

add_interface_port out_forward_signal_interface act_type_out act_type Output act_type_size
add_interface_port out_forward_signal_interface backprop_cost_out backprop_cost Output 1
add_interface_port out_forward_signal_interface cost_type_out cost_type Output cost_type_size
add_interface_port out_forward_signal_interface dense_type_out dense_type Output dense_type_size
add_interface_port out_forward_signal_interface is_update_out is_update Output 1
add_interface_port out_forward_signal_interface w_layer_index_out w_layer_index Output 32
add_interface_port out_forward_signal_interface w_out w Output data_size*size
add_interface_port out_forward_signal_interface x_out x Output data_size*size
add_interface_port out_forward_signal_interface w_row_index_out w_row_index Output 32
add_interface_port out_forward_signal_interface predict_value_out label Output data_size*size


# 
# connection point in_forward_signal_interface
# 
add_interface in_forward_signal_interface conduit end
set_interface_property in_forward_signal_interface associatedClock ""
set_interface_property in_forward_signal_interface associatedReset ""
set_interface_property in_forward_signal_interface ENABLED true
set_interface_property in_forward_signal_interface EXPORT_OF ""
set_interface_property in_forward_signal_interface PORT_NAME_MAP ""
set_interface_property in_forward_signal_interface CMSIS_SVD_VARIABLES ""
set_interface_property in_forward_signal_interface SVD_ADDRESS_GROUP ""

add_interface_port in_forward_signal_interface act_type act_type Input act_type_size
add_interface_port in_forward_signal_interface backprop_cost backprop_cost Input 1
add_interface_port in_forward_signal_interface cost_type cost_type Input cost_type_size
add_interface_port in_forward_signal_interface is_update is_update Input 1
add_interface_port in_forward_signal_interface w_layer_index w_layer_index Input 32
add_interface_port in_forward_signal_interface w_row_index w_row_index Input 32
add_interface_port in_forward_signal_interface predict_value label Input data_size*size


# 
# connection point in_dense_type_interface
# 
add_interface in_dense_type_interface conduit end
set_interface_property in_dense_type_interface associatedClock ""
set_interface_property in_dense_type_interface associatedReset ""
set_interface_property in_dense_type_interface ENABLED true
set_interface_property in_dense_type_interface EXPORT_OF ""
set_interface_property in_dense_type_interface PORT_NAME_MAP ""
set_interface_property in_dense_type_interface CMSIS_SVD_VARIABLES ""
set_interface_property in_dense_type_interface SVD_ADDRESS_GROUP ""

add_interface_port in_dense_type_interface dense_type dense_type Input dense_type_size
