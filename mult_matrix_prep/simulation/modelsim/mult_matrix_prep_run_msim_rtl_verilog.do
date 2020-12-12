transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+G:/neural-burning/mult_matrix_prep {G:/neural-burning/mult_matrix_prep/mult_matrix_prep.v}

