/*
-------------------------------------------------------------------------------
-- Title      : testbench du chiffrement en entier
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : ascon_top_tb.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps
module ascon_top_tb();
import ascon_pack::*;


logic clock_tb_s;
logic resetb_tb_s;
logic start_tb_s; 
logic[63:0] data_tb_s;
logic [127:0] key_tb_s;
logic [127:0] nonce_tb_s;	
logic data_valid_tb_s;
logic cipher_valid_tb_s;
logic[63:0] cipher_tb_s; 
logic [127:0] tag_tb_s;
logic end_tb_s;



    ascon_top ascon_top_inst (
	.clock_s(clock_tb_s),
	.resetb_s(resetb_tb_s),
	.start_s(start_tb_s),
	.data_s(data_tb_s),
	.key_s(key_tb_s),
	.nonce_s(nonce_tb_s),	
	.data_valid_s(data_valid_tb_s),
	.cipher_valid_s(cipher_valid_tb_s),
	.cipher_s(cipher_tb_s),
	.tag_s(tag_tb_s),
	.end_s(end_tb_s)
    );



initial
begin

	clock_tb_s = 0;
	forever #50 clock_tb_s = ~clock_tb_s;
end


initial 
begin
	
	key_tb_s = 128'h000102030405060708090A0B0C0D0E0F;
	nonce_tb_s = 128'h00112233445566778899AABBCCDDEEFF;
	
        resetb_tb_s = 1'b0;
        data_valid_tb_s = 1'b0;
        start_tb_s = 1'b0;

	#100;
	
end

initial
begin


	resetb_tb_s = 1'b1;
	#20;
	start_tb_s = 1'b1;
 
	data_valid_tb_s = 1'b1;
	data_tb_s = 64'h3230323380000000;
	#2100; 

	data_valid_tb_s = 1'b1;
        data_tb_s = 64'h436F6E636576657A;
	#850; 


	data_valid_tb_s = 1'b1;
        data_tb_s = 64'h204153434F4E2065;
	#650; 

	data_valid_tb_s = 1'b1;
        data_tb_s = 64'h6E2053797374656D;
	#600; 

	data_valid_tb_s = 1'b1;
        data_tb_s = 64'h566572696C6F6780;
	#650; 

	data_valid_tb_s = 1'b0;
	#260;
      
end


endmodule : ascon_top_tb



