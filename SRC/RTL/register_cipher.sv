/*
-------------------------------------------------------------------------------
-- Title      : définition du registre contenant la valeur des blocs chiffrés
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : register_cipher.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps

module register_cipher
import ascon_pack::*;

(
    input logic clk, 
    input logic reset ,
    input logic en_cipher,
    input logic [63:0] register_cipher_i,     
    output logic [63:0] register_cipher_o 
);   


always @(posedge clk or negedge reset) 

begin : seq0
	
        if (reset==1'b0 && en_cipher ==1) 
            register_cipher_o <= 64'h0;
	else if (en_cipher == 1)
            register_cipher_o <= register_cipher_i;
        
       
end : seq0

endmodule : register_cipher

