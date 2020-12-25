
`timescale 1ps / 1ps
module testbench  ; 

parameter data_size  = 16 ;
parameter size  = 3 ; 
  reg  [(size*data_size)-1:0]  x   ; 
  reg  [(size*data_size)-1:0]  weight   ; 
  wire  [(size*data_size)-1:0]  diff_start_out   ; 
  reg    clk   ; 
  wire  [(size*data_size)-1:0]  diff_to_all_out   ; 
  wire  [(size*data_size)-1:0]  diff_dense_out   ; 
  different    #( data_size , size  )
   DUT  ( 
       .x (x ) ,
      .weight (weight ) ,
      .diff_start_out (diff_start_out ) ,
      .clk (clk ) ,
      .diff_to_all_out (diff_to_all_out ) ,
      .diff_dense_out (diff_dense_out ) ); 

  integer x_file;
  integer w_file;
  integer colum;
  reg [15:0] temp_data;

// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 1 ns, Period = 100 ps
  initial
  begin
    x_file  = $fopen("G:/neural-burning/different/testbench/x.hex", "r");
    w_file  = $fopen("G:/neural-burning/different/testbench/w.hex", "r");
   repeat(10)
   begin
	  clk  = 1'b1  ;
    for (colum = 0; colum < size; colum = colum + 1) begin
      if (colum == size - 1) begin
        $fscanf(x_file, "%d\n", temp_data);
        x[(size - colum)*data_size - 1 -: data_size] = temp_data;
        $fscanf(x_file, "%d\n", temp_data);
        weight[(size - colum)*data_size - 1 -: data_size] = temp_data;
      end else begin
        $fscanf(x_file, "%d ", temp_data);
        x[(size - colum)*data_size - 1 -: data_size] = temp_data;
        $fscanf(x_file, "%d ", temp_data);
        weight[(size - colum)*data_size - 1 -: data_size] = temp_data;
      end
    end
    $write("%b %b\n", x, weight);
	  #50 ;
    clk  = 1'b0  ;
	  #50 ;
// 1 ns, repeat pattern in loop.
   end
  end

  initial
	#2000 $stop;
endmodule
