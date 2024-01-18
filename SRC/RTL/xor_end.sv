/*
-------------------------------------------------------------------------------
-- Title      : définition des xor end avec un bit de poids faible ainsi qu'avec la clé secrète
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : xor_begin.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps 

module xor_end 
import ascon_pack::*;
(
	input logic [127:0] key_i,
	input logic en_xor_lsb_i, 
	input logic en_xor_key_end_i,
	input type_state state_i,	
	output type_state state_o
);

logic [127:0] data;

always @(en_xor_lsb_i,en_xor_key_end_i,data,key_i,state_i)
begin
	if (en_xor_lsb_i == 1'b1) data = {state_i[3],state_i[4]^en_xor_lsb_i};
	else if (en_xor_key_end_i == 1'b1) data = key_i ^ {state_i[3], state_i[4]};
	else data = {state_i[3], state_i[4]};
	

end

assign state_o[3] = data[127:64];
assign state_o[4] = data[63:0];

assign state_o[0] = state_i[0];
assign state_o[1] = state_i[1];
assign state_o[2] = state_i[2];

endmodule:xor_end
