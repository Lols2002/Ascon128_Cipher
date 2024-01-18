/*
-------------------------------------------------------------------------------
-- Title      : testbench de la permutation avec les xor
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : permutation_v2_tb.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps
module permutation_v2_tb();
import ascon_pack::*;


type_state state_i_s; //état d'initialisation
type_state state_o_s; //sortie du registre
logic[3:0] round_s; //ronde
logic data_sel_s;  //variable de décision du mux
logic clock_s;
logic resetb_s;
logic en_xor_data_s; //xor au début de la donnée associée et au texte clair
logic en_xor_key_s; //xor avant la finalisation
logic en_xor_key_end_s; //le xor à la fin de l'initialisation
logic en_xor_lsb_s; // le xor à la fin du traitement de la donnée associée
logic en_reg_state_s; //le signal enable du registre 
logic [63:0] data_s;
logic [127:0] key_s;


    permutation_v2 permutation_inst (
	.state_i(state_i_s), 
	.state_o(state_o_s), 
	.round_i(round_s), 
	.data_sel_i(data_sel_s),  
	.clock_i(clock_s),
	.resetb_i(resetb_s),
	.en_xor_data_i(en_xor_data_s), 
	.en_xor_key_i(en_xor_key_s), 
	.en_xor_key_end_i(en_xor_key_end_s), 
	.en_xor_lsb_i(en_xor_lsb_s), 
	.en_reg_state_i(en_reg_state_s), 
	.data_i(data_s),
	.key_i(key_s)
    );


initial
begin

	clock_s = 0;
	forever #50 clock_s = ~clock_s;
end


initial 
begin

	state_i_s[0] = 64'h80400c0600000000 ;
       	state_i_s[1] = 64'h0001020304050607 ;
        state_i_s[2] = 64'h08090a0b0c0d0e0f ;
        state_i_s[3] = 64'h0011223344556677 ;
	state_i_s[4] = 64'h8899aabbccddeeff ;

	#100;
end

initial 
begin

	data_s = 64'h3230323380000000;

	#100;

end

initial
begin 
	key_s = 128'h000102030405060708090A0B0C0D0E0F;

	#100;
end



initial
begin
	en_xor_key_s = 0;
	en_xor_data_s = 0;
	en_xor_key_end_s = 0;
	#100;
end


initial
begin
	en_xor_lsb_s = 0;
	#100;
end



initial 
begin
	resetb_s = 0;
	#25;
	resetb_s = 1;
end

initial
begin
	data_sel_s = 1;
	#100
	data_sel_s = 0;
end

initial 
begin
	integer i;
	for (i=0; i<12 ; i++) begin
	if (i == 11) begin
		
		en_xor_data_s = 0; 
		en_xor_key_end_s = 1;	
		round_s = i;
		#100;
	end else begin
		en_xor_data_s = 0;
		en_xor_key_end_s = 0;
		round_s = i;
		#100;
	end
	end
end

initial 
begin
	en_reg_state_s = 1;
	#1200
	en_reg_state_s=0;

end



endmodule : permutation_v2_tb



