
`timescale 1ns / 1ns
module testbench  ; 

parameter data_size  = 4 ;
parameter size  = 3 ; 
  reg  [(data_size*size)-1:0]  y_stream   ; 
  wire  [data_size-1:0]  cost   ; 
  reg    clk   ; 
  reg  [(data_size*size)-1:0]  label_stream   ; 
  backprop_cost    #( data_size , size  )
   DUT  ( 
       .y_stream (y_stream ) ,
      .cost (cost ) ,
      .clk (clk ) ,
      .label_stream (label_stream ) ); 
  integer index;
  integer label_file;
  integer y_file;

  reg [data_size - 1:0] temp_data;

// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ns, End Time = 1 us, Period = 100 ns
  initial
  begin
   label_file  = $fopen("G:/neural-burning/backprop_cost/testbench/label.hex", "r");
   y_file = $fopen("G:/neural-burning/backprop_cost/testbench/y.hex", "r");
   repeat(10)
   begin
	  clk  = 1'b1  ;
    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(label_file, "%h\n", temp_data);
        label_stream[data_size*(size - index) - 1 -: data_size] = temp_data;
        end else begin
        $fscanf(label_file, "%h ", temp_data);
        label_stream[data_size*(size - index) - 1 -: data_size] = temp_data;
      end
    end

    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(y_file, "%h\n", temp_data);
        y_stream[data_size*(size - index) - 1 -: data_size] = temp_data;
        end else begin
        $fscanf(y_file, "%h ", temp_data);
        y_stream[data_size*(size - index) - 1 -: data_size] = temp_data;
      end
    end
	  #50 ;
    clk  = 1'b0  ;
	  #50 ;
// 1 us, repeat pattern in loop.
   end
  end

  initial
	#2000 $stop;
endmodule
