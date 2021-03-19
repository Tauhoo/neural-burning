# TCL File Generated by Component Editor 20.1
# Fri Mar 19 23:08:09 ICT 2021
# DO NOT MODIFY


# 
# activation "activation" v1.0
# Wachirawit Wacharak 2021.03.19.23:08:09
# Activate data from dense layer
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module activation
# 
set_module_property DESCRIPTION "Activate data from dense layer"
set_module_property NAME activation
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP neural_burning/activation_layer
set_module_property AUTHOR "Wachirawit Wacharak"
set_module_property DISPLAY_NAME activation
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL activation
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file activation.sv SYSTEM_VERILOG PATH ../activation/activation.sv TOP_LEVEL_FILE
add_fileset_file gdo.sv SYSTEM_VERILOG PATH ../general_data_operator/src/gdo.sv


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
add_parameter activate_size INTEGER 4
set_parameter_property activate_size DEFAULT_VALUE 4
set_parameter_property activate_size DISPLAY_NAME activate_size
set_parameter_property activate_size TYPE INTEGER
set_parameter_property activate_size UNITS None
set_parameter_property activate_size ALLOWED_RANGES -2147483648:2147483647
set_parameter_property activate_size HDL_PARAMETER true


# 
# display items
# 


# 
# connection point in_data_interface
# 
add_interface in_data_interface conduit end
set_interface_property in_data_interface associatedClock ""
set_interface_property in_data_interface associatedReset ""
set_interface_property in_data_interface ENABLED true
set_interface_property in_data_interface EXPORT_OF ""
set_interface_property in_data_interface PORT_NAME_MAP ""
set_interface_property in_data_interface CMSIS_SVD_VARIABLES ""
set_interface_property in_data_interface SVD_ADDRESS_GROUP ""

add_interface_port in_data_interface in_data data_stream Input data_size*size
add_interface_port in_data_interface act act_type Input activate_size


# 
# connection point out_data_interface
# 
add_interface out_data_interface conduit end
set_interface_property out_data_interface associatedClock ""
set_interface_property out_data_interface associatedReset ""
set_interface_property out_data_interface ENABLED true
set_interface_property out_data_interface EXPORT_OF ""
set_interface_property out_data_interface PORT_NAME_MAP ""
set_interface_property out_data_interface CMSIS_SVD_VARIABLES ""
set_interface_property out_data_interface SVD_ADDRESS_GROUP ""

add_interface_port out_data_interface out_data z Output data_size*size

