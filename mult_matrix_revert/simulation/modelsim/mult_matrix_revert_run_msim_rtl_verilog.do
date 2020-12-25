transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+G:/neural-burning/mult_matrix_revert {G:/neural-burning/mult_matrix_revert/mult_matrix_revert.sv}

