
`timescale 1ps / 1ps
module testbench  ; 

parameter data_size  = 16 ;
parameter layer_size  = 5 ;
parameter size  = 3 ; 
  reg  [31:0]  w_layer_index   ; 
  reg  [31:0]  layer_index   ; 
  reg  [31:0]  w_row_index   ; 
  reg  [31:0]  write_layer_index   ; 
  reg    is_write   ; 
  reg  [31:0]  row_index   ; 
  reg    is_read   ; 
  wire  [(data_size*size)-1:0]  w   ; 
  reg  [(data_size*size)-1:0]  dc_dw   ; 
  reg  [31:0]  write_row_index   ; 
  reg    clk   ; 
  reg  [(data_size*size)-1:0]  write_data   ; 
  reg    is_update   ; 
  weight_storage    #( data_size , size , layer_size  )
   DUT  ( 
       .w_layer_index (w_layer_index ) ,
      .layer_index (layer_index ) ,
      .w_row_index (w_row_index ) ,
      .write_layer_index (write_layer_index ) ,
      .is_write (is_write ) ,
      .row_index (row_index ) ,
      .is_read (is_read ) ,
      .w (w ) ,
      .dc_dw (dc_dw ) ,
      .write_row_index (write_row_index ) ,
      .clk (clk ) ,
      .write_data (write_data ) ,
      .is_update (is_update ) ); 

  integer file;
  integer index;

// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 10 ns, Period = 100 ps
  initial
  begin
    
   file  = $fopen("G:\\neural-burning\\weight_storage\\testbench\\input.hex", "r");

    layer_index = 0;
    row_index = 0;
    dc_dw = 0;

    w_layer_index = 0;
    w_row_index = 0;
    is_read = 0;

    write_layer_index = 0;
    write_row_index = 0;
    is_write = 0;
    write_data = 0;
   repeat(100)
   begin
	  clk  = 1'b1  ;
    // layer_index
    // row_index
    // dc_dw

    // w_layer_index
    // w_row_index
    // is_read

    // write_layer_index
    // write_row_index
    // is_write
    // write_data

    $fscanf(file, "%d %d ", layer_index, row_index);

    $fscanf(file, "%d %d %d", dc_dw[(size - 0)*data_size - 1 -: data_size], dc_dw[(size - 1)*data_size - 1 -: data_size], dc_dw[(size - 2)*data_size - 1 -: data_size]);

    $fscanf(file, " - %d %d %b", w_layer_index, w_row_index, is_read);
    $fscanf(file, " - %d %d %b ", write_layer_index, write_row_index, is_write);

    $fscanf(file, "%d %d %d\n", write_data[(size - 0)*data_size - 1 -: data_size], write_data[(size - 1)*data_size - 1 -: data_size], write_data[(size - 2)*data_size - 1 -: data_size]);

    $write("%d %d %b - %d %d %b - %d %d %b %b\n", layer_index, row_index, dc_dw, w_layer_index, w_row_index, is_read, write_layer_index, write_row_index, is_write, write_data);
	  #50  ;
    clk  = 1'b0  ;
	  #50 ;
// 10 ns, repeat pattern in loop.
   end
  end

  initial
	#20000 $stop;
endmodule
