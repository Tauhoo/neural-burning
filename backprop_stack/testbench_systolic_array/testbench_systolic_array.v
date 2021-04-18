
`timescale 1ps / 1ps
module testbench_systolic_array  ; 

parameter data_size  = 16 ;
parameter max_layer_size  = 5 ;
parameter size  = 3 ; 
  reg    reset_counter_in   ; 
  reg  [(data_size*size)-1:0]  z_to_z   ; 
  reg  [size-1:0]  output_replace_pattern   ; 
  reg  [31:0]  address   ; 
  reg  [size-1:0]  one_address   ; 
  reg  [31:0]  current_layer   ; 
  wire  [(data_size*size)-1:0]  acc_z_to_z   ; 
  reg    clk   ; 
  systolic_array    #( .data_size(data_size) , .max_layer_size(max_layer_size) , .size(size)  )
   DUT  ( 
       .reset_counter_in (reset_counter_in ) ,
      .z_to_z (z_to_z ) ,
      .output_replace_pattern (output_replace_pattern ) ,
      .clk (clk ) ,
      .address (address ) ,
      .acc_z_to_z (acc_z_to_z ) ,
      .one_address (one_address ) ,
      .current_layer (current_layer ) ); 

  integer control_file;
  integer z_to_z_file;
  integer index;

  reg [data_size - 1:0] temp;

// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 2 ns, Period = 100 ps
  initial
  begin
  z_to_z_file = $fopen("G:/neural-burning/backprop_stack/testbench_systolic_array/z_to_z.hex", "r");
  control_file = $fopen("G:/neural-burning/backprop_stack/testbench_systolic_array/control.hex", "r");
   repeat(100)
   begin
	   clk  = 1'b1  ;
    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(z_to_z_file, "%d\n", temp);
      end else begin
        $fscanf(z_to_z_file, "%d ", temp);
      end
      z_to_z[data_size*(size - index) - 1 -: data_size] = temp*2**(data_size / 2);
    end   

     $fscanf(control_file, "%d %d %d %b %b\n", reset_counter_in, address, current_layer, one_address, output_replace_pattern);    

	  #50 ;
     clk  = 1'b0  ;
	  #50 ;
// 2 ns, repeat pattern in loop.
   end
  end

  initial
	#10000 $stop;
endmodule
