/*
-------------------------------------------------------------------------------
-- Title      : définition de la transformation de couche de substitution
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : ps.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps

module ps
import ascon_pack::*;
(
	input type_state ps_i,
	//input logic[3:0] Round_i,
	output type_state ps_o
);

genvar i;

generate 
 for (i=0; i<64;i++)
  begin: label1
	sbox Sbox(
		.Sbox_i({ps_i[0][63-i],ps_i[1][63-i],ps_i[2][63-i],ps_i[3][63-i],ps_i[4][63-i]}),
		.Sbox_o({ps_o[0][63-i],ps_o[1][63-i],ps_o[2][63-i],ps_o[3][63-i],ps_o[4][63-i]})
		);
  end
endgenerate


endmodule : ps
