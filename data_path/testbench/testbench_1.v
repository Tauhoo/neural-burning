
`timescale 1ps / 1ps
module testbench  ; 
 
  reg  [31:0]  code_storage_write_interface_write_line   ; 
  wire  [3:0]  parse_0_parameter_type_interface_dense_type   ; 
  reg    reset_reset_n   ; 
  reg  [11:0]  code_storage_write_interface_write_data   ; 
  wire  [3:0]  parse_0_op_interface_op   ; 
  reg    clk_clk   ; 
  reg    code_storage_code_control_interface_reset   ; 
  wire  [3:0]  parse_0_parameter_type_interface_act_type   ; 
  reg    code_storage_code_control_interface_active   ; 
  wire  [31:0]  fetch_to_decode_register_code_index_out_interface_code_index   ; 
  wire  [7:0]  parse_0_parameter_type_interface_cost_type   ; 
  reg    code_storage_write_interface_is_write   ; 
  data_path  
   DUT  ( 
       .code_storage_write_interface_write_line (code_storage_write_interface_write_line ) ,
      .parse_0_parameter_type_interface_dense_type (parse_0_parameter_type_interface_dense_type ) ,
      .reset_reset_n (reset_reset_n ) ,
      .code_storage_write_interface_write_data (code_storage_write_interface_write_data ) ,
      .parse_0_op_interface_op (parse_0_op_interface_op ) ,
      .clk_clk (clk_clk ) ,
      .code_storage_code_control_interface_reset (code_storage_code_control_interface_reset ) ,
      .parse_0_parameter_type_interface_act_type (parse_0_parameter_type_interface_act_type ) ,
      .code_storage_code_control_interface_active (code_storage_code_control_interface_active ) ,
      .fetch_to_decode_register_code_index_out_interface_code_index (fetch_to_decode_register_code_index_out_interface_code_index ) ,
      .parse_0_parameter_type_interface_cost_type (parse_0_parameter_type_interface_cost_type ) ,
      .code_storage_write_interface_is_write (code_storage_write_interface_is_write ) ); 

  // reg  [31:0]  code_storage_write_interface_write_line   ; 
  // reg  [11:0]  code_storage_write_interface_write_data   ; 
  // reg    reset_reset_n   ; 
  // reg    code_storage_code_control_interface_reset   ; 
  // reg    code_storage_code_control_interface_active   ; 
  // reg    code_storage_write_interface_is_write   ; 

  integer code_storage_write_interface_write_data_file;
  integer code_storage_write_interface_write_line_file;
  integer control_signal_file;

  reg [31:0] write_line_temp;
  reg [11:0] write_data_temp;

// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 10 ns, Period = 100 ps
  initial
  begin
   code_storage_write_interface_write_line_file  = $fopen("G:/neural-burning/data_path/testbench/code_storage_write_interface_write_line.hex", "r");
   code_storage_write_interface_write_data_file = $fopen("G:/neural-burning/data_path/testbench/code_storage_write_interface_write_data.hex", "r");
   control_signal_file  = $fopen("G:/neural-burning/data_path/testbench/control_signal.hex", "r");
   repeat(100)
   begin
     $fscanf(code_storage_write_interface_write_line_file, "%d\n", write_line_temp);
     $fscanf(code_storage_write_interface_write_data_file, "%b\n", write_data_temp);
     $fscanf(control_signal_file, "%b %b %b %b\n", reset_reset_n, code_storage_code_control_interface_reset, code_storage_code_control_interface_active, code_storage_write_interface_is_write);
     
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
