# TCL File Generated by Component Editor 20.1
# Thu Jan 28 14:54:30 ICT 2021
# DO NOT MODIFY


# 
# differ "differ" v1.0
# Wachiraiwt Wacharak 2021.01.28.14:54:30
# Calculating difference component
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module differ
# 
set_module_property DESCRIPTION "Calculating difference component"
set_module_property NAME differ
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP neural_burning/diff_layer
set_module_property AUTHOR "Wachiraiwt Wacharak"
set_module_property DISPLAY_NAME differ
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL different
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file diff_cost.sv SYSTEM_VERILOG PATH ../different/diff_cost.sv
add_fileset_file diff_dense.sv SYSTEM_VERILOG PATH ../different/diff_dense.sv
add_fileset_file diff_start.sv SYSTEM_VERILOG PATH ../different/diff_start.sv
add_fileset_file diff_to_all.sv SYSTEM_VERILOG PATH ../different/diff_to_all.sv
add_fileset_file different.sv SYSTEM_VERILOG PATH ../different/different.sv TOP_LEVEL_FILE
add_fileset_file gdo.sv SYSTEM_VERILOG PATH ../general_data_operator/src/gdo.sv


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
add_parameter cost_type_size INTEGER 8 ""
set_parameter_property cost_type_size DEFAULT_VALUE 8
set_parameter_property cost_type_size DISPLAY_NAME cost_type_size
set_parameter_property cost_type_size TYPE INTEGER
set_parameter_property cost_type_size UNITS None
set_parameter_property cost_type_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property cost_type_size DESCRIPTION ""
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
# connection point in_parameter_interface
# 
add_interface in_parameter_interface conduit end
set_interface_property in_parameter_interface associatedClock ""
set_interface_property in_parameter_interface associatedReset ""
set_interface_property in_parameter_interface ENABLED true
set_interface_property in_parameter_interface EXPORT_OF ""
set_interface_property in_parameter_interface PORT_NAME_MAP ""
set_interface_property in_parameter_interface CMSIS_SVD_VARIABLES ""
set_interface_property in_parameter_interface SVD_ADDRESS_GROUP ""

add_interface_port in_parameter_interface cost_type cost_type Input cost_type_size
add_interface_port in_parameter_interface predict_value label Input size*data_size
add_interface_port in_parameter_interface weight w Input size*data_size
add_interface_port in_parameter_interface x x Input size*data_size
add_interface_port in_parameter_interface z z Input size*data_size
add_interface_port in_parameter_interface dense_type dense_type Input dense_type_size


# 
# connection point diff_interface
# 
add_interface diff_interface conduit end
set_interface_property diff_interface associatedClock ""
set_interface_property diff_interface associatedReset ""
set_interface_property diff_interface ENABLED true
set_interface_property diff_interface EXPORT_OF ""
set_interface_property diff_interface PORT_NAME_MAP ""
set_interface_property diff_interface CMSIS_SVD_VARIABLES ""
set_interface_property diff_interface SVD_ADDRESS_GROUP ""

add_interface_port diff_interface diff_dense_out diff_dense Output size*data_size
add_interface_port diff_interface diff_start_out diff_start Output size*data_size
add_interface_port diff_interface diff_to_all_out diff_to_all Output size*data_size
add_interface_port diff_interface diff_cost_out diff_cost Output size*data_size


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

add_interface_port in_forward_interface z_out z Output size*data_size
add_interface_port in_forward_interface predict_value_out label Output size*data_size

