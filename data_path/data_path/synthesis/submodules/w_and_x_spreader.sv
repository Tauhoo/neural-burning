module w_and_x_spreder (
    w, 
    x,
    w_out,
    x_out,
    w_out_interface,
    x_out_interface,
    set_w,
    set_w_out
);
    parameter size = 3;
    parameter data_size = 16;

    input [data_size*size - 1:0] w;
    input [data_size*size - 1:0] x;
    input set_w;

    output [data_size*size - 1:0] w_out;
    output [data_size*size - 1:0] x_out;
    output [data_size*size - 1:0] w_out_interface;
    output [data_size*size - 1:0] x_out_interface;
    output set_w_out;

    assign set_w_out = set_w;

    spreader #( .size(size*data_size) ) spreader_w (.data_in(w), .data_out_a(w_out), .data_out_b(w_out_interface));

    spreader #( .size(size*data_size) ) sreader_x (.data_in(x), .data_out_a(x_out), .data_out_b(x_out_interface));
endmodule