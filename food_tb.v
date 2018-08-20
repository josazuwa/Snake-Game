`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:17:36 10/24/2017
// Design Name:   food
// Module Name:   C:/Users/Jeffrey/Desktop/CMPE415/HW4/food_tb.v
// Project Name:  HW4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: food
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module food_tb;

	// Inputs
	reg start;
	reg clk;
	reg update;
	reg [39:0] snakehead;

	// Outputs
	wire overlap;
	wire [39:0] location;

	// Instantiate the Unit Under Test (UUT)
	food uut (
		.update(update),
		.clk(clk), 
		.start(start),
		.snakehead(snakehead),  
		.overlap(overlap), 
		.location(location)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		update = 1;
		start = 1;
		snakehead = 40'b0000010000000001000000110100000011100000;
		
		#6 start = 0;
		#20 snakehead = 40'b0000010000000001000001001100000011100000;

	end
	
	always
	#5 clk = !clk;
	
	initial
	#100 $finish;

      
endmodule


