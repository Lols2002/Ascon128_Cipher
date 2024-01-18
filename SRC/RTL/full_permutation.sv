/*
-------------------------------------------------------------------------------
-- Title      : définition de la permutation avec les xor et les registres cipher et tag
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : full_permutation.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps



module full_permutation
import ascon_pack::*;


(
    input type_state state_i, //état d'initialisation
    
    input logic[3:0] round_i, //ronde
    input logic data_sel_i,  //variable de décision du mux
    input logic clock_i,
    input logic resetb_i,
    input logic en_xor_data_i, //xor au début de la donnée associée et au texte clair
    input logic en_xor_key_i, //xor avant la finalisation
    input logic en_xor_key_end_i, //le xor à la fin de l'initialisation
    input logic en_xor_lsb_i, // le xor à la fin du traitement de la donnée associée
    input logic en_reg_state_i, //le signal enable du registre 
    input logic en_cipher_i,
    input logic en_tag_i,
    
    input logic [63:0] data_i,
    input logic [127:0] key_i,
    output type_state state_o, //sortie du registre
    output logic [63:0] cipher_o,
    output logic [127:0] tag_o

);

	type_state pc_s;
	type_state  ps_s;
	type_state pl_s;
	type_state register_s;
	type_state state_pc_s;
	type_state xor_b_to_add_s;
	type_state xor_e_to_reg_s;
	logic [127:0] tag_s;
	
	

        
    mux mux_inst (
        .state_in(state_i),
        .state_out(register_s),
        .state_to_pc(state_pc_s),
        .input_select(data_sel_i)
    );

    xor_begin xor_begin_inst (
	.en_xor_data_i(en_xor_data_i),
	.en_xor_key_i(en_xor_key_i),
	.state_i(state_pc_s),  //c'est la valeur à la sortie du mux et qui va à pc qui rentre dans le xor begin
	.state_o(xor_b_to_add_s),
	.data_i(data_i),
	.key_i(key_i)
    );

    register_cipher register_cipher_inst(
	.clk(clock_i),
	.reset(resetb_i),
	.en_cipher(en_cipher_i),
	.register_cipher_i(xor_b_to_add_s[0]),
	.register_cipher_o(cipher_o)
    );

    
    pc pc_inst (
        .pc_i(xor_b_to_add_s),
        .pc_o(pc_s),
	.Round_i(round_i)
    );

    
    ps ps_inst (
        .ps_i(pc_s),
        .ps_o(ps_s)
    );

    
    pl pl_inst (
        .pl_i(ps_s),
        .pl_o(pl_s)
    );

    xor_end xor_end_inst (
	.key_i(key_i),
	.en_xor_lsb_i(en_xor_lsb_i),
	.en_xor_key_end_i(en_xor_key_end_i),
	.state_i(pl_s),
	.state_o(xor_e_to_reg_s)
    );



assign tag_s = { xor_e_to_reg_s[3] , xor_e_to_reg_s[4]};

    register_tag register_tag_inst(
	.clk(clock_i),
	.reset(resetb_i),
	.en_tag(en_tag_i),
	.register_tag_i(tag_s),
	.register_tag_o(tag_o)
	);

    dff_320 dff_inst (
        .clk(clock_i),
        .reset(resetb_i),
	.en_i(en_reg_state_i),
        .register_i(xor_e_to_reg_s),
        .register_o(register_s)
    );

assign state_o = register_s;



endmodule:full_permutation
