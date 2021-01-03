
module controller(
    op, 
    code_count,
    code_index,
    
    reset,
    w_layer_index,
    w_row_index,
    is_load,
    code_reset,
    code_active,
    is_update,
    use_z,
    i_is_load,
    load_w,
    backprop_cost,
    enable
);
    parameter op_size = 4;
    parameter size = 3;

    // op code
    localparam set_layer = 1;
    localparam set_cost = 2;

    input [op_size - 1:0] op; 
    input [31:0] code_count;
    input [31:0] code_index;
    input enable;

    output reset; //reset code count
    output [31:0] w_layer_index; // w_layer use to load and backprop 
    output [31:0] w_row_index; // w_row use to load and backprop 
    output is_load; //load weight from weight storage
    output code_reset; // reset code line
    output code_active; // change code line
    output is_update; // update weight storage by dc_dw
    output i_is_load; // get next data set
    output load_w; // set weight to systolic
    output backprop_cost; // use cost to backprop
    output use_z; // use z as data set

    reg reset_reg;
    reg [31:0] w_layer_index_reg;
    reg [31:0] w_row_index_reg;
    reg is_load_reg;
    reg code_reset_reg;
    reg code_active_reg;
    reg is_update_reg;
    reg i_is_load_reg;
    reg load_w_reg;
    reg backprop_cost_reg;
    reg use_z_reg;

    reg [31:0] epoch_size_reg;

    assign reset = reset_reg;
    assign w_layer_index = w_layer_index_reg;
    assign w_row_index = w_row_index_reg;
    assign is_load = is_load_reg;
    assign code_reset = code_reset_reg;
    assign code_active = code_active_reg;
    assign is_update = is_update_reg;
    assign i_is_load = i_is_load_reg;
    assign load_w = load_w_reg;
    assign backprop_cost = backprop_cost_reg;
    assign use_z = use_z_reg;

    initial begin
        reset_reg = 1;
        w_layer_index_reg = 0;
        w_row_index_reg = 0;
        is_load_reg = 0;
        code_reset_reg = 0;
        code_active_reg = 1;
        is_update_reg = 0;
        i_is_load_reg = 0;
        load_w_reg = 0;
        backprop_cost_reg = 0;
        use_z_reg = 0;

        epoch_size_reg = 3;
    end


    always @(*) begin
        case (op)
            set_layer: begin
                if (code_count < size) begin //load weight
                    reset_reg = 0;
                    w_layer_index_reg = code_index; 
                    w_row_index_reg = code_count;
                    is_load_reg = 1;
                    code_reset_reg = 0;
                    code_active_reg = 0;
                    is_update_reg = 0;
                    i_is_load_reg = 0;
                    load_w_reg = 1;
                    backprop_cost_reg = 0;
                    use_z_reg = 0;
                end else if (code_count < 2*size) begin //start train
                    if (code_index == 0) begin
                        reset_reg = 0;
                        w_layer_index_reg = code_index; 
                        w_row_index_reg = code_count - size;
                        is_load_reg = 0;
                        code_reset_reg = 0;
                        code_active_reg = 0;
                        is_update_reg = 0;
                        i_is_load_reg = 1;
                        load_w_reg = 0;
                        backprop_cost_reg = 0;
                        use_z_reg = 0;
                    end else begin
                        reset_reg = 0;
                        w_layer_index_reg = code_index; 
                        w_row_index_reg = code_count - size;
                        is_load_reg = 0;
                        code_reset_reg = 0;
                        code_active_reg = 0;
                        is_update_reg = 0;
                        i_is_load_reg = 0;
                        load_w_reg = 0;
                        backprop_cost_reg = 0;
                        use_z_reg = 1;
                    end
                end else if (code_count < 4*size) begin
                    reset_reg = 0;
                    w_layer_index_reg = 0; 
                    w_row_index_reg = 0;
                    is_load_reg = 0;
                    code_reset_reg = 0;
                    code_active_reg = 0;
                    is_update_reg = 0;
                    i_is_load_reg = 0;
                    load_w_reg = 0;
                    backprop_cost_reg = 0;
                    use_z_reg = 0;

                    if(code_count == 4*size - 1) begin
                        reset_reg = 1;
                        code_active_reg = 1;
                    end
                end 
            end
            set_cost: begin
                if (code_count < size) begin //load weight
                    reset_reg = 0;
                    w_layer_index_reg = code_index; 
                    w_row_index_reg = code_count;
                    is_load_reg = 0;
                    code_reset_reg = 0;
                    code_active_reg = 0;
                    is_update_reg = 0;
                    i_is_load_reg = 0;
                    load_w_reg = 0;
                    backprop_cost_reg = 1;
                    use_z_reg = 1;
                    if (code_count == size - 1) begin
                        epoch_size_reg = epoch_size_reg - 1;
                        code_reset_reg = 1;
                        reset_reg = 1;
                    end
                end
            end
            default: begin
                reset_reg = 1;
                w_layer_index_reg = 0;
                w_row_index_reg = 0;
                is_load_reg = 0;
                code_reset_reg = 0;
                code_active_reg = 1;
                is_update_reg = 0;
                i_is_load_reg = 0;
                load_w_reg = 0;
                backprop_cost_reg = 0;
                use_z_reg = 0;
            end
        endcase

        if(~enable) begin
            reset_reg = 1 ;
            w_layer_index_reg = 0;
            w_row_index_reg = 0;
            is_load_reg = 0;
            code_reset_reg = 1;
            code_active_reg = 0;
            is_update_reg = 0;
            i_is_load_reg = 0;
            load_w_reg = 0;
            backprop_cost_reg = 0;
            use_z_reg = 0;
        end
    end
endmodule
