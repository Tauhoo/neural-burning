
`timescale 1ns / 1ns
module testbench  ; 

parameter data_size  = 4 ;
parameter size  = 3 ; 
  wire  [(data_size*size)-1:0]  output_stream   ; 
  reg    clk   ; 
  reg  [(data_size*size)-1:0]  input_stream   ; 
  mult_matrix_prep    #( data_size , size  )
   DUT  ( 
       .output_stream (output_stream ) ,
      .clk (clk ) ,
      .input_stream (input_stream ) ); 

  reg [data_size - 1:0] temp_data;
  integer index;
  integer input_matrix_file;
  integer round;

// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ns, End Time = 1 us, Period = 100 ns
  initial
  begin
   round = 0;
   input_matrix_file  = $fopen("G:/neural-burning/mult_matrix_prep/testbench/input_matrix.hex", "r");
   repeat(10)
   begin
	  clk  = 1'b1  ;
    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(input_matrix_file, "%h\n", temp_data);
      end else begin
        $fscanf(input_matrix_file, "%h ", temp_data);
      end
      if (round > size - 1) begin
        $write("%d\n", round);
        input_stream[(size - index)*data_size - 1 -: data_size] = 0;
      end else begin
        input_stream[(size - index)*data_size - 1 -: data_size] = temp_data;
      end
    end
    round = round + 1;
	  #50 ; 
    clk  = 1'b0  ;
	  #50 ;
// 1 us, repeat pattern in loop.
   end
  end

  initial
	#2000 $stop;
endmodule
