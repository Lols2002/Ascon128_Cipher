/*
-------------------------------------------------------------------------------
-- Title      : définition de l'ascon top, qui inclut la permutation entière, les compteurs de blocs 
		et de rondes et la fsm
		
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : ascon_top.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps

module ascon_top import ascon_pack::*;
(
	input logic clock_s , 
	input logic resetb_s,
	input logic start_s, 
	input logic[63:0] data_s,
	input logic [127:0] key_s,
	input logic [127:0] nonce_s,
	input logic data_valid_s,
	output logic cipher_valid_s,
	output logic[63:0] cipher_s, 
	output logic[127:0] tag_s,
	output logic end_s
);

	logic[3:0] round_s;
	logic[3:0] block_s;
	
	logic data_sel_s;
	logic en_reg_state_s;
	logic en_cipher_s;
	logic en_tag_s;
	


	logic en_block_s;
	logic en_round_s; 
	logic init_block_s;
	logic init_a_s;
	logic init_b_s;

	logic en_xor_key_s;
	logic en_xor_lsb_s;
	logic en_xor_data_s;
	logic en_xor_key_end_s;

	type_state state_i_s;
	type_state state_o_s;

assign state_i_s[0] = 64'h80400C0600000000;
assign state_i_s[1] = key_s[127:64];
assign state_i_s[2] = key_s[63:0];
assign state_i_s[3] = nonce_s[127:64];
assign state_i_s[4] = nonce_s[63:0];

	full_permutation full_per_inst(
	.state_i(state_i_s), 
 	.round_i(round_s), 
	.data_sel_i(data_sel_s),  
	.clock_i(clock_s),
	.resetb_i(resetb_s),
	.en_xor_data_i(en_xor_data_s), 
	.en_xor_key_i(en_xor_key_s), 
	    
	.en_xor_key_end_i(en_xor_key_end_s), 
	.en_xor_lsb_i(en_xor_lsb_s), 
	.en_reg_state_i(en_reg_state_s), 
	.en_cipher_i(en_cipher_s),
	.en_tag_i(en_tag_s),
	.data_i(data_s),
	.key_i(key_s),
	.state_o(state_o_s), 
	.cipher_o(cipher_s),
	.tag_o(tag_s)
);




	compteur_init comp_init_inst
   (
	.clock_i(clock_s),
	.resetb_i(resetb_s),
	.en_block_i(en_block_s),
	.init_block_i(init_block_s),
	.cpt_o(block_s)      
    );

	compteur_double_init comp_db_inst
   (
	.clock_i(clock_s),
	.resetb_i(resetb_s),
	.en_round_i(en_round_s),
	.init_a_i(init_a_s),
	.init_b_i(init_b_s),
	.cpt_o(round_s)      
    );


	fsm_moore fsm_moore_inst(
		
	.clock_i(clock_s), 
	.resetb_i(resetb_s),
	.start_i(start_s), 
	.data_valid_i(data_valid_s),

	.round_i(round_s),
	.block_i(block_s),
	
	.data_sel_o(data_sel_s),
	.en_reg_state_o(en_reg_state_s),
	.en_cipher_o(en_cipher_s),
	.en_tag_o(en_tag_s),
	.cipher_valid_o(cipher_valid_s), 
	.end_o(end_s),

	.en_block_o(en_block_s),
	.en_round_o(en_round_s), 
	.init_block_o(init_block_s),
	.init_a_o(init_a_s),
	.init_b_o(init_b_s),

	.en_xor_key_o(en_xor_key_s),
	.en_xor_lsb_o(en_xor_lsb_s),
	.en_xor_data_o(en_xor_data_s),
	.en_xor_key_end_o(en_xor_key_end_s)

);
endmodule: ascon_top
