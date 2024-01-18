/*
-------------------------------------------------------------------------------
-- Title      : définition de la première version de la permutation, avec ps, pl, 
		pc, le registre et le multiplexeur
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : ascon_pack.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/


`timescale 1ns/1ps



module permutation 
import ascon_pack::*;


(
    input type_state state_i, //état d'initialisation
    output type_state state_o, //sortie du registre
    input logic[3:0] round_i, //ronde
    input logic data_sel_i,  //variable de décision du mux
    input logic clock_i,
    input logic resetb_i,
    input logic en_reg_state_i

);

	type_state pc_s;
	type_state  ps_s;
	type_state pl_s;
	type_state register_s;
	type_state state_pc_s;

	

        
    mux mux_inst (
        .state_in(state_i),
        .state_out(register_s),
        .state_to_pc(state_pc_s),
        .input_select(data_sel_i)
    );



    
    pc pc_inst (
        .pc_i(state_pc_s),
        .pc_o(pc_s),
	.Round_i(round_i)
    );

    
    ps ps_inst (
        .ps_i(pc_s),
        .ps_o(ps_s)
    );

    
    pl pl_inst (
        .pl_i(ps_s),
        .pl_o(pl_s)
    );

    dff_320 dff_inst (
        .clk(clock_i),
        .reset(resetb_i),
	.en_i(en_reg_state_i),
        .register_i(pl_s),
        .register_o(register_s)
    );

assign state_o = register_s;

endmodule:permutation
