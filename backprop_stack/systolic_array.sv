module systolic_array (
    current_layer,
    address,
    output_replace_pattern,
    reset_counter_in,
    z_to_z,
    one_address,
    acc_z_to_z,
    clk
);
    parameter max_layer_size = 5;
    parameter data_size = 16;
    parameter size = 3;

    input [data_size*size - 1:0] z_to_z;
    input [31:0] address;
    input [31:0] current_layer;
    input [size - 1:0] one_address;
    input [size - 1:0] output_replace_pattern;
    input reset_counter_in;
    input clk;

    output [data_size*size - 1:0] acc_z_to_z;

    reg reset_counter [max_layer_size*size - 1:0];
    reg [data_size*size - 1:0] trans_list [max_layer_size - 1:0];
    wire [data_size*size - 1:0] a_list [max_layer_size:0];
    wire [data_size*size - 1:0] c_list [max_layer_size - 1:0];
    wire [data_size*size - 1:0] b_list [max_layer_size - 1:0];
    wire [31:0] current_layer_wire;
    wire [size - 1:0] one_address_wire;

    delay #(.data_size(32), .size(1), .cycle(size)) 
    delay_inst_current_layer_wire(.bus_in(current_layer), .bus_out(current_layer_wire), .clk(clk));

    delay #(.data_size(3), .size(1), .cycle(size - 1)) 
    delay_inst_one_address_wire(.bus_in(one_address), .bus_out(one_address_wire), .clk(clk));

    function [data_size*size - 1:0] replace;
        input [data_size*size - 1:0] b_in;
        input [data_size*size - 1:0] one_stream_in;
        input [size - 1:0] one_address_in;
        begin
            for (int index = 0; index < size; index = index + 1) begin
                if (one_address_in[(size - index) - 1] == 1'b1) begin
                    replace[data_size*(size - index) - 1 -: data_size] = one_stream_in[data_size*(size - index) - 1 -: data_size];
                end else begin
                    replace[data_size*(size - index) - 1 -: data_size] = b_in[data_size*(size - index) - 1 -: data_size];
                end
            end
        end
    endfunction

    genvar index;
    generate
        for (index = 0; index < max_layer_size; index = index + 1) begin : set_up_z_to_z
            wire [data_size*size - 1:0] a_transformed;
            continuous_systolic #(.size(size), .data_size(data_size)) 
            continuous_systolic(
                .a(a_list[index]),
                .b(b_list[index]),
                .c(c_list[index]),
                .a_out(a_transformed),
                .reset_counter(index == 0 ? reset_counter_in : reset_counter[2 + (index - 1)*size]),
                .clk(clk)
            );
            delay #(.data_size(data_size), .size(size), .cycle(size)) 
            delay_a_list(.bus_in(a_list[index]), .bus_out(a_list[index + 1]), .clk(clk));
            assign b_list[index] = current_layer_wire == index ? replace(c_list[index], a_transformed, one_address_wire) : c_list[index];
        end
    endgenerate

    assign a_list[0] = z_to_z;
    assign acc_z_to_z = address == 0 ? replace(b_list[address], 0, output_replace_pattern) : replace(b_list[address], b_list[address - 1], output_replace_pattern);

    initial begin
        for (int i = 0; i < max_layer_size*size; i = i + 1) begin
            reset_counter[i] = 0;
        end
        for (int i = 0; i < max_layer_size; i = i + 1) begin
            trans_list[i] = 0;
        end
    end

    always @(posedge clk ) begin
        reset_counter[0] <= reset_counter_in;

        for (int i = 1; i < max_layer_size*size; i = i + 1) begin
            reset_counter[i] <= reset_counter[i - 1];
        end
        for (int i = 0; i < max_layer_size; i = i + 1) begin
            trans_list[i] <= b_list[i];
        end

        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", z_to_z[data_size*(size - i) - 1 -: data_size] >> 8);
        // end
        // $write("| ");
        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", acc_z_to_z[data_size*(size - i) - 1 -: data_size] >> 8);
        // end
        // $write("\n");
        // for (int i = 0; i < size; i = i + 1) begin
        //     for (int j = 0; j < size; j = j + 1) begin
        //         $write("%d ", c_list[i][data_size*(size - i) - 1 -: data_size] >> 8);
        //     end
        // $write("| ");
        // end
        // $write("| ");
        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", a_list[0][data_size*(size - i) - 1 -: data_size] >> 8);
        // end
        // $write("| ");


        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", a_list[1][data_size*(size - i) - 1 -: data_size] >> 8);
        // end
        // $write("| ");
        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", b_list[1][data_size*(size - i) - 1 -: data_size] >> 8);
        // end
        // $write("| ");
        // for (int i = 0; i < size; i = i + 1) begin
        //     $write("%d ", c_list[1][data_size*(size - i) - 1 -: data_size] >> 8);
        // end
        // $write("| ");
        // $write(" %d \n", address);
    end
endmodule