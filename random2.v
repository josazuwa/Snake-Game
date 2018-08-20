`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:29:29 09/10/2010 
// Design Name: 
// Module Name:    random2 
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
module random2( pos, clk, rst);
   
   output reg  [7:0] pos;
   input             clk,rst;
   reg [7:0] 	     A,B;
   reg               divider;
   reg               rst_prev;
   
   
   initial 
     begin
        divider = 1'b0 ;
     end   
   
   always @ (posedge clk)
     begin
        rst_prev<=rst;
     end
   
   always @ (posedge clk)  begin
      divider <= ~divider;
   end
   
   always @ (posedge clk) begin
      if (rst==1'b1) begin
         if (rst_prev==1'b0) begin
            A<=8'b10000;
            B<=8'b10000;
         end else begin
            A[7:0] <= {A[0],A[7:1]};
            if (divider == 1) begin
               B[7:0] <= {B[0],B[7:1]};
            end else begin
               B[7:0] <= B[7:0];
            end
         end
      end
      pos <= A | B;
   end // always @ (posedge clk or rst)
   
   
endmodule