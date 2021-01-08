# TCL File Generated by Component Editor 20.1
# Sun Jan 03 15:43:02 ICT 2021
# DO NOT MODIFY


# 
# weight_interface_spreader "weight_interface_spreader" v1.0
# Wachirawit Wacharak 2021.01.03.15:43:02
# Split weight interface signal
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module weight_interface_spreader
# 
set_module_property DESCRIPTION "Split weight interface signal"
set_module_property NAME weight_interface_spreader
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP neural_burning/decode_layer
set_module_property AUTHOR "Wachirawit Wacharak"
set_module_property DISPLAY_NAME weight_interface_spreader
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL weight_interface_spreader
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file weight_interface_spreader.sv SYSTEM_VERILOG PATH ../spreader/spreaders/weight_interface_spreader.sv TOP_LEVEL_FILE
add_fileset_file spreader.sv SYSTEM_VERILOG PATH ../spreader/spreader.sv


# 
# parameters
# 


# 
# display items
# 


# 
# connection point forward_interface
# 
add_interface forward_interface conduit end
set_interface_property forward_interface associatedClock ""
set_interface_property forward_interface associatedReset ""
set_interface_property forward_interface ENABLED true
set_interface_property forward_interface EXPORT_OF ""
set_interface_property forward_interface PORT_NAME_MAP ""
set_interface_property forward_interface CMSIS_SVD_VARIABLES ""
set_interface_property forward_interface SVD_ADDRESS_GROUP ""

add_interface_port forward_interface w_layer_index_out_forward w_layer_index Output 32
add_interface_port forward_interface w_row_index_out_forward w_row_index Output 32


# 
# connection point weight_control_out_interface
# 
add_interface weight_control_out_interface conduit end
set_interface_property weight_control_out_interface associatedClock ""
set_interface_property weight_control_out_interface associatedReset ""
set_interface_property weight_control_out_interface ENABLED true
set_interface_property weight_control_out_interface EXPORT_OF ""
set_interface_property weight_control_out_interface PORT_NAME_MAP ""
set_interface_property weight_control_out_interface CMSIS_SVD_VARIABLES ""
set_interface_property weight_control_out_interface SVD_ADDRESS_GROUP ""

add_interface_port weight_control_out_interface is_load_out is_load Output 1
add_interface_port weight_control_out_interface w_row_index_out w_row_index Output 32
add_interface_port weight_control_out_interface w_layer_index_out w_layer_index Output 32


# 
# connection point weight_control_interface
# 
add_interface weight_control_interface conduit end
set_interface_property weight_control_interface associatedClock ""
set_interface_property weight_control_interface associatedReset ""
set_interface_property weight_control_interface ENABLED true
set_interface_property weight_control_interface EXPORT_OF ""
set_interface_property weight_control_interface PORT_NAME_MAP ""
set_interface_property weight_control_interface CMSIS_SVD_VARIABLES ""
set_interface_property weight_control_interface SVD_ADDRESS_GROUP ""

add_interface_port weight_control_interface is_load is_load Input 1
add_interface_port weight_control_interface w_layer_index w_layer_index Input 32
add_interface_port weight_control_interface w_row_index w_row_index Input 32
