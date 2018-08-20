`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:08:07 11/17/2017
// Design Name:   obstacle
// Module Name:   C:/Users/Jeffrey/Desktop/CMPE415/HW5/obstacle_tb.v
// Project Name:  HW5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: obstacle
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module obstacle_tb;

	// Inputs
	reg clk;
	reg inc;
	reg reset;
	reg [39:0] head;

	// Outputs
	wire stop;
	wire [3999:0] obstacles;

	// Instantiate the Unit Under Test (UUT)
	obstacle uut (
		.clk(clk), 
		.inc(inc), 
		.reset(reset), 
		.head(head), 
		.stop(stop), 
		.obstacles(obstacles)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		inc = 1;
		reset = 1;
		head = 0;
		
		#1 reset = 0;
		#15 head = 40'b0000010000000001000000000100000000100000;

	end
      
	always
	#5 clk = !clk;
	
	initial
	#100 $finish;
	
endmodule

