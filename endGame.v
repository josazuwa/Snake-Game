`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:41 10/25/2017 
// Design Name: 
// Module Name:    endGame 
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
module endGame(
	 input clk,
	 input obEnd,
	 input update,
	 input [39:0] head,
	 input [199:0] body,
	 output reg isOver
    );
	 
	 integer i;
	 reg [199:0] temp;
	 integer ending = 0;
	 integer count = 0;
	 integer counter = 199;
    always @(posedge clk) begin
		if(update == 1'b1) begin
		   if(obEnd == 1'b1) begin
			   isOver = 1'b1;
			end
			while(body[counter] == 1'b0 | body[counter] == 1'b1) begin
				temp[counter] = body[counter];
				count = count + 1;
				counter = counter - 1;
			end
			//Checks if the snake has hit the edge of the course
			if(head[19:10] == 10'b0000000000 | head[19:10] == 10'b1001100000 | head[9:0] == 10'b0000000000 | head[9:0] == 10'b0111000000) begin
				isOver = 1'b1;
			end
			//Checks to see if snake has hit another bodypart
			for(i = 199; i >= 199 - count; i = i - 40) begin
				if(head[39:0] == temp[199:199-39]) begin
					isOver = 1'b1;
				end
				else begin
					isOver = 1'b0;
				end
				temp = temp << 40;
			end
		end
	end
endmodule
