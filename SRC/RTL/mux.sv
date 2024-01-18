/*
-------------------------------------------------------------------------------
-- Title      : multiplexeur d'entrée qui permet de sélectionner la bonne valeur 
		en entrée de la permutation
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : mux.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/


`timescale 1ns/1ps

module mux
import ascon_pack::*;
(

	input type_state state_in, 
	input type_state state_out,
	output type_state state_to_pc,
	input logic input_select
);

assign state_to_pc = (input_select)? state_in :  state_out;

endmodule : mux
