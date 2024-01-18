/*
-------------------------------------------------------------------------------
-- Title      : testbench de l'addition de constante
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : pc_tb.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps

module pc_tb();
import ascon_pack::*;

	logic [3:0] Round_s;
	type_state pc_i_s;
	type_state pc_out_s;

pc pc_inst(
	.pc_i(pc_i_s),
	.pc_o(pc_out_s),
	.Round_i(Round_s)
	);

initial
begin
	pc_i_s[0] = 64'h80400c0600000000;
	pc_i_s[1] = 64'h0001020304050607;
	pc_i_s[2] = 64'h08090ab0c0d0e0f;
	pc_i_s[3] = 64'h0011223344556677;
	pc_i_s[4] = 64'h8899aabbccddeeff;
	Round_s = 4'b0000;

	#50;
end

endmodule : pc_tb
