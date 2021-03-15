
`timescale 1ps / 1ps
module testbench  ; 

parameter max_layer_size  = 4 ;
parameter backprop_controll_size  = 66 ;
parameter data_size  = 16 ;
parameter size  = 3 ; 
  wire  [(data_size*size)-1:0]  diff_cost_out   ; 
  wire    active_train   ; 
  reg  [(data_size*size)-1:0]  diff_to_all   ; 
  wire    is_last_layer   ; 
  wire  [(data_size*size)-1:0]  diff_start_out   ; 
  wire  [(data_size*size)-1:0]  diff_dense_out   ; 
  wire  [31:0]  current_layer_out   ; 
  wire    read_update_data   ; 
  reg  [(data_size*size)-1:0]  diff_cost   ; 
  wire  [31:0]  current_row_out   ; 
  reg    clk   ; 
  wire  [(data_size*size)-1:0]  diff_to_all_out   ; 
  wire    start_new_layer   ; 
  reg  [(data_size*size)-1:0]  diff_start   ; 
  reg  [backprop_controll_size-1:0]  backprop_controll_bundle   ; 
  reg  [(data_size*size)-1:0]  diff_dense   ; 
  backprop_stack_controller    #( .max_layer_size(max_layer_size) , .backprop_controll_size(backprop_controll_size) , .data_size(data_size) , .size(size)  )
   DUT  ( 
       .diff_cost_out (diff_cost_out ) ,
      .active_train (active_train ) ,
      .diff_to_all (diff_to_all ) ,
      .is_last_layer (is_last_layer ) ,
      .diff_start_out (diff_start_out ) ,
      .diff_dense_out (diff_dense_out ) ,
      .current_layer_out (current_layer_out ) ,
      .read_update_data (read_update_data ) ,
      .diff_cost (diff_cost ) ,
      .current_row_out (current_row_out ) ,
      .clk (clk ) ,
      .diff_to_all_out (diff_to_all_out ) ,
      .start_new_layer (start_new_layer ) ,
      .diff_start (diff_start ) ,
      .backprop_controll_bundle (backprop_controll_bundle ) ,
      .diff_dense (diff_dense ) ); 

  integer act_file;
  integer dense_file;
  integer cost_file;
  integer start_file;
  integer temp;
  integer controll_file;
  integer index;

  reg is_store;
  reg start_train;
  reg [31:0] current_input_layer;
  reg [31:0] current_input_row;

// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 5 ns, Period = 100 ps
  initial
  begin
  controll_file = $fopen("G:/neural-burning/backprop_stack_controller/testbench/controll.hex", "r");
  act_file = $fopen("G:/neural-burning/backprop_stack_controller/testbench/act.hex", "r");
  dense_file = $fopen("G:/neural-burning/backprop_stack_controller/testbench/dense.hex", "r");
  cost_file = $fopen("G:/neural-burning/backprop_stack_controller/testbench/cost.hex", "r");
  start_file = $fopen("G:/neural-burning/backprop_stack_controller/testbench/start.hex", "r");
   repeat(50)
   begin
	   clk  = 1'b1  ;

    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(act_file, "%d\n", temp);
      end else begin
        $fscanf(act_file, "%d ", temp);
      end
      diff_to_all[data_size*(size - index) - 1 -: data_size] = temp << 8;
    end

    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(dense_file, "%d\n", temp);
      end else begin
        $fscanf(dense_file, "%d ", temp);
      end
      diff_dense[data_size*(size - index) - 1 -: data_size] = temp << 8;
    end

    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(cost_file, "%d\n", temp);
      end else begin
        $fscanf(cost_file, "%d ", temp);
      end
      diff_cost[data_size*(size - index) - 1 -: data_size] = temp << 8;
    end

    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(start_file, "%d\n", temp);
      end else begin
        $fscanf(start_file, "%d ", temp);
      end
      diff_start[data_size*(size - index) - 1 -: data_size] = temp << 8;
    end

    $fscanf(controll_file, "%b %b %d %d", is_store, start_train, current_input_layer, current_input_row);
    backprop_controll_bundle = {is_store, start_train, current_input_layer, current_input_row};

	  #50  clk  = 1'b0  ;
	  #50 ;
// 5 ns, repeat pattern in loop.
   end
  end

  initial
	#10000 $stop;
endmodule
