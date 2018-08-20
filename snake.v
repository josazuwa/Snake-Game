`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:42 10/23/2017 
// Design Name: 
// Module Name:    snake 
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
module snake(
    input clk,
	 input update,
	 input rotL,
	 input rotR,
	 input reset,
    input grow,
    output reg [39:0] head,
	 output reg [199:0] body,
	 output reg inc
    );
	 
	 integer WIDTH    =  16; 
    integer HIEGHT   =  16; 
    integer X_LEFT   = 144; 
    integer Y_BOTTOM = 64;
	 
	 integer up = 0;
	 integer down = 0;
	 integer left = 0;
	 integer right = 0;
	 
	 integer i;
	 integer clear;
	 integer bodycount = 0;
	 //The body is represented by 200 bits
	 //Each 40 bit increment represents 1 snake bodypart
	 //The WIDTH, HIEGHT, X_LEFT and Y_BOTTOM
	 always @(posedge clk or posedge reset) begin
	 	 if(reset == 1'b1) begin
			   head[39:30] = 16;
				head[29:20] = 16;
				head[19:10] = 144;
				head[9:0] = 64;
				right = 1;
		 end
		if(update == 1'b1) begin
		   //Changes the head to original location at 5 body
			if(bodycount == 5) begin
				inc = 1'b1;
				bodycount = 0;
				for(clear = 199; clear == 0; clear = clear - 1) begin
				    body[clear] = 1'b0;
				end
				head[39:30] = 16;
				head[29:20] = 16;
				head[19:10] = 144;
				head[9:0] = 64;
				right = 1;
			end
			else begin
				inc = 1'b0;
			end
			if(grow == 1'b1) begin
				//Adds bodypart to array if there are no other bodyparts
				if(bodycount == 0) begin
					if(up == 1'b1) begin
						body[199:190] = WIDTH;
						body[189:180] = HIEGHT;
						body[179:170] = X_LEFT;
						body[169:160] = Y_BOTTOM - 16;
					end
					else if(down == 1'b1) begin
						body[199:190] = WIDTH;
						body[189:180] = HIEGHT;
						body[179:170] = X_LEFT;
						body[169:160] = Y_BOTTOM + 16;
					end
					else if(left == 1'b1) begin
						body[199:190] = WIDTH;
						body[189:180] = HIEGHT;
						body[179:170] = X_LEFT + 16;
						body[169:160] = Y_BOTTOM;
					end
					else if(right == 1'b1) begin
						body[199:190] = WIDTH;
						body[189:180] = HIEGHT;
						body[179:170] = X_LEFT - 16;
						body[169:160] = Y_BOTTOM;
					end
					bodycount = bodycount + 1;
				end
				else begin
					//Adds bodyparts to array if there are bodyparts
					i = 159 - (bodycount * 40);
					while(i <= 159) begin
						body[i] = body[i+40];
						i = i + 1;
					end
					//Make the first snake bodypart to be where the snake head used to be
					body[199:190] = WIDTH;
					body[189:180] = HIEGHT;
					body[179:170] = X_LEFT;
					body[169:160] = Y_BOTTOM;
					bodycount = bodycount + 1;
				end
			end
			//Initalize the location and direction of the snake head
			//The change of direction and movement variables
		   if((left & rotR)|(right & rotL)) begin
				up = 1;
				down = 0;
				left = 0;
				right = 0;
				Y_BOTTOM = Y_BOTTOM + 16;
				head[9:0] = Y_BOTTOM;
			end
			else if((left & rotL)|(right & rotR)) begin
				up = 0;
				down = 1;
				left = 0;
				right = 0;
				Y_BOTTOM = Y_BOTTOM - 16;
				head[9:0] = Y_BOTTOM;
			end
			else if((up & rotL)|(down & rotR)) begin
				up = 0;
				down = 0;
				left = 1;
				right = 0;
				X_LEFT = X_LEFT - 16;
				head[19:10] = X_LEFT;
			end
			else if((up & rotR)|(down & rotL)) begin
				up = 0;
				down = 0;
				left = 0;
				right = 1;
				X_LEFT = X_LEFT + 16;
				head[19:10] = X_LEFT;
			end
			else if(up) begin
				Y_BOTTOM = Y_BOTTOM + 16;
				head[9:0] = Y_BOTTOM;
			end
			else if(down) begin
				Y_BOTTOM = Y_BOTTOM - 16;
				head[9:0] = Y_BOTTOM;
			end
			else if(left) begin
				X_LEFT = X_LEFT - 16;
				head[19:10] = X_LEFT;
			end
			else if(right) begin
				X_LEFT = X_LEFT + 16;
				head[19:10] = X_LEFT;
			end
		end
	 end


endmodule
