transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/neural-burning/general_data_operator/src {/neural-burning/general_data_operator/src/gdo_parameter.v}
vlog -vlog01compat -work work +incdir+/neural-burning/general_data_operator/src {/neural-burning/general_data_operator/src/gdo_mult.v}
vlog -vlog01compat -work work +incdir+/neural-burning/general_data_operator/src {/neural-burning/general_data_operator/src/gdo_add.v}
vlog -vlog01compat -work work +incdir+G:/neural-burning/backprop_stack {G:/neural-burning/backprop_stack/backprop_stack.v}
