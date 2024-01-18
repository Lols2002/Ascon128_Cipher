/*
-------------------------------------------------------------------------------
-- Title      : définition de la transformation d'addition de constante
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : pc.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps

module pc
import ascon_pack::*;
(
	input type_state pc_i,
	output type_state pc_o,
	input logic[3:0] Round_i
);


assign pc_o[0] = pc_i[0];
assign pc_o[1] = pc_i[1];
assign pc_o[3] = pc_i[3];
assign pc_o[4] = pc_i[4];
assign pc_o[2][63:8] = pc_i[2][63:8];
assign pc_o[2][7:0] = pc_i[2][7:0] ^ round_constant[Round_i];

endmodule : pc
