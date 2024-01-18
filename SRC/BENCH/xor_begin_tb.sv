/*
-------------------------------------------------------------------------------
-- Title      : testbench du xor begin, en utlisant la donnée associée
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : xor_begin_tb.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/
`timescale 1 ns/ 1 ps

module xor_begin_tb import ascon_pack::*;
   (
    ) ;

	logic en_xor_data_s;
	logic en_xor_key_s;
	type_state state_i_s;
	type_state state_o_s;
	logic [63:0] data_s;
	logic [127:0] key_s;

xor_begin DUT (
	.en_xor_data_i(en_xor_data_s),
	.en_xor_key_i(en_xor_key_s), 
	.state_i(state_i_s),
	.state_o(state_o_s),	
	.data_i(data_s),
	.key_i(key_s)	
	);

initial begin


	key_s	 = 128'h000102030405060708090A0B0C0D0E0F;
	data_s   = 64'h3230323380000000;

	en_xor_data_s = 1'b1;
	en_xor_key_s = 1'b0;

	state_i_s[0] = 64'h1b1354db77e0dbb4;
	state_i_s[1] = 64'h6f140401cfa0873c;
	state_i_s[2] = 64'hd7e8abaf45f2885a;
	state_i_s[3] = 64'hc0c5777fa661625e;
	state_i_s[4] = 64'hfc4374d28210928c;
	#105;


end

endmodule:xor_begin_tb
