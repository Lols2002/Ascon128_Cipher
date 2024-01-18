/*
-------------------------------------------------------------------------------
-- Title      : définition du compteur de blocs
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : compteur_init.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1 ns/ 1 ps

module compteur_init import ascon_pack::*;
   (
    input logic 	clock_i,
    input logic 	resetb_i,
    input logic 	en_block_i,
    input logic 	init_block_i,
    output logic [3: 0] cpt_o      
    ) ;

   logic [3:0] cpt_s;
   
   always_ff @(posedge clock_i or negedge resetb_i)
     begin
	if (resetb_i == 1'b0) begin
	   cpt_s <= 0;
	end
	else begin 
	   if (en_block_i == 1'b1) 
	     begin
		if (init_block_i==1'b1) begin
		   cpt_s<=0;
		end 
		else cpt_s <= cpt_s+1;
	     end
	end
     end

   assign cpt_o = cpt_s;
   
endmodule: compteur_init


