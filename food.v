`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:18:14 10/23/2017 
// Design Name: 
// Module Name:    food 
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
module food(
	 input clk,
	 input update,
	 input start,
	 input [39:0] snakehead,
	 output reg [39:0] location,
    output reg overlap
    );
	 
	 integer WIDTH    =  16; 
    integer HIEGHT   =  16; 
    integer X_LEFT   = 304; 
    integer Y_BOTTOM = 224;
	 
	 integer counter = 0;
	 integer counter2 = 0;
	 
	 //39 to 30 represent the WIDTH variable
	 //29 to 10 represent the HIEGHT variable 
	 //19 to 10 represent the X_LEFT variable
	 //9 to 0 represent the Y_BOTTOM variable
	 always @(posedge clk) begin
		if(update == 1'b1) begin
			//Random selection variable
			counter = counter + 3;
			counter2 = counter2 + 7;
			if(start) begin
				overlap = 1'b0;
				location[39:30] = WIDTH;
				location[29:20] = HIEGHT;
				location[19:10] = X_LEFT;
				location[9:0] = Y_BOTTOM;
			end
			//Detects an overlap between the snakehead and the food
			else if(snakehead[9:0] == Y_BOTTOM & snakehead[19:10] == X_LEFT) begin
				overlap = 1'b1;
				X_LEFT = (X_LEFT + counter) % 512;
				Y_BOTTOM = (Y_BOTTOM + counter2) % 512;
				location[19:10] = X_LEFT;
				location[9:0] = Y_BOTTOM;
			end
			else begin
				overlap = 1'b0;
			end
		end
	end
endmodule
