
`timescale 1ns / 1ns
module testbench  ; 

parameter data_size  = 8 ;
parameter size  = 3 ; 
  wire  [(data_size*size)-1:0]  y_stream   ; 
  reg  [(data_size*size)-1:0]  data_stream   ; 
  reg    set_w   ; 
  reg    clk   ; 
  reg  [(data_size*size)-1:0]  w_stream   ; 
  systolic    #( data_size , size  )
   DUT  ( 
       .y_stream (y_stream ) ,
      .data_stream (data_stream ) ,
      .set_w (set_w ) ,
      .clk (clk ) ,
      .w_stream (w_stream ) ); 

  integer set_w_count;
  integer index;
  integer input_matrix_file;
  integer weight_matrix_file; 
  integer colum;

  reg [data_size - 1:0] temp_data;
// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ns, End Time = 1 us, Period = 100 ns
  initial
  begin
   input_matrix_file  = $fopen("G:/neural-burning/systolic/testbench/input_matrix.hex", "r");
   weight_matrix_file = $fopen("G:/neural-burning/systolic/testbench/weight_matrix.hex", "r");
   set_w_count = 0;
   index = 0;
   repeat(10)
   begin
	  clk  = 1'b1  ;

    if (set_w_count < size) begin
      set_w_count = set_w_count + 1;
      set_w = 1'b1;
    end else begin
      set_w = 1'b0;
    end

    if(index < size) begin
      for (colum = 0; colum < size; colum = colum + 1) begin
        if (colum == size - 1) begin
          $fscanf(weight_matrix_file, "%d\n", temp_data);
        end else begin
          $fscanf(weight_matrix_file, "%d ", temp_data);
        end
        w_stream[(size - colum) * data_size - 1 -: data_size] = temp_data;
      end
    end


    if (index < size * 2 - 1) begin
      for (colum = 0; colum < size; colum = colum + 1) begin
        if (colum == size - 1) begin
          $fscanf(input_matrix_file, "%d\n", temp_data);
        end else begin
          $fscanf(input_matrix_file, "%d ", temp_data);
        end
        data_stream[(size - colum) * data_size - 1 -: data_size] = temp_data;
      end
    end else begin
      for (colum = 0; colum < size; colum = colum + 1) begin
        data_stream[(size - colum) * data_size - 1 -: data_size] = 0;
      end
    end

    for (colum = 0; colum < size; colum = colum + 1) begin
      if (colum == size - 1) begin
        $write("%d -> weight | ", w_stream[(size - colum) * data_size - 1 -: data_size]);
      end else begin
        $write("%d ", w_stream[(size - colum) * data_size - 1 -: data_size]);
      end
    end

    for (colum = 0; colum < size; colum = colum + 1) begin
      if (colum == size - 1) begin
        $write("%d -> data | ", data_stream[(size - colum) * data_size - 1 -: data_size]);
      end else begin
        $write("%d ", data_stream[(size - colum) * data_size - 1 -: data_size]);
      end
    end

    for (colum = 0; colum < size; colum = colum + 1) begin
      if (colum == size - 1) begin
        $write("%d -> y \n", y_stream[(size - colum) * data_size - 1 -: data_size]);
      end else begin
        $write("%d ", y_stream[(size - colum) * data_size - 1 -: data_size]);
      end
    end

    index = index + 1;
	  #50 ;
    clk  = 1'b0  ;
	  #50 ;
// 1 us, repeat pattern in loop.
   end
  end

  initial
	#2000 $stop;
endmodule
