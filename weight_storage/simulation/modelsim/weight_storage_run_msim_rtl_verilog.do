transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+G:/neural-burning/general_data_operator/src {G:/neural-burning/general_data_operator/src/gdo.sv}
vlog -sv -work work +incdir+G:/neural-burning/weight_storage {G:/neural-burning/weight_storage/weight_storage.sv}

