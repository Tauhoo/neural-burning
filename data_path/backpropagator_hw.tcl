# TCL File Generated by Component Editor 20.1
# Mon Jan 11 00:37:43 ICT 2021
# DO NOT MODIFY


# 
# backpropagator "backpropagator" v1.0
# Wachirawit Wacharak 2021.01.11.00:37:43
# Calculate dC/dw
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module backpropagator
# 
set_module_property DESCRIPTION "Calculate dC/dw"
set_module_property NAME backpropagator
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP neural_burning/backprop_layer
set_module_property AUTHOR "Wachirawit Wacharak"
set_module_property DISPLAY_NAME backpropagator
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL backprop_stack
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file backprop_stack.sv SYSTEM_VERILOG PATH ../backprop_stack/backprop_stack.sv TOP_LEVEL_FILE
add_fileset_file gdo.sv SYSTEM_VERILOG PATH ../general_data_operator/src/gdo.sv


# 
# parameters
# 
add_parameter data_size INTEGER 16 ""
set_parameter_property data_size DEFAULT_VALUE 16
set_parameter_property data_size DISPLAY_NAME data_size
set_parameter_property data_size TYPE INTEGER
set_parameter_property data_size UNITS None
set_parameter_property data_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property data_size DESCRIPTION ""
set_parameter_property data_size HDL_PARAMETER true
add_parameter size INTEGER 3
set_parameter_property size DEFAULT_VALUE 3
set_parameter_property size DISPLAY_NAME size
set_parameter_property size TYPE INTEGER
set_parameter_property size UNITS None
set_parameter_property size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property size HDL_PARAMETER true
add_parameter max_layer_size INTEGER 10 ""
set_parameter_property max_layer_size DEFAULT_VALUE 10
set_parameter_property max_layer_size DISPLAY_NAME max_layer_size
set_parameter_property max_layer_size TYPE INTEGER
set_parameter_property max_layer_size UNITS None
set_parameter_property max_layer_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property max_layer_size DESCRIPTION ""
set_parameter_property max_layer_size HDL_PARAMETER true


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
# connection point backprop_interface
# 
add_interface backprop_interface conduit end
set_interface_property backprop_interface associatedClock ""
set_interface_property backprop_interface associatedReset ""
set_interface_property backprop_interface ENABLED true
set_interface_property backprop_interface EXPORT_OF ""
set_interface_property backprop_interface PORT_NAME_MAP ""
set_interface_property backprop_interface CMSIS_SVD_VARIABLES ""
set_interface_property backprop_interface SVD_ADDRESS_GROUP ""

add_interface_port backprop_interface current_layer_index current_layer_index Input 32
add_interface_port backprop_interface dc_dw_layer_index dc_dw_layer_index Input 32
add_interface_port backprop_interface cal_dy_dy_old cal_dy_dy_old Input 1
add_interface_port backprop_interface copy copy Input 1
add_interface_port backprop_interface reset reset Input 1
add_interface_port backprop_interface backprop_dense diff_dense Input data_size*size
add_interface_port backprop_interface backprop_start diff_start Input data_size*size
add_interface_port backprop_interface backprop_to_all diff_to_all Input data_size*size


# 
# connection point dc_dw_stream_interface
# 
add_interface dc_dw_stream_interface conduit end
set_interface_property dc_dw_stream_interface associatedClock ""
set_interface_property dc_dw_stream_interface associatedReset ""
set_interface_property dc_dw_stream_interface ENABLED true
set_interface_property dc_dw_stream_interface EXPORT_OF ""
set_interface_property dc_dw_stream_interface PORT_NAME_MAP ""
set_interface_property dc_dw_stream_interface CMSIS_SVD_VARIABLES ""
set_interface_property dc_dw_stream_interface SVD_ADDRESS_GROUP ""

add_interface_port dc_dw_stream_interface dc_dw_stream dc_dw Output data_size*size
