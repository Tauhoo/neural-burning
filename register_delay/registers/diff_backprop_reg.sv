module diff_backprop_reg (
    diff_to_all,
    diff_start,
    diff_dense,
    diff_cost,
    z,
    predict_value,
    backprop_controll,

    diff_to_all_out,
    diff_start_out,
    diff_dense_out,
    diff_cost_out,
    z_out,
    predict_value_out,
    backprop_controll_out,

    clk
);

    parameter size = 3;
    parameter data_size = 16;
    parameter dense_type_size = 4;
    parameter backprop_controll_size = 1 + 1 + 32 + 32 ;

    input [size*data_size - 1:0] diff_to_all;
    input [size*data_size - 1:0] diff_start;
    input [size*data_size - 1:0] diff_dense;
    input [size*data_size - 1:0] diff_cost;
    input [size*data_size - 1:0] z;
    input [size*data_size - 1:0] predict_value;
    input [backprop_controll_size - 1:0] backprop_controll;

    input clk;

    output [size*data_size - 1:0] diff_to_all_out;
    output [size*data_size - 1:0] diff_start_out;
    output [size*data_size - 1:0] diff_dense_out;
    output [size*data_size - 1:0] diff_cost_out;
    output [size*data_size - 1:0] z_out;
    output [size*data_size - 1:0] predict_value_out;
    output [backprop_controll_size - 1:0] backprop_controll_out;
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_diff_to_all(.bus_in(diff_to_all), .bus_out(diff_to_all_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_diff_start(.bus_in(diff_start), .bus_out(diff_start_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_diff_dense(.bus_in(diff_dense), .bus_out(diff_dense_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size)) 
    delay_inst_diff_cost(.bus_in(diff_cost), .bus_out(diff_cost_out), .clk(clk));
    
    delay #(.data_size(data_size), .size(size))
    delay_inst_z(.bus_in(z), .bus_out(z_out), .clk(clk));

    delay #(.data_size(data_size), .size(size))
    delay_inst_predict_value(.bus_in(predict_value), .bus_out(predict_value_out), .clk(clk));

    delay #(.data_size(backprop_controll_size), .size(1))
    delay_inst_backprop_controll(.bus_in(backprop_controll), .bus_out(backprop_controll_out), .clk(clk));
    
    // always @(posedge clk ) begin
    //     $write("diff_to_all ");
    //     for (int i = 0; i < size; i = i + 1) begin
    //         $write("%f ", real'(signed'(diff_to_all[data_size*(size - i) - 1 -: data_size]))/2**8);
    //     end
    //     $write("| diff_start ");
    //     for (int i = 0; i < size; i = i + 1) begin
    //         $write("%f ", real'(signed'(diff_start[data_size*(size - i) - 1 -: data_size]))/2**8);
    //     end
    //     $write("| diff_dense ");
    //     for (int i = 0; i < size; i = i + 1) begin
    //         $write("%f ", real'(signed'(diff_dense[data_size*(size - i) - 1 -: data_size]))/2**8);
    //     end
    //     $write("| diff_cost ");
    //     for (int i = 0; i < size; i = i + 1) begin
    //         $write("%f ", real'(signed'(diff_cost[data_size*(size - i) - 1 -: data_size]))/2**8);
    //     end
    //     $write("| predict_value ");
    //     for (int i = 0; i < size; i = i + 1) begin
    //         $write("%f ", real'(signed'(predict_value[data_size*(size - i) - 1 -: data_size]))/2**8);
    //     end
    //     $write("| z ");
    //     for (int i = 0; i < size; i = i + 1) begin
    //         $write("%f ", real'(signed'(z[data_size*(size - i) - 1 -: data_size]))/2**8);
    //     end
    //     $write("\n ");
    // end
endmodule