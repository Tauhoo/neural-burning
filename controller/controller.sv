
module controller(
    op, 
    param_a,
    param_b,
    param_c,
    code_count,
    
    enable,

    reset,
    w_layer_index,
    w_row_index,
    is_load,
    code_reset,
    code_active,
    i_is_load,
    load_w,
    use_z,
    backprop_controll,

    set_act_type,
    set_dense_type,
    set_cost_type,
    set_learning_rate_value
);
    parameter op_size = 4;
    parameter size = 3;
    parameter backprop_controll_size = 32*3 + 4;
    parameter total_signal_size = 1 + 32*2 + 10 + backprop_controll_size;
	parameter param_a_size = 4;
    parameter param_b_size = 4;

    // op code
    localparam set_act_dense = 4'b0001;
    localparam set_cost = 4'b0010;
    localparam load_weight = 4'b0011;
    localparam load_input_label = 4'b0100;
    localparam set_learning_rate = 4'b0101;
    localparam update_weight = 4'b0110;
    localparam stall = 4'b0111;
    localparam load_z = 4'b1000;

    input [op_size - 1:0] op; 
    input [param_a_size - 1:0] param_a;
    input [param_b_size - 1:0] param_b;
    input [param_a_size + param_b_size - 1:0] param_c;
    input [31:0] code_count;
    input enable;

    output reset; //reset code count
    output [31:0] w_layer_index; // w_layer use to load and backprop 
    output [31:0] w_row_index; // w_row use to load and backprop 
    output is_load; //load weight from weight storage
    output code_reset; // reset code line
    output code_active; // change code line
    output i_is_load; // get next data set
    output load_w; // set weight to systolic
    output use_z; // use z as data set
    output [backprop_controll_size - 1:0] backprop_controll;

    output set_act_type;
    output set_dense_type;
    output set_cost_type;
    output set_learning_rate_value;

    function [backprop_controll_size - 1:0] get_backprop_controll;
        input [31:0] current_layer;
        input [31:0] dc_dw_layer;
        input [31:0] dc_dw_row;
        input update_storage;
        input update_dy_dy_old;
        input cal_dc_dw;
        input reset;
        begin
            return {current_layer, dc_dw_layer, dc_dw_row, update_storage, update_dy_dy_old, cal_dc_dw, reset};
        end
    endfunction



    function [total_signal_size - 1:0] controll_signal;
        input [op_size - 1:0] op;
        input [param_a_size - 1:0] param_a;
        input [param_b_size - 1:0] param_b;
        input [param_a_size + param_b_size - 1:0] param_c;
        input [31:0] code_count;
        input enable;
        begin
            if(op === set_cost) begin
                    return { 
                        1'b1, //reset
                        32'd0, //w_layer_index
                        32'd0, //w_row_index
                        1'b0, //is_load
                        1'b0, //code_reset
                        1'b1, //code_active
                        1'b0, //i_is_load
                        1'b0, //load_w
                        1'b0, //use_z
                        1'b0, //set_act_type
                        1'b0, //set_dense_type
                        1'b1, //set_cost_type
                        1'b0, //set_learning_rate_value 
                        get_backprop_controll(
                            32'd0, //current_layer
                            32'd0, //dc_dw_layer
                            32'd0, //dc_dw_row
                            1'b0, //update_storage
                            1'b0, //update_dy_dy_old
                            1'b0, //cal_dc_dw
                            1'b0 //reset
                        ) //backprop_controll
                    };
            end
            case (op)
                set_act_dense:
                    return { 
                        1'b1, //reset
                        32'd0, //w_layer_index
                        32'd0, //w_row_index
                        1'b0, //is_load
                        1'b0, //code_reset
                        1'b1, //code_active
                        1'b0, //i_is_load
                        1'b0, //load_w
                        1'b0, //use_z
                        1'b1, //set_act_type
                        1'b1, //set_dense_type
                        1'b0, //set_cost_type
                        1'b0, //set_learning_rate_value 
                        get_backprop_controll(
                            32'd0, //current_layer
                            32'd0, //dc_dw_layer
                            32'd0, //dc_dw_row
                            1'b0, //update_storage
                            1'b0, //update_dy_dy_old
                            1'b0, //cal_dc_dw
                            1'b0 //reset
                        ) //backprop_controll
                    };
                set_cost:
                    return { 
                        1'b1, //reset
                        32'd0, //w_layer_index
                        32'd0, //w_row_index
                        1'b0, //is_load
                        1'b0, //code_reset
                        1'b1, //code_active
                        1'b0, //i_is_load
                        1'b0, //load_w
                        1'b0, //use_z
                        1'b0, //set_act_type
                        1'b0, //set_dense_type
                        1'b1, //set_cost_type
                        1'b0, //set_learning_rate_value 
                        get_backprop_controll(
                            32'd0, //current_layer
                            32'd0, //dc_dw_layer
                            32'd0, //dc_dw_row
                            1'b0, //update_storage
                            1'b0, //update_dy_dy_old
                            1'b0, //cal_dc_dw
                            1'b0 //reset
                        ) //backprop_controll
                    };
                load_weight:
                    return { 
                        code_count < size ? 1'b0 : 1'b1, //reset
                        32'(param_c), //w_layer_index
                        32'(code_count%3), //w_row_index
                        1'b1, //is_load
                        1'b0, //code_reset
                        code_count < size ? 1'b0 : 1'b1, //code_active
                        1'b0, //i_is_load
                        1'b1, //load_w
                        1'b0, //use_z
                        1'b0, //set_act_type
                        1'b0, //set_dense_type
                        1'b0, //set_cost_type
                        1'b0, //set_learning_rate_value 
                        get_backprop_controll(
                            32'd0, //current_layer
                            32'd0, //dc_dw_layer
                            32'd0, //dc_dw_row
                            1'b0, //update_storage
                            1'b0, //update_dy_dy_old
                            1'b0, //cal_dc_dw
                            1'b0 //reset
                        ) //backprop_controll
                    };
                load_input_label:
                    return { 
                        code_count < size ? 1'b0 : 1'b1, //reset
                        32'(param_c), //w_layer_index
                        32'(code_count%3), //w_row_index
                        1'b1, //is_load
                        1'b0, //code_reset
                        code_count < size ? 1'b0 : 1'b1, //code_active
                        1'b1, //i_is_load
                        1'b0, //load_w
                        1'b0, //use_z
                        1'b0, //set_act_type
                        1'b0, //set_dense_type
                        1'b0, //set_cost_type
                        1'b0, //set_learning_rate_value 
                        get_backprop_controll(
                            32'(param_c), //current_layer
                            32'd0, //dc_dw_layer
                            32'd0, //dc_dw_row
                            1'b1, //update_storage
                            code_count < size ? 1'b0 : 1'b1, //update_dy_dy_old
                            1'b0, //cal_dc_dw
                            1'b0 //reset
                        ) //backprop_controll
                    };
                set_learning_rate:
                    return { 
                        1'b1, //reset
                        32'd0, //w_layer_index
                        32'd0, //w_row_index
                        1'b0, //is_load
                        1'b0, //code_reset
                        1'b1, //code_active
                        1'b0, //i_is_load
                        1'b0, //load_w
                        1'b0, //use_z
                        1'b0, //set_act_type
                        1'b0, //set_dense_type
                        1'b0, //set_cost_type
                        1'b1, //set_learning_rate_value 
                        get_backprop_controll(
                            32'd0, //current_layer
                            32'd0, //dc_dw_layer
                            32'd0, //dc_dw_row
                            1'b0, //update_storage
                            1'b0, //update_dy_dy_old
                            1'b0, //cal_dc_dw
                            1'b0 //reset
                        ) //backprop_controll
                    };
                update_weight:
                    return { 
                        code_count < size ? 1'b0 : 1'b1, //reset
                        32'd0, //w_layer_index
                        32'd0, //w_row_index
                        1'b0, //is_load
                        1'b0, //code_reset
                        code_count < size ? 1'b0 : 1'b1, //code_active
                        1'b0, //i_is_load
                        1'b0, //load_w
                        1'b0, //use_z
                        1'b0, //set_act_type
                        1'b0, //set_dense_type
                        1'b0, //set_cost_type
                        1'b0, //set_learning_rate_value 
                        get_backprop_controll(
                            32'd0, //current_layer
                            32'(param_c), //dc_dw_layer
                            32'(code_count%3), //dc_dw_row
                            1'b0, //update_storage
                            1'b0, //update_dy_dy_old
                            1'b1, //cal_dc_dw
                            1'b0 //reset
                        ) //backprop_controll
                    };
                stall:
                    return { 
                        code_count < param_c ? 1'b0 : 1'b1, //reset
                        32'd0, //w_layer_index
                        32'd0, //w_row_index
                        1'b0, //is_load
                        1'b0, //code_reset
                        code_count < param_c ? 1'b0 : 1'b1, //code_active
                        1'b0, //i_is_load
                        1'b0, //load_w
                        1'b0, //use_z
                        1'b0, //set_act_type
                        1'b0, //set_dense_type
                        1'b0, //set_cost_type
                        1'b0, //set_learning_rate_value 
                        get_backprop_controll(
                            32'd0, //current_layer
                            32'd0, //dc_dw_layer
                            32'd0, //dc_dw_row
                            1'b0, //update_storage
                            1'b0, //update_dy_dy_old
                            1'b0, //cal_dc_dw
                            1'b0 //reset
                        ) //backprop_controll
                    };
                load_z: 
                    return { 
                        code_count < size ? 1'b0 : 1'b1, //reset
                        32'(param_c), //w_layer_index
                        32'(code_count%3), //w_row_index
                        1'b1, //is_load
                        1'b0, //code_reset
                        code_count < size ? 1'b0 : 1'b1, //code_active
                        1'b0, //i_is_load
                        1'b0, //load_w
                        1'b1, //use_z
                        1'b0, //set_act_type
                        1'b0, //set_dense_type
                        1'b0, //set_cost_type
                        1'b0, //set_learning_rate_value 
                        get_backprop_controll(
                            32'(param_c), //current_layer
                            32'd0, //dc_dw_layer
                            32'd0, //dc_dw_row
                            1'b1, //update_storage
                            code_count < size ? 1'b0 : 1'b1, //update_dy_dy_old
                            1'b0, //cal_dc_dw
                            1'b0 //reset
                        ) //backprop_controll
                    };
                default: 
                    return { 
                        1'b0, //reset
                        32'd0, //w_layer_index
                        32'd0, //w_row_index
                        1'b0, //is_load
                        1'b0, //code_reset
                        1'b0, //code_active
                        1'b0, //i_is_load
                        1'b0, //load_w
                        1'b0, //use_z
                        1'b0, //set_act_type
                        1'b0, //set_dense_type
                        1'b0, //set_cost_type
                        1'b0, //set_learning_rate_value 
                        get_backprop_controll(
                            32'd0, //current_layer
                            32'd0, //dc_dw_layer
                            32'd0, //dc_dw_row
                            1'b0, //update_storage
                            1'b0, //update_dy_dy_old
                            1'b0, //cal_dc_dw
                            1'b0 //reset
                        ) //backprop_controll
                    };
            endcase
        end
    endfunction

    assign { 
        reset, 
        w_layer_index, 
        w_row_index, 
        is_load, 
        code_reset, 
        code_active, 
        i_is_load, 
        load_w, 
        use_z, 

        set_act_type,
        set_dense_type,
        set_cost_type,
        set_learning_rate_value,
        backprop_controll
    } = controll_signal(op, param_a, param_b, param_c, code_count, enable);
    
endmodule
