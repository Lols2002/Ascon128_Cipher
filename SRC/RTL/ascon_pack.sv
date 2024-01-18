/*
-------------------------------------------------------------------------------
-- Title      : package pour définir les constantes de rondes et les type state
-- Project    : ASCON
-------------------------------------------------------------------------------
-- File	      : ascon_pack.sv
-- Author     : Hajar IDJAHA  
-------------------------------------------------------------------------------
*/

package ascon_pack;

	// 320-bit state as 5 64-bit words
	typedef logic[0:4][63:0] type_state;

	// Round constant for constant addition
	localparam logic [7:0]	 round_constant [0:11] = {8'hF0, 8'hE1, 8'hD2, 8'hC3, 8'hB4, 8'hA5, 8'h96, 8'h87, 8'h78, 8'h69, 8'h5A, 8'h4B};

endpackage : ascon_pack
	
