/*
-------------------------------------------------------------------------------
-- Title      : testbench du xor end 
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : xor_end_tb.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/
`timescale 1 ns/ 1 ps

module xor_end_tb import ascon_pack::*;
   (
    ) ;

	logic [127:0] key_s;
	logic en_xor_lsb_s; 
	logic en_xor_key_end_s;
	type_state state_i_s;	
	type_state state_o_s;

xor_end DUT (
	.key_i(key_s),
	.en_xor_lsb_i(en_xor_lsb_s), 
	.en_xor_key_end_i(en_xor_key_end_s),
	.state_i(state_i_s),	
	.state_o(state_o_s)
	
	);

initial begin


	key_s	 = 128'h000102030405060708090A0B0C0D0E0F;

	en_xor_key_end_s = 1'b1;
	en_xor_lsb_s = 1'b0;

	state_i_s[0] = 64'h1b1354db77e0dbb4;
	state_i_s[1] = 64'h6f140401cfa0873c;
	state_i_s[2] = 64'hd7e8abaf45f2885a;
	state_i_s[3] = 64'hc0c4757ca2646459;
	state_i_s[4] = 64'hf44a7ed98e1d9c83;
	#105;


end

endmodule:xor_end_tb
