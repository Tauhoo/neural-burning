
`timescale 1ps / 1ps
module testbench  ; 

parameter data_size  = 16 ;
parameter size  = 3 ; 
  wire  [(data_size*size)-1:0]  a_out   ; 
  wire  [(data_size*size)-1:0]  b_out   ; 
  reg  [(data_size*size)-1:0]  a   ; 
  reg    clk   ; 
  reg    reset_counter   ; 
  reg  [(data_size*size)-1:0]  b   ; 
  wire  [(data_size*size)-1:0]  c   ; 
  continuous_systolic    #( .data_size(data_size) , .size(size)  )
   DUT  ( 
       .a_out (a_out ) ,
      .b_out (b_out ) ,
      .a (a ) ,
      .clk (clk ) ,
      .reset_counter (reset_counter ) ,
      .b (b ) ,
      .c (c ) ); 

  integer a_file;
  integer b_file;
  integer control_file;
  integer index;
  reg [data_size - 1:0] temp;

// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 2 ns, Period = 100 ps
  initial
  begin
  a_file = $fopen("G:/neural-burning/backprop_stack/testbench_continuous_systolic/a.hex", "r");
  b_file = $fopen("G:/neural-burning/backprop_stack/testbench_continuous_systolic/b.hex", "r");
  control_file = $fopen("G:/neural-burning/backprop_stack/testbench_continuous_systolic/control.hex", "r");
   repeat(20)
   begin
	   clk  = 1'b1  ;
     for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(a_file, "%d\n", temp);
      end else begin
        $fscanf(a_file, "%d ", temp);
      end
      a[data_size*(size - index) - 1 -: data_size] = temp*2**(data_size / 2);
    end

    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(b_file, "%d\n", temp);
      end else begin
        $fscanf(b_file, "%d ", temp);
      end
      b[data_size*(size - index) - 1 -: data_size] = temp*2**(data_size / 2);
    end

    $fscanf(control_file, "%b\n", reset_counter);

	  #50 ;
     clk  = 1'b0  ;
	  #50 ;
// 2 ns, repeat pattern in loop.
   end
  end

  initial
	#6000 $stop;
endmodule
