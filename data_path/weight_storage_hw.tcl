# TCL File Generated by Component Editor 20.1
# Sat Jan 02 18:35:23 ICT 2021
# DO NOT MODIFY


# 
# weight_storage "weight_storage" v1.0
# Wacharawit Wacharak 2021.01.02.18:35:23
# Use to store weight
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module weight_storage
# 
set_module_property DESCRIPTION "Use to store weight"
set_module_property NAME weight_storage
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP neural_burning/decode_layer
set_module_property AUTHOR "Wacharawit Wacharak"
set_module_property DISPLAY_NAME weight_storage
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL weight_storage
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file gdo.sv SYSTEM_VERILOG PATH ../general_data_operator/src/gdo.sv
add_fileset_file weight_storage.sv SYSTEM_VERILOG PATH ../weight_storage/weight_storage.sv TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter data_size INTEGER 16
set_parameter_property data_size DEFAULT_VALUE 16
set_parameter_property data_size DISPLAY_NAME data_size
set_parameter_property data_size TYPE INTEGER
set_parameter_property data_size UNITS None
set_parameter_property data_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property data_size HDL_PARAMETER true
add_parameter size INTEGER 3
set_parameter_property size DEFAULT_VALUE 3
set_parameter_property size DISPLAY_NAME size
set_parameter_property size TYPE INTEGER
set_parameter_property size UNITS None
set_parameter_property size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property size HDL_PARAMETER true
add_parameter layer_size INTEGER 5
set_parameter_property layer_size DEFAULT_VALUE 5
set_parameter_property layer_size DISPLAY_NAME layer_size
set_parameter_property layer_size TYPE INTEGER
set_parameter_property layer_size UNITS None
set_parameter_property layer_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property layer_size HDL_PARAMETER true


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
# connection point write_interface
# 
add_interface write_interface conduit end
set_interface_property write_interface associatedClock ""
set_interface_property write_interface associatedReset ""
set_interface_property write_interface ENABLED true
set_interface_property write_interface EXPORT_OF ""
set_interface_property write_interface PORT_NAME_MAP ""
set_interface_property write_interface CMSIS_SVD_VARIABLES ""
set_interface_property write_interface SVD_ADDRESS_GROUP ""

add_interface_port write_interface write_layer_index write_layer_index Input 32
add_interface_port write_interface write_row_index write_row_index Input 32
add_interface_port write_interface write_data write_data Input data_size*size


# 
# connection point is_update_interface
# 
add_interface is_update_interface conduit end
set_interface_property is_update_interface associatedClock ""
set_interface_property is_update_interface associatedReset ""
set_interface_property is_update_interface ENABLED true
set_interface_property is_update_interface EXPORT_OF ""
set_interface_property is_update_interface PORT_NAME_MAP ""
set_interface_property is_update_interface CMSIS_SVD_VARIABLES ""
set_interface_property is_update_interface SVD_ADDRESS_GROUP ""

add_interface_port is_update_interface is_update is_update Input 1


# 
# connection point is_write_interface
# 
add_interface is_write_interface conduit end
set_interface_property is_write_interface associatedClock ""
set_interface_property is_write_interface associatedReset ""
set_interface_property is_write_interface ENABLED true
set_interface_property is_write_interface EXPORT_OF ""
set_interface_property is_write_interface PORT_NAME_MAP ""
set_interface_property is_write_interface CMSIS_SVD_VARIABLES ""
set_interface_property is_write_interface SVD_ADDRESS_GROUP ""

add_interface_port is_write_interface is_write is_write Input 1


# 
# connection point weight_output_interface
# 
add_interface weight_output_interface conduit end
set_interface_property weight_output_interface associatedClock ""
set_interface_property weight_output_interface associatedReset ""
set_interface_property weight_output_interface ENABLED true
set_interface_property weight_output_interface EXPORT_OF ""
set_interface_property weight_output_interface PORT_NAME_MAP ""
set_interface_property weight_output_interface CMSIS_SVD_VARIABLES ""
set_interface_property weight_output_interface SVD_ADDRESS_GROUP ""

add_interface_port weight_output_interface w weight Output data_size*size


# 
# connection point update_weight_interface
# 
add_interface update_weight_interface conduit end
set_interface_property update_weight_interface associatedClock ""
set_interface_property update_weight_interface associatedReset ""
set_interface_property update_weight_interface ENABLED true
set_interface_property update_weight_interface EXPORT_OF ""
set_interface_property update_weight_interface PORT_NAME_MAP ""
set_interface_property update_weight_interface CMSIS_SVD_VARIABLES ""
set_interface_property update_weight_interface SVD_ADDRESS_GROUP ""

add_interface_port update_weight_interface dc_dw dc_dw Input data_size*size
add_interface_port update_weight_interface layer_index layer_index Input 32
add_interface_port update_weight_interface row_index row_index Input 32


# 
# connection point load_weight_interface
# 
add_interface load_weight_interface conduit end
set_interface_property load_weight_interface associatedClock ""
set_interface_property load_weight_interface associatedReset ""
set_interface_property load_weight_interface ENABLED true
set_interface_property load_weight_interface EXPORT_OF ""
set_interface_property load_weight_interface PORT_NAME_MAP ""
set_interface_property load_weight_interface CMSIS_SVD_VARIABLES ""
set_interface_property load_weight_interface SVD_ADDRESS_GROUP ""

add_interface_port load_weight_interface is_read is_load Input 1
add_interface_port load_weight_interface w_layer_index w_layer_index Input 32
add_interface_port load_weight_interface w_row_index w_row_index Input 32

