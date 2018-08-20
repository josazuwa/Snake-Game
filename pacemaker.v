`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:44:07 10/25/2017 
// Design Name: 
// Module Name:    pacemaker 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module pacemaker(
    input clk,
    output reg out
    );
	 
	 //Counter
	 integer count = 0;
	 //6250000 is nanoseconds in 125 ms
    always @(posedge clk) begin
	   count = count + 1;
		if(count == 6250000) begin
		  count = 0;
		  out = 1'b1;
		end
		else begin
			out = 1'b0;
		end
    end

endmodule
