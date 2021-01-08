
`timescale 1ps / 1ps
module testbench  ; 
 
  reg  [31:0]  weight_storage_update_weight_interface_layer_index   ; 
  reg  [47:0]  weight_storage_write_interface_write_data   ; 
  reg  [47:0]  input_storage_write_interface_write_data   ; 
  wire    controller_forward_control_interface_backprop_cost   ; 
  wire  [47:0]  weight_storage_weight_output_interface_weight   ; 
  reg    reset_reset_n   ; 
  wire  [3:0]  parse_0_parameter_type_interface_dense_type   ; 
  reg  [31:0]  code_storage_write_interface_write_line   ; 
  reg  [31:0]  weight_storage_write_interface_write_layer_index   ; 
  reg  [31:0]  weight_storage_update_weight_interface_row_index   ; 
  reg  [31:0]  input_storage_write_interface_write_layer_index   ; 
  wire  [47:0]  label_storage_read_data_interface_read_data   ; 
  reg  [11:0]  code_storage_write_interface_write_data   ; 
  reg  [47:0]  weight_storage_update_weight_interface_dc_dw   ; 
  wire    controller_forward_control_interface_is_update   ; 
  wire    controller_forward_control_interface_load_w   ; 
  reg  [31:0]  weight_storage_write_interface_write_row_index   ; 
  reg    weight_storage_is_write_interface_is_write   ; 
  reg  [31:0]  input_storage_write_interface_write_row_index   ; 
  wire    controller_use_z_interface_use_z   ; 
  reg    input_storage_is_write_interface_is_write   ; 
  reg    matrix_storage_locator_reset_interface_reset   ; 
  reg    controller_enable_interface_enable   ; 
  reg  [47:0]  label_storage_write_interface_write_data   ; 
  wire  [3:0]  parse_0_parameter_type_interface_act_type   ; 
  reg  [31:0]  label_storage_write_interface_write_layer_index   ; 
  reg    clk_clk   ; 
  reg    code_storage_enable_interface_enable   ; 
  wire  [7:0]  parse_0_parameter_type_interface_cost_type   ; 
  wire  [47:0]  input_storage_read_data_interface_read_data   ; 
  reg    weight_storage_is_update_interface_is_update   ; 
  reg  [31:0]  label_storage_write_interface_write_row_index   ; 
  reg    label_storage_is_write_interface_is_write   ; 
  reg    code_storage_write_interface_is_write   ; 
  data_path  
   DUT  ( 
       .weight_storage_update_weight_interface_layer_index (weight_storage_update_weight_interface_layer_index ) ,
      .weight_storage_write_interface_write_data (weight_storage_write_interface_write_data ) ,
      .input_storage_write_interface_write_data (input_storage_write_interface_write_data ) ,
      .controller_forward_control_interface_backprop_cost (controller_forward_control_interface_backprop_cost ) ,
      .weight_storage_weight_output_interface_weight (weight_storage_weight_output_interface_weight ) ,
      .reset_reset_n (reset_reset_n ) ,
      .parse_0_parameter_type_interface_dense_type (parse_0_parameter_type_interface_dense_type ) ,
      .code_storage_write_interface_write_line (code_storage_write_interface_write_line ) ,
      .weight_storage_write_interface_write_layer_index (weight_storage_write_interface_write_layer_index ) ,
      .weight_storage_update_weight_interface_row_index (weight_storage_update_weight_interface_row_index ) ,
      .input_storage_write_interface_write_layer_index (input_storage_write_interface_write_layer_index ) ,
      .label_storage_read_data_interface_read_data (label_storage_read_data_interface_read_data ) ,
      .code_storage_write_interface_write_data (code_storage_write_interface_write_data ) ,
      .weight_storage_update_weight_interface_dc_dw (weight_storage_update_weight_interface_dc_dw ) ,
      .controller_forward_control_interface_is_update (controller_forward_control_interface_is_update ) ,
      .controller_forward_control_interface_load_w (controller_forward_control_interface_load_w ) ,
      .weight_storage_write_interface_write_row_index (weight_storage_write_interface_write_row_index ) ,
      .weight_storage_is_write_interface_is_write (weight_storage_is_write_interface_is_write ) ,
      .input_storage_write_interface_write_row_index (input_storage_write_interface_write_row_index ) ,
      .controller_use_z_interface_use_z (controller_use_z_interface_use_z ) ,
      .input_storage_is_write_interface_is_write (input_storage_is_write_interface_is_write ) ,
      .matrix_storage_locator_reset_interface_reset (matrix_storage_locator_reset_interface_reset ) ,
      .controller_enable_interface_enable (controller_enable_interface_enable ) ,
      .label_storage_write_interface_write_data (label_storage_write_interface_write_data ) ,
      .parse_0_parameter_type_interface_act_type (parse_0_parameter_type_interface_act_type ) ,
      .label_storage_write_interface_write_layer_index (label_storage_write_interface_write_layer_index ) ,
      .clk_clk (clk_clk ) ,
      .code_storage_enable_interface_enable (code_storage_enable_interface_enable ) ,
      .parse_0_parameter_type_interface_cost_type (parse_0_parameter_type_interface_cost_type ) ,
      .input_storage_read_data_interface_read_data (input_storage_read_data_interface_read_data ) ,
      .weight_storage_is_update_interface_is_update (weight_storage_is_update_interface_is_update ) ,
      .label_storage_write_interface_write_row_index (label_storage_write_interface_write_row_index ) ,
      .label_storage_is_write_interface_is_write (label_storage_is_write_interface_is_write ) ,
      .code_storage_write_interface_is_write (code_storage_write_interface_is_write ) ); 

  // reg  [47:0]  weight_storage_write_interface_write_data   ;
  // reg  [31:0]  weight_storage_write_interface_write_layer_index   ; 
  // reg  [31:0]  weight_storage_write_interface_write_row_index   ; 
  // reg    weight_storage_is_write_interface_is_write   ; 

  // reg  [47:0]  weight_storage_update_weight_interface_dc_dw   ; 
  // reg  [31:0]  weight_storage_update_weight_interface_layer_index   ; 
  // reg  [31:0]  weight_storage_update_weight_interface_row_index   ; 
  // reg    weight_storage_is_update_interface_is_update   ; 

  // reg  [47:0]  input_storage_write_interface_write_data   ; 
  // reg  [31:0]  input_storage_write_interface_write_layer_index   ; 
  // reg  [31:0]  input_storage_write_interface_write_row_index   ; 
  // reg    input_storage_is_write_interface_is_write   ; 

  // reg  [47:0]  label_storage_write_interface_write_data   ; 
  // reg  [31:0]  label_storage_write_interface_write_layer_index   ; 
  // reg  [31:0]  label_storage_write_interface_write_row_index   ; 
  // reg    label_storage_is_write_interface_is_write   ; 

  // reg  [31:0]  code_storage_write_interface_write_line   ; 
  // reg  [11:0]  code_storage_write_interface_write_data   ; 
  // reg    code_storage_write_interface_is_write   ; 
  
  // reg    matrix_storage_locator_reset_interface_reset   ; 
  // reg    reset_reset_n   ; 

  integer weight_storage_write_interface_write_data_file;
  integer weight_storage_write_interface_write_control_file;

  integer weight_storage_update_weight_interface_dc_dw_file;
  integer weight_storage_update_weight_interface_control_file;

  integer code_storage_write_interface_write_data_file;
  integer code_storage_write_interface_write_line_file;

  integer label_storage_write_interface_write_data_file;
  integer label_storage_write_interface_control_file;

  integer input_storage_write_interface_write_data_file;
  integer input_storage_write_interface_control_file;

  integer control_signal_file;

  reg [31:0] write_line_temp;
  reg [11:0] write_data_temp;
  reg [15:0] temp_data_1;
  reg [15:0] temp_data_2;
  reg [15:0] temp_data_3;

  reg round;

  reg enable;
// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 10 ns, Period = 100 ps
  initial
  begin
   weight_storage_write_interface_write_data_file = $fopen("G:/neural-burning/data_path/testbench/weight_storage_write_interface_write_data.hex", "r");
   weight_storage_write_interface_write_control_file  = $fopen("G:/neural-burning/data_path/testbench/weight_storage_write_interface_write_control.hex", "r");

   weight_storage_update_weight_interface_dc_dw_file = $fopen("G:/neural-burning/data_path/testbench/weight_storage_update_weight_interface_dc_dw.hex", "r");
   weight_storage_update_weight_interface_control_file  = $fopen("G:/neural-burning/data_path/testbench/weight_storage_update_weight_interface_control.hex", "r");

   code_storage_write_interface_write_data_file = $fopen("G:/neural-burning/data_path/testbench/code_storage_write_interface_write_data.hex", "r");
   code_storage_write_interface_write_line_file  = $fopen("G:/neural-burning/data_path/testbench/code_storage_write_interface_write_line.hex", "r");
   control_signal_file  = $fopen("G:/neural-burning/data_path/testbench/control_signal.hex", "r");

   label_storage_write_interface_write_data_file = $fopen("G:/neural-burning/data_path/testbench/label_storage_write_interface_write_data.hex", "r");
   label_storage_write_interface_control_file = $fopen("G:/neural-burning/data_path/testbench/label_storage_write_interface_control.hex", "r");

   input_storage_write_interface_write_data_file = $fopen("G:/neural-burning/data_path/testbench/input_storage_write_interface_write_data.hex", "r");
   input_storage_write_interface_control_file = $fopen("G:/neural-burning/data_path/testbench/input_storage_write_interface_control.hex", "r");

   round = 0;
   repeat(100)
   begin
     $fscanf(weight_storage_write_interface_write_data_file, "%b %b %b\n", temp_data_1, temp_data_2, temp_data_3);
     weight_storage_write_interface_write_data <= {temp_data_1, temp_data_2, temp_data_3};
     $fscanf(weight_storage_write_interface_write_control_file, "%d %d %b\n", weight_storage_write_interface_write_layer_index, weight_storage_write_interface_write_row_index, weight_storage_is_write_interface_is_write);

     $fscanf(weight_storage_update_weight_interface_dc_dw_file, "%b %b %b\n", temp_data_1, temp_data_2, temp_data_3);
     weight_storage_update_weight_interface_dc_dw <= {temp_data_1, temp_data_2, temp_data_3};
     $fscanf(weight_storage_update_weight_interface_control_file, "%d %d %b\n", weight_storage_update_weight_interface_layer_index, weight_storage_update_weight_interface_row_index, weight_storage_is_update_interface_is_update);

     $fscanf(code_storage_write_interface_write_data_file, "%b\n", write_data_temp);
     $fscanf(code_storage_write_interface_write_line_file, "%d\n", write_line_temp);

     $fscanf(label_storage_write_interface_write_data_file, "%b %b %b\n", temp_data_1, temp_data_2, temp_data_3);
     $fscanf(label_storage_write_interface_control_file, "%d %d %b\n", label_storage_write_interface_write_layer_index, label_storage_write_interface_write_row_index, label_storage_is_write_interface_is_write);
     label_storage_write_interface_write_data <= {temp_data_1, temp_data_2, temp_data_3};

     $fscanf(input_storage_write_interface_write_data_file, "%b %b %b\n", temp_data_1, temp_data_2, temp_data_3);
     $fscanf(input_storage_write_interface_control_file, "%d %d %b\n", input_storage_write_interface_write_layer_index, input_storage_write_interface_write_row_index, input_storage_is_write_interface_is_write);
     input_storage_write_interface_write_data <= {temp_data_1, temp_data_2, temp_data_3};

     $fscanf(control_signal_file, "%b %b %b %b\n", reset_reset_n, code_storage_write_interface_is_write, enable, matrix_storage_locator_reset_interface_reset);


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
	#6000 $stop;
endmodule