
`timescale 1ps / 1ps
module testbench  ; 

parameter code_size  = 12 ;
parameter max_code_line  = 100 ; 
  reg  [code_size-1:0]  write_data   ; 
  reg    active   ; 
  reg    clk   ; 
  reg  [31:0]  write_line   ; 
  reg    is_write   ; 
  wire  [31:0]  code_index   ; 
  reg    reset   ; 
  wire  [code_size-1:0]  code   ; 
  code_storage    #( code_size , max_code_line  )
   DUT  ( 
       .write_data (write_data ) ,
      .active (active ) ,
      .clk (clk ) ,
      .write_line (write_line ) ,
      .is_write (is_write ) ,
      .code_index (code_index ) ,
      .reset (reset ) ,
      .code (code ) ); 
  integer index;


// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 2 ns, Period = 100 ps
  initial
  begin
   repeat(20)
   begin
	   clk  = 1'b1  ;
	  #50 ;
     clk  = 1'b0  ;
	  #50 ;
// 2 ns, repeat pattern in loop.
   end
  end

  initial
	#4000 $stop;
endmodule
