
`timescale 1ps / 1ps
module testbench  ; 

parameter data_size  = 16 ;
parameter max_layer  = 5 ;
parameter size  = 3 ; 
  reg  [(data_size*size)-1:0]  write_data   ; 
  wire  [(data_size*size)-1:0]  read_data   ; 
  reg  [31:0]  write_row_index   ; 
  reg    clk   ; 
  reg  [31:0]  read_row_index   ; 
  reg    is_write   ; 
  reg  [31:0]  write_layer_index   ; 
  reg    is_read   ; 
  reg  [31:0]  read_layer_index   ; 
  matrix_storage    #( data_size , max_layer , size  )
   DUT  ( 
       .write_data (write_data ) ,
      .read_data (read_data ) ,
      .write_row_index (write_row_index ) ,
      .clk (clk ) ,
      .read_row_index (read_row_index ) ,
      .is_write (is_write ) ,
      .write_layer_index (write_layer_index ) ,
      .is_read (is_read ) ,
      .read_layer_index (read_layer_index ) ); 



// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 1 ns, Period = 100 ps
  initial
  begin
   repeat(10)
   begin
	   clk  = 1'b1  ;
	  #50 ;
     clk  = 1'b0  ;
	  #50 ;
// 1 ns, repeat pattern in loop.
   end
  end

  initial
	#2000 $stop;
endmodule
