
`timescale 1ps / 1ps
module testbench_start_store  ; 

parameter max_layer_size  = 5 ;
parameter data_size  = 16 ;
parameter size  = 3 ; 
  wire  [(data_size*size)-1:0]  load_data   ; 
  reg  [31:0]  store_address   ; 
  reg  [31:0]  store_row   ; 
  reg    load   ; 
  reg    reset_counter   ; 
  reg    clk   ; 
  reg  [(data_size*size)-1:0]  store_start_data   ; 
  reg  [31:0]  load_data_set   ; 
  reg  [31:0]  load_address   ; 
  reg    store   ; 
  reg  [(data_size*size)-1:0]  store_act_data   ; 
  reg  [31:0]  load_row   ; 
  start_store    #( .max_layer_size(max_layer_size) , .data_size(data_size) , .size(size))
   DUT  ( 
       .load_data (load_data ) ,
      .store_address (store_address ) ,
      .store_row (store_row ) ,
      .load (load ) ,
      .reset_counter (reset_counter ) ,
      .clk (clk ) ,
      .store_start_data (store_start_data ) ,
      .load_data_set (load_data_set ) ,
      .load_address (load_address ) ,
      .store (store ) ,
      .store_act_data (store_act_data ) ,
      .load_row (load_row ) ); 

  integer load_control;
  integer store_act_file;
  integer store_start_file;
  integer store_control_file;

  integer temp;
  integer index;

// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 3 ns, Period = 100 ps
  initial
  begin
   load_control = $fopen("G:/neural-burning/backprop_stack/testbench_start_store/load_control.hex", "r");
   store_act_file = $fopen("G:/neural-burning/backprop_stack/testbench_start_store/store_act.hex", "r");
   store_start_file = $fopen("G:/neural-burning/backprop_stack/testbench_start_store/store_start.hex", "r");
   store_control_file = $fopen("G:/neural-burning/backprop_stack/testbench_start_store/store_control.hex", "r");
   repeat(30)
   begin
	   clk  = 1'b1  ;

    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(store_act_file, "%d\n", temp);
      end else begin
        $fscanf(store_act_file, "%d ", temp);
      end
      store_act_data[data_size*(size - index) - 1 -: data_size] = temp << 8;
    end

    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(store_start_file, "%d\n", temp);
      end else begin
        $fscanf(store_start_file, "%d ", temp);
      end
      store_start_data[data_size*(size - index) - 1 -: data_size] = temp << 8;
    end

    $fscanf(load_control, "%b %d %d %d %b", load, load_address, load_row, load_data_set, reset_counter);
    $fscanf(store_control_file, "%b %d %d", store, store_address, store_row);

	  #50 ;
     clk  = 1'b0  ;
	  #50 ;
// 3 ns, repeat pattern in loop.
   end
  end
  initial
	#6000 $stop;
endmodule
