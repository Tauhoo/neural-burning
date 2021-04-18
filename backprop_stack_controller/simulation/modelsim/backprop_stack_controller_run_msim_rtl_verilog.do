transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+G:/neural-burning/backprop_stack_controller {G:/neural-burning/backprop_stack_controller/backprop_stack_controller.sv}

