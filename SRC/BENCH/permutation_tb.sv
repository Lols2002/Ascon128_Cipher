/*
-------------------------------------------------------------------------------
-- Title      : testbench de la permutation initialisation
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : permutation_tb.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

`timescale 1ns/1ps
module permutation_tb import ascon_pack::*;
	(
	);



	type_state state_in_s;
	type_state state_out_s;
	logic data_sel_s;
	logic[3:0] round_s;
	logic resetb_s;
	logic clock_s;
	logic en_reg_state_s;


    permutation DUT (
        .state_i(state_in_s),
        .state_o(state_out_s),
	.round_i(round_s),
        .data_sel_i(data_sel_s),
        .clock_i(clock_s),
        .resetb_i(resetb_s),
	.en_reg_state_i(en_reg_state_s)
    );

initial
begin

	clock_s = 0;
	forever #50 clock_s = ~clock_s;
end


initial 
begin
	resetb_s = 0;
	#25
	resetb_s = 1;
end


initial
begin
	data_sel_s = 1;
	#100
	data_sel_s = 0;
end

initial begin

	integer i;
        for (i = 0; i < 12; i++) begin
            round_s = i;
            #100;
        end

	
end


initial
begin
	en_reg_state_s = 1;
	#1200
	en_reg_state_s = 0;
end


initial 
begin

	state_in_s[0] = 64'h80400c0600000000 ;
       	state_in_s[1] = 64'h0001020304050607 ;
        state_in_s[2] = 64'h08090a0b0c0d0e0f ;
        state_in_s[3] = 64'h0011223344556677 ;
	state_in_s[4] = 64'h8899aabbccddeeff ;

	#100;
end

endmodule : permutation_tb

