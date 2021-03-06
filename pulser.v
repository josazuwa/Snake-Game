`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:20:25 09/10/2010 
// Design Name: 
// Module Name:    pulser 
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
module pulser(
              p,
              clk
              );

   parameter PERIOD = 25000000;   
   parameter PULSE_WIDTH = 10000000;

   input clk;
   output p;
   
   reg    p;
   reg [32:0] count;
   

   initial //for simulation only
     begin
        count <= 10000000;
     end   

   always @ (posedge clk)
     begin
        if (count == (PERIOD - 1))
          begin
             count <= 0;
          end
        else 
          begin
             count <= count+1;       
          end

     end

   always @ (posedge clk)
     begin
        p <= count < PULSE_WIDTH;       
     end

endmodule