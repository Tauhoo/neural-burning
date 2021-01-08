
`timescale 1ps / 1ps
module testbench  ; 

parameter cycle  = 3 ;
parameter data_size  = 16 ;
parameter size  = 1 ; 
  reg  [(data_size*size)-1:0]  bus_in   ; 
  wire  [(data_size*size)-1:0]  bus_out   ; 
  reg    clk   ; 
  delay    #( .cycle(cycle) , .data_size(data_size) , .size(size)  )
   DUT  ( 
       .bus_in (bus_in ) ,
      .bus_out (bus_out ) ,
      .clk (clk ) ); 



// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 1 ns, Period = 100 ps
  initial
  begin
    bus_in = 3;
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
