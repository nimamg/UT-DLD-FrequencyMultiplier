`timescale 1ns/1ns

module barrelShifter (input n,input [15:0] m, output [15:0] k);
	assign k = (n==1) ? {1'b0,m[15:1]} :
					(n==2) ? {2'b0,m[15:2]} :
					(n==3) ? {3'b0,m[15:3]} :
					(n==4) ? {4'b0,m[15:4]} :
					{5'b0,m[15:5]};
endmodule