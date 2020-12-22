
`timescale 1ns / 1ns
module testbench  ; 

parameter max_layer_size  = 4 ;
parameter data_size  = 8 ;
parameter size  = 3 ; 
  wire  [(data_size*size)-1:0]  dc_dw_stream   ; 
  reg [(data_size*size)-1:0]  backprop_to_all   ; 
  reg [(data_size*size)-1:0]  backprop_dense   ; 
  reg [(data_size*size)-1:0]  backprop_start   ; 
  reg [32:0] dc_dw_layer_index   ; 
  reg [32:0] current_layer_index   ; 
  reg    reset   ; 
  reg    clk   ; 
  reg copy;
  reg cal_dy_dy_old;
  backprop_stack    #( .data_size (data_size) , .size (size) , .max_layer_size (max_layer_size) )
   DUT  ( 
       .dc_dw_stream (dc_dw_stream ) ,
      .backprop_to_all (backprop_to_all ) ,
      .backprop_dense (backprop_dense ) ,
      .dc_dw_layer_index (dc_dw_layer_index ) ,
      .current_layer_index (current_layer_index ) ,
      .clk (clk ) ,
      .reset (reset ) ,
      .copy (copy ),
      .cal_dy_dy_old (cal_dy_dy_old),
      .backprop_start (backprop_start ) ); 
      
  integer backprop_to_all_file;
  integer backprop_dense_file;
  integer backprop_start_file;
  integer control_file;
  integer index;

  reg signed [data_size - 1:0] temp_data;

// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ns, End Time = 3 us, Period = 100 ns
  initial
  begin
   backprop_to_all_file = $fopen("G:/neural-burning/backprop_stack/testbench/backprop_dense.hex", "r");
   backprop_dense_file = $fopen("G:/neural-burning/backprop_stack/testbench/backprop_start.hex", "r");
   backprop_start_file = $fopen("G:/neural-burning/backprop_stack/testbench/backprop_to_all.hex", "r");
   control_file = $fopen("G:/neural-burning/backprop_stack/testbench/control.hex", "r");
   repeat(30)
   begin
	  clk  = 1'b1  ;
    for (index = 0; index < size; index = index + 1) begin
      //backprop_to_all
      if (index == size - 1) begin
        $fscanf(backprop_to_all_file, "%d\n", temp_data);
      end else begin
        $fscanf(backprop_to_all_file, "%d ", temp_data);
      end
      backprop_to_all[(size - index)*data_size - 1 -: data_size] = temp_data;

      //backprop_dense
      if (index == size - 1) begin
        $fscanf(backprop_dense_file, "%d\n", temp_data);
      end else begin
        $fscanf(backprop_dense_file, "%d ", temp_data);
      end
      backprop_dense[(size - index)*data_size - 1 -: data_size] = temp_data;

      //backprop_start
      if (index == size - 1) begin
        $fscanf(backprop_start_file, "%d\n", temp_data);
      end else begin
        $fscanf(backprop_start_file, "%d ", temp_data);
      end
      backprop_start[(size - index)*data_size - 1 -: data_size] = temp_data;
    end

    $fscanf(control_file, "%b %h %h %b %b\n", reset, current_layer_index, dc_dw_layer_index, copy, cal_dy_dy_old);
	  #50  ;
    clk  = 1'b0  ;
	  #50 ;
// 3 us, repeat pattern in loop.
   end
  end

  initial
	#6000 $stop;
endmodule
