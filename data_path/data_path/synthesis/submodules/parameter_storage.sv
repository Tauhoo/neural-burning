module parameter_storage(
    in_act_type,
    in_dense_type,
    in_cost_type,
    in_learning_rate,

    update_act_type,
    update_dense_type,
    update_cost_type,
    update_learning_rate,

    out_act_type,
    out_dense_type,
    out_cost_type,
    out_learning_rate,

    clk
);

    parameter act_type_size = 4;
    parameter dense_type_size = 4;
    parameter cost_type_size = 8;
    parameter learning_rate_size = 16;
    localparam all_signal_size = act_type_size + dense_type_size + cost_type_size + learning_rate_size;


    input [act_type_size - 1:0] in_act_type;
    input [dense_type_size - 1:0] in_dense_type;
    input [cost_type_size - 1:0] in_cost_type;
    input [learning_rate_size - 1:0] in_learning_rate;

    input update_act_type;
    input update_dense_type;
    input update_cost_type;
    input update_learning_rate;

    input clk;

    output [act_type_size - 1:0] out_act_type;
    output [dense_type_size - 1:0] out_dense_type;
    output [cost_type_size - 1:0] out_cost_type;
    output [learning_rate_size - 1:0] out_learning_rate;

    reg [act_type_size - 1:0] act_type_reg;
    reg [dense_type_size - 1:0] dense_type_reg;
    reg [cost_type_size - 1:0] cost_type_reg;
    reg [learning_rate_size - 1:0] learning_rate_reg;

    initial begin
        act_type_reg = 0;
        dense_type_reg = 0;
        cost_type_reg = 0;
        learning_rate_reg = 0;
    end

    function [all_signal_size - 1:0] calculate_signal;
        input [act_type_size - 1:0] in_act_type;
        input [dense_type_size - 1:0] in_dense_type;
        input [cost_type_size - 1:0] in_cost_type;
        input [learning_rate_size - 1:0] in_learning_rate;

        input [act_type_size - 1:0] act_type_reg;
        input [dense_type_size - 1:0] dense_type_reg;
        input [cost_type_size - 1:0] cost_type_reg;
        input [learning_rate_size - 1:0] learning_rate_reg;

        input update_act_type;
        input update_dense_type;
        input update_cost_type;
        input update_learning_rate;
        begin
            return {
                update_act_type ? in_act_type : act_type_reg, //out_act_type
                update_dense_type ? in_dense_type : dense_type_reg, //out_dense_type
                update_cost_type ? in_cost_type : cost_type_reg, //out_cost_type
                update_learning_rate ? in_learning_rate : learning_rate_reg //out_learning_rate
            };
        end
    endfunction

    assign { 
        out_act_type,
        out_dense_type,
        out_cost_type,
        out_learning_rate
    } = calculate_signal(
        in_act_type,
        in_dense_type,
        in_cost_type,
        in_learning_rate,

        act_type_reg,
        dense_type_reg,
        cost_type_reg,
        learning_rate_reg,

        update_act_type,
        update_dense_type,
        update_cost_type,
        update_learning_rate
    );

    always @(posedge clk ) begin
        act_type_reg = out_act_type;
        dense_type_reg = out_dense_type;
        cost_type_reg = out_cost_type;
        learning_rate_reg = out_learning_rate;
    end


endmodule
