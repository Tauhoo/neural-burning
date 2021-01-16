module train_data_mux(
    use_z, 

    x, 
    predict_value, 

    z, 
    predict_value_old, 

    data_out, 
    predict_value_out);

    parameter data_size = 16;
    parameter size = 3;
    
    input use_z;

    input [data_size*size - 1:0] x; 
    input [data_size*size - 1:0] predict_value; 

    input [data_size*size - 1:0] z;
    input [data_size*size - 1:0] predict_value_old;

    output [data_size*size - 1:0] data_out;
    output [data_size*size - 1:0] predict_value_out;

    assign data_out = use_z ? z : x;
    assign predict_value_out = use_z ? predict_value_old : predict_value;

endmodule
