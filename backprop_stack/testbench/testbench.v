
`timescale 1ps / 1ps
module testbench  ; 

parameter max_layer_size  = 4 ;
parameter data_size  = 16 ;
parameter size  = 3 ; 
  reg  [31:0]  dc_dw_row   ; 
  reg    reset   ; 
  reg  [(data_size*size)-1:0]  backprop_to_all   ; 
  reg  [(data_size*size)-1:0]  backprop_start   ; 
  reg  [(data_size*size)-1:0]  backprop_dense   ; 
  reg    cal_dc_dw   ; 
  reg    update_dy_dy_old   ; 
  reg  [(data_size*size)-1:0]  backprop_cost   ; 
  reg    clk   ; 
  wire  [(data_size*size)-1:0]  dc_dw_stream   ; 
  reg  [31:0]  dc_dw_layer   ; 
  reg    update_storage   ; 
  reg  [31:0]  current_layer   ; 

  backprop_stack    #( .max_layer_size(max_layer_size) , .data_size(data_size) , .size(size)  )
   DUT  ( 
       .dc_dw_row (dc_dw_row ) ,
      .reset (reset ) ,
      .backprop_to_all (backprop_to_all ) ,
      .backprop_start (backprop_start ) ,
      .backprop_dense (backprop_dense ) ,
      .cal_dc_dw (cal_dc_dw ) ,
      .update_dy_dy_old (update_dy_dy_old ) ,
      .backprop_cost (backprop_cost ) ,
      .clk (clk ) ,
      .dc_dw_stream (dc_dw_stream ) ,
      .dc_dw_layer (dc_dw_layer ) ,
      .update_storage (update_storage ) ,
      .current_layer (current_layer ) ); 

  // reg  [(data_size*size)-1:0]  backprop_to_all   ; 
  // reg  [(data_size*size)-1:0]  backprop_start   ; 
  // reg  [(data_size*size)-1:0]  backprop_dense   ; 
  // reg  [(data_size*size)-1:0]  backprop_cost   ; 
  // reg    update_storage   ; 

  // reg  [31:0]  current_layer   ; 
  // reg    update_dy_dy_old   ; 

  // reg    cal_dc_dw   ; 
  // reg  [31:0]  dc_dw_layer   ; 
  // reg  [31:0]  dc_dw_row   ; 
  // wire  [(data_size*size)-1:0]  dc_dw_stream   ; 

  // reg    reset   ; 

  integer backprop_start_file;
  integer backprop_dense_file;
  integer backprop_to_all_file;
  integer backprop_cost_file;
  integer control_file;

  reg signed [data_size - 1:0] temp_data;
  integer index;

// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 2 ns, Period = 100 ps
  initial
  begin
   backprop_start_file = $fopen("G:/neural-burning/backprop_stack/testbench/backprop_start.hex", "r");
   backprop_dense_file = $fopen("G:/neural-burning/backprop_stack/testbench/backprop_dense.hex", "r");
   backprop_to_all_file = $fopen("G:/neural-burning/backprop_stack/testbench/backprop_to_all.hex", "r");
   backprop_cost_file = $fopen("G:/neural-burning/backprop_stack/testbench/backprop_cost.hex", "r");
   control_file = $fopen("G:/neural-burning/backprop_stack/testbench/control.hex", "r");
   repeat(20)
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

      //backprop_cost
      if (index == size - 1) begin
        $fscanf(backprop_cost_file, "%d\n", temp_data);
      end else begin
        $fscanf(backprop_cost_file, "%d ", temp_data);
      end
      backprop_cost[(size - index)*data_size - 1 -: data_size] = temp_data;
    end
    // reg update_storage   ; 

    // reg  [31:0]  current_layer   ; 
    // reg    update_dy_dy_old   ; 

    // reg    cal_dc_dw   ; 
    // reg  [31:0]  dc_dw_layer   ; 
    // reg  [31:0]  dc_dw_row   ; 
    // wire  [(data_size*size)-1:0]  dc_dw_stream   ; 

    $fscanf(control_file, "%b %d %b %b %d %d\n", update_storage, current_layer, update_dy_dy_old, cal_dc_dw, dc_dw_layer, dc_dw_row);

	  #50  clk  = 1'b0  ;
	  #50 ;
// 2 ns, repeat pattern in loop.
   end
  end

  initial
	#4000 $stop;
endmodule
