transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+G:/neural-burning/mult_matrix_prep {G:/neural-burning/mult_matrix_prep/mult_matrix_prep.sv}
vlog -sv -work work +incdir+G:/neural-burning/general_data_operator/src {G:/neural-burning/general_data_operator/src/gdo.sv}
vlog -sv -work work +incdir+G:/neural-burning/backprop_stack {G:/neural-burning/backprop_stack/transformer.sv}
vlog -sv -work work +incdir+G:/neural-burning/backprop_stack {G:/neural-burning/backprop_stack/continuous_systolic.sv}
vlog -sv -work work +incdir+G:/neural-burning/backprop_stack {G:/neural-burning/backprop_stack/z_to_z_calculator.sv}

