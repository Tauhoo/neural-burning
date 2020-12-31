
`timescale 1ps / 1ps
module testbench  ; 
 
  wire    controller_i_is_load_interface_i_is_load   ; 
  wire    controller_forward_control_interface_backprop_cost   ; 
  reg    reset_reset_n   ; 
  wire  [3:0]  parse_0_parameter_type_interface_dense_type   ; 
  reg  [31:0]  code_storage_write_interface_write_line   ; 
  reg  [11:0]  code_storage_write_interface_write_data   ; 
  wire    controller_forward_control_interface_is_update   ; 
  wire    controller_forward_control_interface_load_w   ; 
  wire    controller_weigth_interface_is_load   ; 
  wire    controller_use_z_interface_use_z   ; 
  wire  [3:0]  parse_0_parameter_type_interface_act_type   ; 
  reg    clk_clk   ; 
  wire  [7:0]  parse_0_parameter_type_interface_cost_type   ; 
  wire    controller_weigth_interface_w_layer_index   ; 
  reg    code_storage_write_interface_is_write   ; 
  wire    controller_weigth_interface_w_row_index   ; 
  reg enable;
  reg code_storage_enable_interface_enable;
  reg controller_enable_interface_enable;
  
  data_path  
   DUT  ( 
       .controller_i_is_load_interface_i_is_load (controller_i_is_load_interface_i_is_load ) ,
      .controller_forward_control_interface_backprop_cost (controller_forward_control_interface_backprop_cost ) ,
      .reset_reset_n (reset_reset_n ) ,
      .parse_0_parameter_type_interface_dense_type (parse_0_parameter_type_interface_dense_type ) ,
      .code_storage_write_interface_write_line (code_storage_write_interface_write_line ) ,
      .code_storage_write_interface_write_data (code_storage_write_interface_write_data ) ,
      .controller_forward_control_interface_is_update (controller_forward_control_interface_is_update ) ,
      .controller_forward_control_interface_load_w (controller_forward_control_interface_load_w ) ,
      .controller_weigth_interface_is_load (controller_weigth_interface_is_load ) ,
      .controller_use_z_interface_use_z (controller_use_z_interface_use_z ) ,
      .parse_0_parameter_type_interface_act_type (parse_0_parameter_type_interface_act_type ) ,
      .clk_clk (clk_clk ) ,
      .parse_0_parameter_type_interface_cost_type (parse_0_parameter_type_interface_cost_type ) ,
      .controller_weigth_interface_w_layer_index (controller_weigth_interface_w_layer_index ) ,
      .code_storage_write_interface_is_write (code_storage_write_interface_is_write ) ,
      .controller_weigth_interface_w_row_index (controller_weigth_interface_w_row_index ) ,
      .code_storage_enable_interface_enable(code_storage_enable_interface_enable) ,
      .controller_enable_interface_enable(controller_enable_interface_enable) ); 

  // reg    reset_reset_n   ; 
  // reg  [31:0]  code_storage_write_interface_write_line   ; 
  // reg  [11:0]  code_storage_write_interface_write_data   ; 
  // reg    code_storage_write_interface_is_write   ; 

  integer code_storage_write_interface_write_data_file;
  integer code_storage_write_interface_write_line_file;
  integer control_signal_file;

  reg [31:0] write_line_temp;
  reg [11:0] write_data_temp;

  reg round;

// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 10 ns, Period = 100 ps
  initial
  begin
   code_storage_write_interface_write_line_file  = $fopen("G:/neural-burning/data_path/testbench/code_storage_write_interface_write_line.hex", "r");
   code_storage_write_interface_write_data_file = $fopen("G:/neural-burning/data_path/testbench/code_storage_write_interface_write_data.hex", "r");
   control_signal_file  = $fopen("G:/neural-burning/data_path/testbench/control_signal.hex", "r");
   round = 0;
   repeat(100)
   begin
     $fscanf(code_storage_write_interface_write_line_file, "%d\n", write_line_temp);
     $fscanf(code_storage_write_interface_write_data_file, "%b\n", write_data_temp);
     $fscanf(control_signal_file, "%b %b %b\n", reset_reset_n, code_storage_write_interface_is_write, enable);
     $write("%b\n", enable);
     code_storage_enable_interface_enable = enable;
     if (round > 0) begin
      controller_enable_interface_enable = enable;
     end else begin
       controller_enable_interface_enable = 0;
     end

     if( code_storage_enable_interface_enable == 1) begin
       round = 1;
     end
     
	   clk_clk  <= 1'b1  ;
     code_storage_write_interface_write_line <= write_line_temp;
     code_storage_write_interface_write_data <= write_data_temp;

    //  $write("%d - %b - %b %b %b %b\n", write_line_temp, write_data_temp, reset_reset_n, code_storage_code_control_interface_reset, code_storage_code_control_interface_active, code_storage_write_interface_is_write);
    #50 ;
     clk_clk  <= 1'b0  ;
	  #50 ;
// 10 ns, repeat pattern in loop.
   end
  end

  initial
	#4000 $stop;
endmodule
