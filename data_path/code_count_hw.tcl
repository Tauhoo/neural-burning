# TCL File Generated by Component Editor 20.1
# Thu Dec 31 17:55:00 ICT 2020
# DO NOT MODIFY


# 
# code_count "code_count" v1.0
# Wachirawit Wacharak 2020.12.31.17:55:00
# Integer counter
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module code_count
# 
set_module_property DESCRIPTION "Integer counter"
set_module_property NAME code_count
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP neural_burning/decode_layer
set_module_property AUTHOR "Wachirawit Wacharak"
set_module_property DISPLAY_NAME code_count
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL code_count
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file code_count.sv SYSTEM_VERILOG PATH ../code_count/code_count.sv TOP_LEVEL_FILE


# 
# parameters
# 


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
# connection point reset_interface
# 
add_interface reset_interface conduit end
set_interface_property reset_interface associatedClock ""
set_interface_property reset_interface associatedReset ""
set_interface_property reset_interface ENABLED true
set_interface_property reset_interface EXPORT_OF ""
set_interface_property reset_interface PORT_NAME_MAP ""
set_interface_property reset_interface CMSIS_SVD_VARIABLES ""
set_interface_property reset_interface SVD_ADDRESS_GROUP ""

add_interface_port reset_interface reset reset Input 1


# 
# connection point count_interface
# 
add_interface count_interface conduit end
set_interface_property count_interface associatedClock ""
set_interface_property count_interface associatedReset ""
set_interface_property count_interface ENABLED true
set_interface_property count_interface EXPORT_OF ""
set_interface_property count_interface PORT_NAME_MAP ""
set_interface_property count_interface CMSIS_SVD_VARIABLES ""
set_interface_property count_interface SVD_ADDRESS_GROUP ""

add_interface_port count_interface count code_count Output 32

