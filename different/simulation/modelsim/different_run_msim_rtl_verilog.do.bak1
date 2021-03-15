transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+G:/neural-burning/different {G:/neural-burning/different/diff_to_all.sv}
vlog -sv -work work +incdir+G:/neural-burning/different {G:/neural-burning/different/diff_dense.sv}
vlog -sv -work work +incdir+G:/neural-burning/different {G:/neural-burning/different/diff_start.sv}
vlog -sv -work work +incdir+G:/neural-burning/different {G:/neural-burning/different/different.sv}

