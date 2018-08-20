`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:25:21 10/27/2017
// Design Name:   snake
// Module Name:   C:/Users/Jeffrey/Desktop/CMPE415/HW4/snake_tb.v
// Project Name:  HW4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: snake
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module snake_tb;

	// Inputs
	reg update;
	reg rotL;
	reg rotR;
	reg clk;
	reg start;
	reg grow;

	// Outputs
	wire [39:0] head;
	wire [199:0] body;

	// Instantiate the Unit Under Test (UUT)
	snake uut (
		.update(update),
		.rotL(rotL), 
		.rotR(rotR), 
		.clk(clk), 
		.start(start), 
		.grow(grow), 
		.head(head), 
		.body(body)
	);

	initial begin
		// Initialize Inputs
		rotL = 0;
		rotR = 0;
		update = 1;
		clk = 1;
		start = 1;
		grow = 1;

		#1 start = 0;

	end

	always
	#5 clk = !clk;
	
	initial
	#100 $finish;
      
endmodule

