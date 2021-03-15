
`timescale 1ps / 1ps
module testbench  ; 

parameter max_layer_size  = 4 ;
parameter data_size  = 16 ;
parameter size  = 3 ; 
  reg  [(size*data_size)-1:0]  diff_act   ; 
  wire  [31:0]  update_weight_row   ; 
  reg  [31:0]  current_input_row   ; 
  reg    active_train   ; 
  reg    is_last_layer   ; 
  wire    is_update_weight   ; 
  reg    read_update_data   ; 
  reg  [(size*data_size)-1:0]  diff_cost   ; 
  reg    clk   ; 
  reg    start_new_layer   ; 
  wire  [(size*data_size)-1:0]  update_weight_value   ; 
  reg  [31:0]  current_input_layer   ; 
  reg  [(size*data_size)-1:0]  diff_start   ; 
  wire  [31:0]  update_weight_layer   ; 
  reg  [(size*data_size)-1:0]  diff_dense   ; 
  backprop_stack    #( .max_layer_size(max_layer_size) , .data_size(data_size) , .size(size)  )
   DUT  ( 
       .diff_act (diff_act ) ,
      .update_weight_row (update_weight_row ) ,
      .current_input_row (current_input_row ) ,
      .active_train (active_train ) ,
      .is_last_layer (is_last_layer ) ,
      .is_update_weight (is_update_weight ) ,
      .read_update_data (read_update_data ) ,
      .diff_cost (diff_cost ) ,
      .clk (clk ) ,
      .start_new_layer (start_new_layer ) ,
      .update_weight_value (update_weight_value ) ,
      .current_input_layer (current_input_layer ) ,
      .diff_start (diff_start ) ,
      .update_weight_layer (update_weight_layer ) ,
      .diff_dense (diff_dense ) ); 



  integer backprop_start_file;
  integer backprop_dense_file;
  integer backprop_act_file;
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
   backprop_act_file = $fopen("G:/neural-burning/backprop_stack/testbench/backprop_act.hex", "r");
   backprop_cost_file = $fopen("G:/neural-burning/backprop_stack/testbench/backprop_cost.hex", "r");
   control_file = $fopen("G:/neural-burning/backprop_stack/testbench/control.hex", "r");
   repeat(100)
   begin
	   clk  = 1'b1  ;

    for (index = 0; index < size; index = index + 1) begin
      //backprop_act
      if (index == size - 1) begin
        $fscanf(backprop_act_file, "%d\n", temp_data);
      end else begin
        $fscanf(backprop_act_file, "%d ", temp_data);
      end
      diff_act[(size - index)*data_size - 1 -: data_size] = temp_data << 8;

      //backprop_dense
      if (index == size - 1) begin
        $fscanf(backprop_dense_file, "%d\n", temp_data);
      end else begin
        $fscanf(backprop_dense_file, "%d ", temp_data);
      end
      diff_dense[(size - index)*data_size - 1 -: data_size] = temp_data << 8;

      //backprop_start
      if (index == size - 1) begin
        $fscanf(backprop_start_file, "%d\n", temp_data);
      end else begin
        $fscanf(backprop_start_file, "%d ", temp_data);
      end
      diff_start[(size - index)*data_size - 1 -: data_size] = temp_data << 8;

      //backprop_cost
      if (index == size - 1) begin
        $fscanf(backprop_cost_file, "%d\n", temp_data);
      end else begin
        $fscanf(backprop_cost_file, "%d ", temp_data);
      end
      diff_cost[(size - index)*data_size - 1 -: data_size] = temp_data << 8;
    end

    $fscanf(control_file, "%d %d %b %b %d %b\n", 
      current_input_layer,
      current_input_row, 
      is_last_layer,
      start_new_layer,
      read_update_data,
      active_train
    );

	  #50  clk  = 1'b0  ;
	  #50 ;
   end

  end


  initial
	#10000 $stop;
endmodule
