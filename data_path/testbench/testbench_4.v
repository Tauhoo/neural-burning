
`timescale 1ps / 1ps
module testbench  ; 
 
  reg  [31:0]  weight_storage_update_weight_interface_layer_index   ; 
  wire    dense_to_activate_register_out_forward_interface_backprop_cost_out   ; 
  reg  [47:0]  weight_storage_write_interface_write_data   ; 
  reg  [47:0]  input_storage_write_interface_write_data   ; 
  reg    reset_reset_n   ; 
  reg  [31:0]  code_storage_write_interface_write_line   ; 
  reg  [31:0]  weight_storage_write_interface_write_layer_index   ; 
  reg  [31:0]  weight_storage_update_weight_interface_row_index   ; 
  reg  [31:0]  input_storage_write_interface_write_layer_index   ; 
  wire    dense_to_activate_register_out_forward_interface_is_update_out   ; 
  reg  [11:0]  code_storage_write_interface_write_data   ; 
  reg  [47:0]  weight_storage_update_weight_interface_dc_dw   ; 
  reg  [31:0]  weight_storage_write_interface_write_row_index   ; 
  reg    weight_storage_is_write_interface_is_write   ; 
  reg  [31:0]  input_storage_write_interface_write_row_index   ; 
  reg    input_storage_is_write_interface_is_write   ; 
  wire    controller_use_z_interface_use_z   ; 
  wire  [3:0]  dense_to_activate_register_out_forward_interface_dense_type_out   ; 
  reg    matrix_storage_locator_reset_interface_reset   ; 
  wire  [31:0]  dense_to_activate_register_out_forward_interface_w_layer_index_out   ; 
  reg    controller_enable_interface_enable   ; 
  wire  [7:0]  dense_to_activate_register_out_forward_interface_cost_type_out   ; 
  reg  [47:0]  label_storage_write_interface_write_data   ; 
  reg  [31:0]  label_storage_write_interface_write_layer_index   ; 
  wire  [31:0]  dense_to_activate_register_out_forward_interface_w_row_index_out   ; 
  reg    clk_clk   ; 
  reg    code_storage_enable_interface_enable   ; 
  wire  [3:0]  dense_to_activate_register_out_activate_interface_act_type_out   ; 
  wire  [47:0]  dense_to_activate_register_out_activate_interface_y_out   ; 
  wire  [47:0]  dense_to_activate_register_out_forward_interface_w_out   ; 
  reg    weight_storage_is_update_interface_is_update   ; 
  reg  [31:0]  label_storage_write_interface_write_row_index   ; 
  reg    label_storage_is_write_interface_is_write   ; 
  wire  [47:0]  dense_to_activate_register_out_forward_interface_x_out   ; 
  reg    code_storage_write_interface_is_write   ; 
  wire  [47:0]  dense_to_activate_register_out_forward_interface_label   ; 
  data_path  
   DUT  ( 
       .weight_storage_update_weight_interface_layer_index (weight_storage_update_weight_interface_layer_index ) ,
      .dense_to_activate_register_out_forward_interface_backprop_cost_out (dense_to_activate_register_out_forward_interface_backprop_cost_out ) ,
      .weight_storage_write_interface_write_data (weight_storage_write_interface_write_data ) ,
      .input_storage_write_interface_write_data (input_storage_write_interface_write_data ) ,
      .reset_reset_n (reset_reset_n ) ,
      .code_storage_write_interface_write_line (code_storage_write_interface_write_line ) ,
      .weight_storage_write_interface_write_layer_index (weight_storage_write_interface_write_layer_index ) ,
      .weight_storage_update_weight_interface_row_index (weight_storage_update_weight_interface_row_index ) ,
      .input_storage_write_interface_write_layer_index (input_storage_write_interface_write_layer_index ) ,
      .dense_to_activate_register_out_forward_interface_is_update_out (dense_to_activate_register_out_forward_interface_is_update_out ) ,
      .code_storage_write_interface_write_data (code_storage_write_interface_write_data ) ,
      .weight_storage_update_weight_interface_dc_dw (weight_storage_update_weight_interface_dc_dw ) ,
      .weight_storage_write_interface_write_row_index (weight_storage_write_interface_write_row_index ) ,
      .weight_storage_is_write_interface_is_write (weight_storage_is_write_interface_is_write ) ,
      .input_storage_write_interface_write_row_index (input_storage_write_interface_write_row_index ) ,
      .input_storage_is_write_interface_is_write (input_storage_is_write_interface_is_write ) ,
      .controller_use_z_interface_use_z (controller_use_z_interface_use_z ) ,
      .dense_to_activate_register_out_forward_interface_dense_type_out (dense_to_activate_register_out_forward_interface_dense_type_out ) ,
      .matrix_storage_locator_reset_interface_reset (matrix_storage_locator_reset_interface_reset ) ,
      .dense_to_activate_register_out_forward_interface_w_layer_index_out (dense_to_activate_register_out_forward_interface_w_layer_index_out ) ,
      .controller_enable_interface_enable (controller_enable_interface_enable ) ,
      .dense_to_activate_register_out_forward_interface_cost_type_out (dense_to_activate_register_out_forward_interface_cost_type_out ) ,
      .label_storage_write_interface_write_data (label_storage_write_interface_write_data ) ,
      .label_storage_write_interface_write_layer_index (label_storage_write_interface_write_layer_index ) ,
      .dense_to_activate_register_out_forward_interface_w_row_index_out (dense_to_activate_register_out_forward_interface_w_row_index_out ) ,
      .clk_clk (clk_clk ) ,
      .code_storage_enable_interface_enable (code_storage_enable_interface_enable ) ,
      .dense_to_activate_register_out_activate_interface_act_type_out (dense_to_activate_register_out_activate_interface_act_type_out ) ,
      .dense_to_activate_register_out_activate_interface_y_out (dense_to_activate_register_out_activate_interface_y_out ) ,
      .dense_to_activate_register_out_forward_interface_w_out (dense_to_activate_register_out_forward_interface_w_out ) ,
      .weight_storage_is_update_interface_is_update (weight_storage_is_update_interface_is_update ) ,
      .label_storage_write_interface_write_row_index (label_storage_write_interface_write_row_index ) ,
      .label_storage_is_write_interface_is_write (label_storage_is_write_interface_is_write ) ,
      .dense_to_activate_register_out_forward_interface_x_out (dense_to_activate_register_out_forward_interface_x_out ) ,
      .code_storage_write_interface_is_write (code_storage_write_interface_is_write ) ,
      .dense_to_activate_register_out_forward_interface_label (dense_to_activate_register_out_forward_interface_label ) ); 


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
	#8000 $stop;
endmodule
