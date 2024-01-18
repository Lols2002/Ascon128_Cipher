/*
-------------------------------------------------------------------------------
-- Title      : testbench de la transformation de diffusion linéaire
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : pl_tb.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps



module pl_tb();
import ascon_pack::*;

	type_state pl_i_s;
	type_state pl_o_s;

pl PL(
	.pl_i(pl_i_s),
	.pl_o(pl_o_s)
	);

initial
begin
	pl_i_s[0] = 64'h8859263f4c5d6e8f;
	pl_i_s[1] = 64'h00c18e8584858607;
	pl_i_s[2] = 64'h7f7f7f7f7f7f7f8f;
	pl_i_s[3] = 64'h80c0848680808070;
	pl_i_s[4] = 64'h8888888a88888888;

	#10;
end

endmodule : pl_tb
