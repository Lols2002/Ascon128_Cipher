/*
-------------------------------------------------------------------------------
-- Title      : définition du registre contenant la valeur du tag
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : register_tag.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps

module register_tag
import ascon_pack::*;
(
    input logic clk, 
    input logic reset ,
    input logic en_tag,
    input logic [127:0] register_tag_i,     
    output logic [127:0] register_tag_o 
);   


always @(posedge clk or negedge reset) 

begin : seq0
	
        if (reset==1'b0 && en_tag ==1) 
            register_tag_o<= {64'h0,64'h0};
	else if (en_tag == 1)
            register_tag_o <= register_tag_i;
        
       
end : seq0

endmodule: register_tag

