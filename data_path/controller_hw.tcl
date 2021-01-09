# TCL File Generated by Component Editor 20.1
# Sat Jan 09 14:45:10 ICT 2021
# DO NOT MODIFY


# 
# controller "controller" v1.0
# Wachirawit Wacharak 2021.01.09.14:45:10
# Use to drive control signal
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module controller
# 
set_module_property DESCRIPTION "Use to drive control signal"
set_module_property NAME controller
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP neural_burning/decode_layer
set_module_property AUTHOR "Wachirawit Wacharak"
set_module_property DISPLAY_NAME controller
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL controller
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file controller.sv SYSTEM_VERILOG PATH ../controller/controller.sv TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter op_size INTEGER 4
set_parameter_property op_size DEFAULT_VALUE 4
set_parameter_property op_size DISPLAY_NAME op_size
set_parameter_property op_size TYPE INTEGER
set_parameter_property op_size UNITS None
set_parameter_property op_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property op_size HDL_PARAMETER true
add_parameter size INTEGER 3
set_parameter_property size DEFAULT_VALUE 3
set_parameter_property size DISPLAY_NAME size
set_parameter_property size TYPE INTEGER
set_parameter_property size UNITS None
set_parameter_property size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property size HDL_PARAMETER true


# 
# display items
# 


# 
# connection point forward_control_interface
# 
add_interface forward_control_interface conduit end
set_interface_property forward_control_interface associatedClock ""
set_interface_property forward_control_interface associatedReset ""
set_interface_property forward_control_interface ENABLED true
set_interface_property forward_control_interface EXPORT_OF ""
set_interface_property forward_control_interface PORT_NAME_MAP ""
set_interface_property forward_control_interface CMSIS_SVD_VARIABLES ""
set_interface_property forward_control_interface SVD_ADDRESS_GROUP ""

add_interface_port forward_control_interface is_update is_update Output 1
add_interface_port forward_control_interface load_w load_w Output 1
add_interface_port forward_control_interface backprop_cost backprop_cost Output 1
add_interface_port forward_control_interface is_cost_layer is_cost_layer Output 1


# 
# connection point i_is_load_interface
# 
add_interface i_is_load_interface conduit end
set_interface_property i_is_load_interface associatedClock ""
set_interface_property i_is_load_interface associatedReset ""
set_interface_property i_is_load_interface ENABLED true
set_interface_property i_is_load_interface EXPORT_OF ""
set_interface_property i_is_load_interface PORT_NAME_MAP ""
set_interface_property i_is_load_interface CMSIS_SVD_VARIABLES ""
set_interface_property i_is_load_interface SVD_ADDRESS_GROUP ""

add_interface_port i_is_load_interface i_is_load is_load Output 1


# 
# connection point weigth_interface
# 
add_interface weigth_interface conduit end
set_interface_property weigth_interface associatedClock ""
set_interface_property weigth_interface associatedReset ""
set_interface_property weigth_interface ENABLED true
set_interface_property weigth_interface EXPORT_OF ""
set_interface_property weigth_interface PORT_NAME_MAP ""
set_interface_property weigth_interface CMSIS_SVD_VARIABLES ""
set_interface_property weigth_interface SVD_ADDRESS_GROUP ""

add_interface_port weigth_interface w_layer_index w_layer_index Output 32
add_interface_port weigth_interface w_row_index w_row_index Output 32
add_interface_port weigth_interface is_load is_load Output 1


# 
# connection point code_count_reset_interface
# 
add_interface code_count_reset_interface conduit end
set_interface_property code_count_reset_interface associatedClock ""
set_interface_property code_count_reset_interface associatedReset ""
set_interface_property code_count_reset_interface ENABLED true
set_interface_property code_count_reset_interface EXPORT_OF ""
set_interface_property code_count_reset_interface PORT_NAME_MAP ""
set_interface_property code_count_reset_interface CMSIS_SVD_VARIABLES ""
set_interface_property code_count_reset_interface SVD_ADDRESS_GROUP ""

add_interface_port code_count_reset_interface reset reset Output 1


# 
# connection point use_z_interface
# 
add_interface use_z_interface conduit end
set_interface_property use_z_interface associatedClock ""
set_interface_property use_z_interface associatedReset ""
set_interface_property use_z_interface ENABLED true
set_interface_property use_z_interface EXPORT_OF ""
set_interface_property use_z_interface PORT_NAME_MAP ""
set_interface_property use_z_interface CMSIS_SVD_VARIABLES ""
set_interface_property use_z_interface SVD_ADDRESS_GROUP ""

add_interface_port use_z_interface use_z use_z Output 1


# 
# connection point code_index_interface
# 
add_interface code_index_interface conduit end
set_interface_property code_index_interface associatedClock ""
set_interface_property code_index_interface associatedReset ""
set_interface_property code_index_interface ENABLED true
set_interface_property code_index_interface EXPORT_OF ""
set_interface_property code_index_interface PORT_NAME_MAP ""
set_interface_property code_index_interface CMSIS_SVD_VARIABLES ""
set_interface_property code_index_interface SVD_ADDRESS_GROUP ""

add_interface_port code_index_interface code_index code_index Input 32


# 
# connection point code_count_interface
# 
add_interface code_count_interface conduit end
set_interface_property code_count_interface associatedClock ""
set_interface_property code_count_interface associatedReset ""
set_interface_property code_count_interface ENABLED true
set_interface_property code_count_interface EXPORT_OF ""
set_interface_property code_count_interface PORT_NAME_MAP ""
set_interface_property code_count_interface CMSIS_SVD_VARIABLES ""
set_interface_property code_count_interface SVD_ADDRESS_GROUP ""

add_interface_port code_count_interface code_count code_count Input 32


# 
# connection point op_interface
# 
add_interface op_interface conduit end
set_interface_property op_interface associatedClock ""
set_interface_property op_interface associatedReset ""
set_interface_property op_interface ENABLED true
set_interface_property op_interface EXPORT_OF ""
set_interface_property op_interface PORT_NAME_MAP ""
set_interface_property op_interface CMSIS_SVD_VARIABLES ""
set_interface_property op_interface SVD_ADDRESS_GROUP ""

add_interface_port op_interface op op Input op_size


# 
# connection point code_control_interface
# 
add_interface code_control_interface conduit end
set_interface_property code_control_interface associatedClock ""
set_interface_property code_control_interface associatedReset ""
set_interface_property code_control_interface ENABLED true
set_interface_property code_control_interface EXPORT_OF ""
set_interface_property code_control_interface PORT_NAME_MAP ""
set_interface_property code_control_interface CMSIS_SVD_VARIABLES ""
set_interface_property code_control_interface SVD_ADDRESS_GROUP ""

add_interface_port code_control_interface code_active active Output 1
add_interface_port code_control_interface code_reset reset Output 1


# 
# connection point enable_interface
# 
add_interface enable_interface conduit end
set_interface_property enable_interface associatedClock ""
set_interface_property enable_interface associatedReset ""
set_interface_property enable_interface ENABLED true
set_interface_property enable_interface EXPORT_OF ""
set_interface_property enable_interface PORT_NAME_MAP ""
set_interface_property enable_interface CMSIS_SVD_VARIABLES ""
set_interface_property enable_interface SVD_ADDRESS_GROUP ""

add_interface_port enable_interface enable enable Input 1

