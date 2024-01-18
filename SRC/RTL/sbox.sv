/*
-------------------------------------------------------------------------------
-- Title      : fichier pour définir le tableau de correspondance de la 
		couche de substitution
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : sbox.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps

module sbox
import ascon_pack::*;
(
	input logic[4:0] Sbox_i,
	output logic[4:0] Sbox_o
);

always@(Sbox_i)

case (Sbox_i)
	8'h00: assign Sbox_o = 8'h04;
	8'h01: assign Sbox_o = 8'h0B;
	8'h02: assign Sbox_o = 8'h1F;
	8'h03: assign Sbox_o = 8'h14;
	8'h04: assign Sbox_o = 8'h1A;
	8'h05: assign Sbox_o = 8'h15;
	8'h06: assign Sbox_o = 8'h09;
	8'h07: assign Sbox_o = 8'h02;
	8'h08: assign Sbox_o = 8'h1B;
	8'h09: assign Sbox_o = 8'h05;
	8'h0A: assign Sbox_o = 8'h08;
	8'h0B: assign Sbox_o = 8'h12;
	8'h0C: assign Sbox_o = 8'h1D;
	8'h0D: assign Sbox_o = 8'h03;
	8'h0E: assign Sbox_o = 8'h06;
	8'h0F: assign Sbox_o = 8'h1C;
	8'h10: assign Sbox_o = 8'h1E;
	8'h11: assign Sbox_o = 8'h13;
	8'h12: assign Sbox_o = 8'h07;
	8'h13: assign Sbox_o = 8'h0E;
	8'h14: assign Sbox_o = 8'h00;
	8'h15: assign Sbox_o = 8'h0D;
	8'h16: assign Sbox_o = 8'h11;
	8'h17: assign Sbox_o = 8'h18;
	8'h18: assign Sbox_o = 8'h10;
	8'h19: assign Sbox_o = 8'h0C;
	8'h1A: assign Sbox_o = 8'h01;
	8'h1B: assign Sbox_o = 8'h19;
	8'h1C: assign Sbox_o = 8'h16;
	8'h1D: assign Sbox_o = 8'h0A;
	8'h1E: assign Sbox_o = 8'h0F;
	8'h1F: assign Sbox_o = 8'h17;
	default: assign Sbox_o= 8'h04;
	
endcase
endmodule : sbox
