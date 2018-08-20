`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:12 10/23/2017 
// Design Name: 
// Module Name:    display 
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
module display(
    input clk,
	 input update,
    input [39:0] food,
    input [39:0] head,
	 input [199:0] body,
	 input [3999:0] obstacles,
	 input [9:0] pos_h,
    input [9:0] pos_v,
	 input blank,
	 input endgame,
	 output reg red,
	 output reg green,
	 output reg blue
    );
	 
	 wire fence;
	 wire snakeHead;
	 reg snakeBody;
	 reg obstacleBody;
	 reg obst;
	 wire foodPart;
	 wire [9:0] x,y;
	 
	 
	 
	 parameter WIDTH = 592;
	 parameter HIEGHT = 432;
	 parameter X_LEFT = 16;
	 parameter Y_BOTTOM = 16;
	 
	 reg [199:0] temp;
	 reg [3999:9] temp2;

	 
	 integer counter = 199;
	 integer counter2 = 3999;
	 
	 assign x = pos_h;
	 assign y = 480 - pos_v;
	 
	 //Fence location
	 assign fence = ~(x >= (X_LEFT)       &
                   x <  (X_LEFT + WIDTH) &
                   y >= (Y_BOTTOM)       &
						 y <	(Y_BOTTOM + HIEGHT));
	
	 //Snake head location
	 assign snakeHead = x >= (head[19:10])       &
                   x <  (head[19:10] + head[39:30]) &
                   y >= (head[9:0])           &
						 y <	(head[9:0] + head[29:20]);
	 
	 //Food location
	 assign foodPart = x >= (food[39:30])        &
                   x <  (food[19:10] + food[39:30]) &
                   y >= (food[9:0])           &
						 y <	(food[9:0] + food[29:20]);
						 
    always @(posedge clk) begin
		snakeBody = 0;
		obstacleBody = 0;
		
		if(update == 1'b1 & endgame != 1'b1) begin
			temp = body;
			while(body[counter] == 1'b1 | body[counter] == 1'b0) begin
				//snakebody location
				snakeBody = snakeBody | (x >= temp[179:170] &
			                   x <  temp[179:170] + temp[199:190] &
									 y >  temp[169:160] &
									 y <  temp[169:160] + temp[189:180]);
				
				temp = temp << 40;
				counter = counter - 40;
			end
			
			while(obstacles[counter2] == 1'b1 | obstacles[counter2] == 1'b0) begin
				//snakebody location
				obstacleBody = obstacleBody | (x >= temp2[179:170] &
			                   x <  temp2[3979:3970] + temp2[3999:3990] &
									 y >  temp2[3969:3960] &
									 y <  temp2[3969:3960] + temp2[3989:3980]);
				
				temp2 = temp2 << 40;
				counter2 = counter2 - 40;
			end
			//Sending it out the the vga
			red <= ~fence & ~snakeHead & foodPart & ~snakeBody & obstacleBody & ~blank;
			green <= ~fence & snakeHead & ~foodPart & snakeBody & obstacleBody & ~blank;
			blue <= fence & ~snakeHead & ~foodPart & snakeBody & obstacleBody & ~blank;
		end
	 end

endmodule
