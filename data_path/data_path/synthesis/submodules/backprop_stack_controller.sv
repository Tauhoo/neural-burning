module backprop_stack_controller(
    backprop_controll_bundle,

    current_layer_out, 
    dc_dw_layer_out, 
    dc_dw_row_out, 
    update_storage_out, 
    update_dy_dy_old_out, 
    cal_dc_dw_out, 
    cal_dc_dw_out_forward,
    reset_out,
    weight_row,
    weight_layer);

    parameter size = 3;
    parameter data_size = 16;
    parameter backprop_controll_size = 32*3 + 4;

    input [backprop_controll_size - 1:0] backprop_controll_bundle;

    output [31:0] current_layer_out; 
    output [31:0] dc_dw_layer_out; 
    output [31:0] dc_dw_row_out; 
    output update_storage_out; 
    output update_dy_dy_old_out; 
    output cal_dc_dw_out;
    output cal_dc_dw_out_forward;
    output reset_out;

    output [31:0] weight_row;
    output [31:0] weight_layer;

    assign {current_layer_out, dc_dw_layer_out, dc_dw_row_out, update_storage_out, update_dy_dy_old_out, cal_dc_dw_out, reset_out} = backprop_controll_bundle;
    assign cal_dc_dw_out_forward = cal_dc_dw_out;

    assign weight_row = dc_dw_row_out;
    assign weight_layer = dc_dw_layer_out;


endmodule
