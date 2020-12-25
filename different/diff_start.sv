module diff_start(x, diff, clk);
	parameter size = 3;
	parameter data_size = 16;
	
	input [size*data_size - 1:0] x;
	input clk;
	output [size*data_size - 1:0] diff;
	reg [size*data_size - 1:0] diff_reg;

    initial begin
        diff_reg = 0;
    end

	assign diff = diff_reg;

	always @(posedge clk ) begin
		diff_reg = x;
	end
	
endmodule
