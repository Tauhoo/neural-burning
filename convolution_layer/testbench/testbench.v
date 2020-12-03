
`timescale 1ns / 1ns
module testbence();
    
    parameter data_size              = 4 ;
    parameter max_input_matrix_width = 9 ;
    parameter max_kernel_width       = 3 ;
    parameter max_kernel_height      = 3 ;
    
    wire  [(data_size*max_input_matrix_width)-1:0]  matrix_output_stream   ;
    reg    clk   ;
    wire    is_buffer_full   ;
    reg    enable   ;
    reg  [(data_size*max_kernel_width)-1:0]  kernel_input_stream   ;
    reg  [(data_size*max_input_matrix_width)-1:0]  matrix_input_stream   ;
    reg  [data_size-1:0] temp_data;
    
    convolution_layer    #(data_size , max_input_matrix_width , max_kernel_width , max_kernel_height)
    DUT  (
    .matrix_output_stream (matrix_output_stream) ,
    .clk (clk) ,
    .is_buffer_full (is_buffer_full) ,
    .enable (enable) ,
    .kernel_input_stream (kernel_input_stream) ,
    .matrix_input_stream (matrix_input_stream));
    
    integer input_matrix_file;
    integer kernel_matrix_file;
    integer index;
    
    
    
    // "Clock Pattern" : dutyCycle = 50
    // Start Time = 0 ns, End Time = 2 us, Period = 100 ns
    initial
    begin
        enable             = 1'b1;
        input_matrix_file  = $fopen("G:/neural-burning/convolution_layer/testbench/input_matrix.hex", "r");
        kernel_matrix_file = $fopen("G:/neural-burning/convolution_layer/testbench/kernel_matrix.hex", "r");
        repeat(20)
        begin
            clk = 1'b1  ;
            if (!$feof(kernel_matrix_file)) begin
                for (index = 0; index < max_kernel_width; index = index + 1) begin
                    if (index == max_kernel_width - 1) begin
                        $fscanf(kernel_matrix_file, "%h\n", temp_data);
                        kernel_input_stream[data_size*(max_kernel_width - index) - 1 -: data_size] = temp_data;
                        end else begin
                        $fscanf(kernel_matrix_file, "%h ", temp_data);
                        kernel_input_stream[data_size*(max_kernel_width - index) - 1 -: data_size] = temp_data;
                    end
                end
                for (index = 0; index < max_kernel_width; index = index + 1) begin
                    if (index == max_kernel_width - 1) begin
                        $write("%h\n",kernel_input_stream[(max_kernel_width - index) * data_size - 1 -: data_size]);
                        end else begin
                        $write("%h ",kernel_input_stream[(max_kernel_width - index) * data_size - 1 -: data_size]);
                    end
                end
            end
            
            if (!$feof(input_matrix_file)) begin
                for (index = 0; index < max_input_matrix_width; index = index + 1) begin
                    if (index == max_input_matrix_width - 1) begin
                        $fscanf(input_matrix_file, "%h\n", temp_data);
                        matrix_input_stream[data_size*(max_input_matrix_width - index) - 1 -: data_size] = temp_data;
                        end else begin
                        $fscanf(input_matrix_file, "%h ", temp_data);
                        matrix_input_stream[data_size*(max_input_matrix_width - index) - 1 -: data_size] = temp_data;
                    end
                end
                for (index = 0; index < max_input_matrix_width; index = index + 1) begin
                    if (index == max_input_matrix_width - 1) begin
                        $write("%h\n",matrix_input_stream[(max_input_matrix_width - index) * data_size - 1 -: data_size]);
                        end else begin
                        $write("%h ",matrix_input_stream[(max_input_matrix_width - index) * data_size - 1 -: data_size]);
                    end
                end
            end
            #50;
            
            
            clk = 1'b0  ;
            #50 ;
            // 2 us, repeat pattern in loop.
        end
        $fclose(input_matrix_file);
        $fclose(kernel_matrix_file);
    end
    
    initial
        #4000 $stop;
endmodule
