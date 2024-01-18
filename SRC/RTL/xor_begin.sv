/*
-------------------------------------------------------------------------------
-- Title      : définition des xor begin avec la donnée associée et les blocs 
		de texte clair, ainsi qu'avec la clé secrète
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : xor_begin.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/


`timescale 1ns/1ps

module xor_begin
import ascon_pack::*;
(

	input logic en_xor_data_i,en_xor_key_i,
	input type_state state_i,
	output type_state state_o,
	input logic [63:0] data_i,
	input logic [127:0] key_i
);

logic [127:0] data_s;



assign state_o[0] = en_xor_data_i == 1'b1 ? state_i[0]^data_i : state_i[0];

always @(en_xor_data_i, en_xor_key_i,state_i,data_i,key_i)
begin

	
	if (en_xor_key_i == 1'b1) data_s = key_i^ {state_i[1], state_i[2]};
	else
		data_s = {state_i[1], state_i[2]} ; 
end


assign state_o[1] = data_s[127:64];
assign state_o[2] = data_s[63:0];

assign state_o[3] = state_i[3];
assign state_o[4] = state_i[4];


endmodule:xor_begin
