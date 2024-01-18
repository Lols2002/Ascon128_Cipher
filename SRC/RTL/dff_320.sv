/*
-------------------------------------------------------------------------------
-- Title      : définition du registre de fin de permutation
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : dff_320.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps

module dff_320
import ascon_pack::*;
(
    input logic clk, 
    input logic reset ,
    input logic en_i,
    input type_state register_i,     
    output type_state register_o 
);   


always @(posedge clk or negedge reset) 

begin : seq0
	
        if (reset==1'b0 && en_i ==1) 
            register_o<= {64'h0,64'h0,64'h0,64'h0,64'h0};
	else if (en_i == 1)
            register_o <= register_i;
        
       
end : seq0

endmodule: dff_320

