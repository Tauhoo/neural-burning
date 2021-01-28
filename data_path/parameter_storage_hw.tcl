# TCL File Generated by Component Editor 20.1
# Tue Jan 19 18:58:02 ICT 2021
# DO NOT MODIFY


# 
# parameter_storage "parameter_storage" v1.0
# Wacharawit Wacharak 2021.01.19.18:58:02
# Store parameter value
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module parameter_storage
# 
set_module_property DESCRIPTION "Store parameter value"
set_module_property NAME parameter_storage
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP neural_burning/decode_layer
set_module_property AUTHOR "Wacharawit Wacharak"
set_module_property DISPLAY_NAME parameter_storage
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL parameter_storage
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file parameter_storage.sv SYSTEM_VERILOG PATH ../parameter_storage/parameter_storage.sv TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter act_type_size INTEGER 4
set_parameter_property act_type_size DEFAULT_VALUE 4
set_parameter_property act_type_size DISPLAY_NAME act_type_size
set_parameter_property act_type_size TYPE INTEGER
set_parameter_property act_type_size UNITS None
set_parameter_property act_type_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property act_type_size HDL_PARAMETER true
add_parameter dense_type_size INTEGER 4
set_parameter_property dense_type_size DEFAULT_VALUE 4
set_parameter_property dense_type_size DISPLAY_NAME dense_type_size
set_parameter_property dense_type_size TYPE INTEGER
set_parameter_property dense_type_size UNITS None
set_parameter_property dense_type_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property dense_type_size HDL_PARAMETER true
add_parameter cost_type_size INTEGER 4
set_parameter_property cost_type_size DEFAULT_VALUE 4
set_parameter_property cost_type_size DISPLAY_NAME cost_type_size
set_parameter_property cost_type_size TYPE INTEGER
set_parameter_property cost_type_size UNITS None
set_parameter_property cost_type_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property cost_type_size HDL_PARAMETER true
add_parameter learning_rate_size INTEGER 16
set_parameter_property learning_rate_size DEFAULT_VALUE 16
set_parameter_property learning_rate_size DISPLAY_NAME learning_rate_size
set_parameter_property learning_rate_size TYPE INTEGER
set_parameter_property learning_rate_size UNITS None
set_parameter_property learning_rate_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property learning_rate_size HDL_PARAMETER true


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

add_interface_port in_parameter_interface in_act_type act_type Input act_type_size
add_interface_port in_parameter_interface in_cost_type cost_type Input cost_type_size
add_interface_port in_parameter_interface in_dense_type dense_type Input dense_type_size
add_interface_port in_parameter_interface in_learning_rate learning_rate Input learning_rate_size


# 
# connection point is_update_parameter_interface
# 
add_interface is_update_parameter_interface conduit end
set_interface_property is_update_parameter_interface associatedClock ""
set_interface_property is_update_parameter_interface associatedReset ""
set_interface_property is_update_parameter_interface ENABLED true
set_interface_property is_update_parameter_interface EXPORT_OF ""
set_interface_property is_update_parameter_interface PORT_NAME_MAP ""
set_interface_property is_update_parameter_interface CMSIS_SVD_VARIABLES ""
set_interface_property is_update_parameter_interface SVD_ADDRESS_GROUP ""

add_interface_port is_update_parameter_interface update_act_type set_act_type Input 1
add_interface_port is_update_parameter_interface update_cost_type set_cost_type Input 1
add_interface_port is_update_parameter_interface update_dense_type set_dense_type Input 1
add_interface_port is_update_parameter_interface update_learning_rate set_learning_rate Input 1


# 
# connection point out_parameter_interface
# 
add_interface out_parameter_interface conduit end
set_interface_property out_parameter_interface associatedClock ""
set_interface_property out_parameter_interface associatedReset ""
set_interface_property out_parameter_interface ENABLED true
set_interface_property out_parameter_interface EXPORT_OF ""
set_interface_property out_parameter_interface PORT_NAME_MAP ""
set_interface_property out_parameter_interface CMSIS_SVD_VARIABLES ""
set_interface_property out_parameter_interface SVD_ADDRESS_GROUP ""

add_interface_port out_parameter_interface out_act_type act_type Output act_type_size
add_interface_port out_parameter_interface out_dense_type dense_type Output dense_type_size
add_interface_port out_parameter_interface out_cost_type cost_type Output cost_type_size


# 
# connection point learning_rate_interface
# 
add_interface learning_rate_interface conduit end
set_interface_property learning_rate_interface associatedClock ""
set_interface_property learning_rate_interface associatedReset ""
set_interface_property learning_rate_interface ENABLED true
set_interface_property learning_rate_interface EXPORT_OF ""
set_interface_property learning_rate_interface PORT_NAME_MAP ""
set_interface_property learning_rate_interface CMSIS_SVD_VARIABLES ""
set_interface_property learning_rate_interface SVD_ADDRESS_GROUP ""

add_interface_port learning_rate_interface out_learning_rate learning_rate Output learning_rate_size

