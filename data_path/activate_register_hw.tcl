# TCL File Generated by Component Editor 20.1
# Sat Jan 09 00:50:06 ICT 2021
# DO NOT MODIFY


# 
# activate_to_diff_register "activate_to_diff_register" v1.0
# Wachirawit Wacharak 2021.01.09.00:50:06
# Buffer data between activation layer to diff layer
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module activate_to_diff_register
# 
set_module_property DESCRIPTION "Buffer data between activation layer to diff layer"
set_module_property NAME activate_to_diff_register
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP neural_burning/registers
set_module_property AUTHOR "Wachirawit Wacharak"
set_module_property DISPLAY_NAME activate_to_diff_register
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL activate_diff_reg
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file activate_diff_reg.sv SYSTEM_VERILOG PATH ../register_delay/registers/activate_diff_reg.sv TOP_LEVEL_FILE
add_fileset_file delay.sv SYSTEM_VERILOG PATH ../register_delay/delay.sv


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
# connection point in_forward_interface
# 
add_interface in_forward_interface conduit end
set_interface_property in_forward_interface associatedClock ""
set_interface_property in_forward_interface associatedReset ""
set_interface_property in_forward_interface ENABLED true
set_interface_property in_forward_interface EXPORT_OF ""
set_interface_property in_forward_interface PORT_NAME_MAP ""
set_interface_property in_forward_interface CMSIS_SVD_VARIABLES ""
set_interface_property in_forward_interface SVD_ADDRESS_GROUP ""

add_interface_port in_forward_interface backprop_cost backprop_cost Input 1
add_interface_port in_forward_interface cost_type cost_type Input cost_type_size
add_interface_port in_forward_interface dense_type dense_type Input dense_type_size
add_interface_port in_forward_interface is_update is_update Input 1
add_interface_port in_forward_interface w w Input data_size*size
add_interface_port in_forward_interface w_layer_index w_layer_index Input 32
add_interface_port in_forward_interface w_row_index w_row_index Input 32
add_interface_port in_forward_interface x x Input data_size*size
add_interface_port in_forward_interface predict_value label Input data_size*size
add_interface_port in_forward_interface is_cost_layer is_cost_layer Input 1


# 
# connection point in_z_interface
# 
add_interface in_z_interface conduit end
set_interface_property in_z_interface associatedClock ""
set_interface_property in_z_interface associatedReset ""
set_interface_property in_z_interface ENABLED true
set_interface_property in_z_interface EXPORT_OF ""
set_interface_property in_z_interface PORT_NAME_MAP ""
set_interface_property in_z_interface CMSIS_SVD_VARIABLES ""
set_interface_property in_z_interface SVD_ADDRESS_GROUP ""

add_interface_port in_z_interface z z Input data_size*size


# 
# connection point out_forward_interface
# 
add_interface out_forward_interface conduit end
set_interface_property out_forward_interface associatedClock ""
set_interface_property out_forward_interface associatedReset ""
set_interface_property out_forward_interface ENABLED true
set_interface_property out_forward_interface EXPORT_OF ""
set_interface_property out_forward_interface PORT_NAME_MAP ""
set_interface_property out_forward_interface CMSIS_SVD_VARIABLES ""
set_interface_property out_forward_interface SVD_ADDRESS_GROUP ""

add_interface_port out_forward_interface backprop_cost_out backprop_cost Output 1
add_interface_port out_forward_interface w_row_index_out w_row_index Output 32
add_interface_port out_forward_interface is_update_out is_update Output 1
add_interface_port out_forward_interface w_layer_index_out w_layer_index Output 32
add_interface_port out_forward_interface is_cost_layer_out is_cost_layer Output 1


# 
# connection point out_differ_interface
# 
add_interface out_differ_interface conduit end
set_interface_property out_differ_interface associatedClock ""
set_interface_property out_differ_interface associatedReset ""
set_interface_property out_differ_interface ENABLED true
set_interface_property out_differ_interface EXPORT_OF ""
set_interface_property out_differ_interface PORT_NAME_MAP ""
set_interface_property out_differ_interface CMSIS_SVD_VARIABLES ""
set_interface_property out_differ_interface SVD_ADDRESS_GROUP ""

add_interface_port out_differ_interface cost_type_out cost_type Output cost_type_size
add_interface_port out_differ_interface w_out w Output data_size*size
add_interface_port out_differ_interface x_out x Output data_size*size
add_interface_port out_differ_interface z_out z Output data_size*size
add_interface_port out_differ_interface predict_value_out label Output data_size*size
add_interface_port out_differ_interface dense_type_out dense_type Output dense_type_size

