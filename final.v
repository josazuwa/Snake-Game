////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//  
//Command: sch2hdl -intstyle ise -family spartan3e -verilog C:/Users/Jeffrey/Desktop/CMPE415/HW3/final.vf -w C:/Users/Jeffrey/Desktop/CMPE415/HW3/final.sch
//Design Name: final
//Device: spartan3e
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module final(BTN_EAST, 
             BTN_WEST,
				 BTN_SOUTH,
             CLK_50MHZ,
				 VGA_BLUE,
				 VGA_GREEN,
				 VGA_RED,
				 VGA_HSYNC,
				 VGA_VSYNC
				 );

   input BTN_EAST;
   input BTN_WEST;
	input BTN_SOUTH;
   input CLK_50MHZ;
	 
	 
	 
   output VGA_BLUE;
	output VGA_GREEN;
	output VGA_RED;
	output VGA_HSYNC;
	output VGA_VSYNC;
	
	wire update;
	wire inc;
	wire obEnd;
	wire [39:0] snakehead;
	wire [39:0] food;
	wire [9:0] hcount;
	wire [9:0] vcount;
	wire [199:0] snakebody;
	wire [3999:0] obstacles;
	wire pix;
	wire blank;
	wire grow;
   wire overlap;
	wire endGame;
	
	wire [3:0] out1;
	wire rs;
	wire rw;
	wire e;
	wire ready;

	wire active;
	
	
	pacemaker pm(CLK_50MHZ, update);
	food f(CLK_50MHZ, update, BTN_SOUTH, snakehead, food, overlap);
	snake s(CLK_50MHZ, update, BTN_WEST, BTN_EAST, BTN_SOUTH, grow, snakehead, snakebody, inc);
	obstacle ob(CLK_50MHZ, inc, BTN_SOUTH, snakehead, obEnd, obstacles);
	endGame eg(CLK_50MHZ, obEnd, update, snakehead, snakebody, endGame);
	vga_sync v(CLK_50MHZ, VGA_HSYNC, VGA_VSYNC, hcount, vcount, pix, blank);
	display d(CLK_50MHZ, update, food, snakehead, snakebody, obstacles, hcount, vcount, blank, endGame, VGA_RED, VGA_GREEN, VGA_BLUE);
	LCDDriver lcd(out1, e, rs, rw, ready, inc, hcount[6:0], vcount[7:0], BTN_SOUTH, clk);
	
endmodule
