
`timescale 1ps / 1ps
module testbench  ; 

parameter set_cost  = 2 ;
parameter set_layer  = 1 ;
parameter op_size  = 4 ;
parameter size  = 3 ; 
  wire    w_layer_index   ; 
  wire    reset   ; 
  wire    w_row_index   ; 
  wire    load_w   ; 
  wire    use_z   ; 
  reg  [op_size-1:0]  op   ; 
  reg    clk   ; 
  wire    backprop_cost   ; 
  reg  [31:0]  code_index   ; 
  reg  [31:0]  code_count   ; 
  wire    is_load   ; 
  wire    i_is_load   ; 
  wire    code_reset   ; 
  wire    code_active   ; 
  wire    is_update   ; 
  controller    #( set_cost , set_layer , op_size , size  )
   DUT  ( 
       .w_layer_index (w_layer_index ) ,
      .reset (reset ) ,
      .w_row_index (w_row_index ) ,
      .load_w (load_w ) ,
      .use_z (use_z ) ,
      .op (op ) ,
      .clk (clk ) ,
      .backprop_cost (backprop_cost ) ,
      .code_index (code_index ) ,
      .code_count (code_count ) ,
      .is_load (is_load ) ,
      .i_is_load (i_is_load ) ,
      .code_reset (code_reset ) ,
      .code_active (code_active ) ,
      .is_update (is_update ) ); 



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
