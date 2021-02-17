
`timescale 1ps / 1ps
module testbench_z_to_z  ; 

parameter data_size  = 16 ;
parameter data_set  = 0 ;
parameter size  = 3 ; 
  reg    set_cost   ; 
  reg  [(data_size*size)-1:0]  diff_act   ; 
  wire  [(data_size*size)-1:0]  diff_z_to_z   ; 
  reg  [(data_size*size)-1:0]  diff_cost   ; 
  reg    clk   ; 
  reg    start_new_layer   ; 
  reg    set_diff_act   ; 
  reg  [(data_size*size)-1:0]  diff_dense   ; 
  z_to_z_calculator    #( .data_size(data_size) , .data_set(data_set) , .size(size) )
   DUT  ( 
       .set_cost (set_cost ) ,
      .diff_act (diff_act ) ,
      .diff_z_to_z (diff_z_to_z ) ,
      .diff_cost (diff_cost ) ,
      .clk (clk ) ,
      .start_new_layer (start_new_layer ) ,
      .set_diff_act (set_diff_act ) ,
      .diff_dense (diff_dense ) ); 


  reg [data_size - 1:0] temp;

  integer diff_act_file;
  integer diff_dense_file;
  integer diff_cost_file;
  integer control_file;

  integer index;

  // reg  [(data_size*size)-1:0]  diff_act   ; 
  // reg  [(data_size*size)-1:0]  diff_cost   ; 
  // reg  [(data_size*size)-1:0]  diff_dense   ; 
  // reg    set_cost   ; 
  // reg    set_diff_act   ; 
// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 2 ns, Period = 100 ps
  initial
  begin
  diff_act_file = $fopen("G:/neural-burning/backprop_stack/testbench_z_to_z/diff_act.hex", "r");
  diff_dense_file = $fopen("G:/neural-burning/backprop_stack/testbench_z_to_z/diff_dense.hex", "r");
  diff_cost_file = $fopen("G:/neural-burning/backprop_stack/testbench_z_to_z/diff_cost.hex", "r");
  control_file = $fopen("G:/neural-burning/backprop_stack/testbench_z_to_z/control.hex", "r");
   repeat(20)
   begin
	  clk  = 1'b1  ;

    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(diff_act_file, "%d\n", temp);
      end else begin
        $fscanf(diff_act_file, "%d ", temp);
      end
      diff_act[data_size*(size - index) - 1 -: data_size] = temp*2**(data_size / 2);
    end

    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(diff_dense_file, "%d\n", temp);
      end else begin
        $fscanf(diff_dense_file, "%d ", temp);
      end
      diff_dense[data_size*(size - index) - 1 -: data_size] = temp*2**(data_size / 2);
    end

    for (index = 0; index < size; index = index + 1) begin
      if (index == size - 1) begin
        $fscanf(diff_cost_file, "%d\n", temp);
      end else begin
        $fscanf(diff_cost_file, "%d ", temp);
      end
      diff_cost[data_size*(size - index) - 1 -: data_size] = temp*2**(data_size / 2);
    end
    
    $fscanf(control_file, "%d %d %d\n", set_cost, set_diff_act, start_new_layer);

	  #50 ;
    clk  = 1'b0  ;
	  #50 ;
// 2 ns, repeat pattern in loop.
   end
  end

  initial
	#6000 $stop;
endmodule
