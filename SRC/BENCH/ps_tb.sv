/*
-------------------------------------------------------------------------------
-- Title      : testbench de la transformation de couche de substitution
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : ps_tb.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/


`timescale 1ns/1ps

module ps_tb();
import ascon_pack::*;

	type_state ps_i_s;
	type_state ps_o_s;

ps PS(
	.ps_i(ps_i_s),
	.ps_o(ps_o_s)
	);

initial
begin
	ps_i_s[0] = 64'h80400c0600000000;
	ps_i_s[1] = 64'h0001020304050607;
	ps_i_s[2] = 64'h08090a0b0c0d0eff;
	ps_i_s[3] = 64'h0011223344556677;
	ps_i_s[4] = 64'h8899aabbccddeeff;

	#10;
end

endmodule : ps_tb
