module convolution_layer(matrix_input_stream,
                         kernel_input_stream,
                         enable,
                         clk,
                         matrix_output_stream,
                         is_buffer_full);
    
    parameter max_input_matrix_width = 9;
    parameter max_kernel_width       = 3;
    parameter max_kernel_height      = 3;
    parameter data_size              = 256;
    localparam matrix_output_width   = max_input_matrix_width - max_kernel_width + 1;
    
    // state
    localparam in_active_state = 1'b0;
    localparam active_state    = 1'b0;
    
    input [data_size * max_input_matrix_width - 1:0] matrix_input_stream;
    wire [data_size - 1:0] matrix_input_stream_wire [0:max_input_matrix_width - 1];
    input [data_size * max_kernel_width - 1:0] kernel_input_stream;
    wire [data_size - 1:0] kernel_input_stream_wire [0:max_kernel_width - 1];
    input enable;
    input clk;
    
    output [data_size * max_input_matrix_width - 1:0] matrix_output_stream;
    output is_buffer_full;
    
    reg [data_size - 1:0] calculate_buffer [0:max_input_matrix_width - 1] [0:max_kernel_height - 1];
    reg [data_size - 1:0] kernel_buffer [0:max_kernel_width - 1] [0:max_kernel_height - 1];
    reg current_state;
    reg [$clog2(max_kernel_height) - 1:0] kernel_stream_progress;
    reg [data_size - 1:0]  matrix_output_stream_reg [0:max_input_matrix_width - 1];
    reg is_buffer_full_reg;
    
    integer index;
    integer stride_index;
    integer colum;
    integer row;
    
    assign is_buffer_full = is_buffer_full_reg;
    
    genvar wire_index;
    
    generate
    for (wire_index = 0; wire_index < max_input_matrix_width; wire_index = wire_index + 1) begin : setup_matrix_input_wire_block
    assign matrix_input_stream_wire[wire_index] = matrix_input_stream[data_size - 1 + wire_index * data_size:wire_index * data_size];
    end
    endgenerate
    
    generate
    for (wire_index = 0; wire_index < max_kernel_width; wire_index = wire_index + 1) begin : setup_kernel_wire_block
    assign kernel_input_stream_wire[wire_index] = kernel_input_stream[data_size - 1 + wire_index * data_size:wire_index * data_size];
    end
    endgenerate
    
    generate
    for (wire_index = 0; wire_index < max_input_matrix_width; wire_index = wire_index + 1) begin : setup_matrix_output_wire_block
    assign matrix_output_stream[data_size - 1 + wire_index * data_size:wire_index * data_size] = matrix_output_stream_reg[wire_index];
    end
    endgenerate
    
    initial begin
        kernel_stream_progress = 0;
        for (index = 0; index < max_kernel_height; index = index + 1) begin
            for (colum = 0; colum < max_kernel_width; colum = colum + 1) begin
                kernel_buffer[colum][index] = {data_size{1'b0}};
            end
            for (colum = 0; colum < max_input_matrix_width; colum = colum + 1) begin
                calculate_buffer[colum][index] = {data_size{1'b0}};
            end
        end
    end
    
    
    always @(posedge clk) begin
        case (current_state)
            in_active_state: begin
                kernel_stream_progress = 1'b0;
                is_buffer_full_reg     = 1'b0;
            end
            active_state: begin
                is_buffer_full_reg = kernel_stream_progress == max_kernel_height;
                
                // accumuate kernel and matrix
                if (!is_buffer_full_reg) begin
                    for (index = 0; index < max_kernel_width; index = index + 1) begin
                        kernel_buffer[index][kernel_stream_progress] = kernel_input_stream_wire[index];
                    end
                    kernel_stream_progress = kernel_stream_progress + 1;
                end
                
                // update calculate buffer
                for (index = 1; index < max_kernel_height; index = index + 1) begin
                    for (colum = 0; colum < max_input_matrix_width; colum = colum + 1) begin
                        calculate_buffer[colum][index - 1] = calculate_buffer[colum][index];
                    end
                end
                
                for (colum = 0; colum < max_input_matrix_width; colum = colum + 1) begin
                    calculate_buffer[colum][max_kernel_height - 1] = matrix_input_stream_wire[colum];
                end
                
                // update output stream
                for (stride_index = 0; stride_index < matrix_output_width; stride_index = stride_index + 1) begin
                    matrix_output_stream_reg[stride_index] = 0;
                    for (colum = 0; colum < max_kernel_width; colum = colum + 1) begin
                        for (row = 0; row < max_kernel_height; row = row + 1) begin
                            matrix_output_stream_reg[stride_index] = matrix_output_stream_reg[stride_index] + kernel_buffer[colum][row] * calculate_buffer[colum + stride_index][row];
                        end
                    end
                end
            end
        endcase
        
        // update state
        case (current_state)
            in_active_state: begin
                if (enable) begin
                    current_state = active_state;
                end
            end
            active_state: begin
                if (!enable) begin
                    current_state = in_active_state;
                end
            end
        endcase
    end
    
endmodule
