`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:04:27 10/27/2017
// Design Name:   endGame
// Module Name:   C:/Users/Jeffrey/Desktop/CMPE415/HW4/endGame_tb.v
// Project Name:  HW4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: endGame
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module endGame_tb;

	// Inputs
	reg clk;
	reg update;
	reg [39:0] head;
	reg [199:0] body;

	// Outputs
	wire isOver;

	// Instantiate the Unit Under Test (UUT)
	endGame uut (
		.update(update),
		.clk(clk), 
		.head(head), 
		.body(body), 
		.isOver(isOver)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		update = 1;
		head = 40'b1111111111111111111111111111111111111111;
		body = 0;
		
		#50 head = 40'b0000000000000000000000000000000000000000;

	end
	
	always
	#20 clk = !clk;
	
	initial
	#100 $finish;
      
endmodule

