transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib data_path
vmap data_path data_path
vlog -vlog01compat -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis {G:/neural-burning/data_path/data_path/synthesis/data_path.v}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/gdo.sv}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/weight_interface_spreader.sv}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/spreader.sv}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/parse.sv}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/matrix_storage_locator.sv}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/matrix_location_spreader.sv}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/matrix_storage.sv}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/delay.sv}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/fetch_decode_reg.sv}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/decode_dense_reg.sv}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/controller.sv}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/code_storage.sv}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/code_count.sv}
vlog -sv -work data_path +incdir+G:/neural-burning/data_path/data_path/synthesis/submodules {G:/neural-burning/data_path/data_path/synthesis/submodules/weight_storage.sv}

