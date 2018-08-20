`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:18:08 10/27/2017
// Design Name:   pacemaker
// Module Name:   C:/Users/Jeffrey/Desktop/CMPE415/HW4/pacemaker_tb.v
// Project Name:  HW4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pacemaker
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pacemaker_tb;

	// Inputs
	reg clk;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	pacemaker uut (
		.clk(clk), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 1;

	end
	
	always
	#1 clk = !clk;
	
	initial
	#1000 $finish;
      
endmodule

