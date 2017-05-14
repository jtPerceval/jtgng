`timescale 1ns/1ps

/*

	Schematic sheet: 85606-B-2-8/9 Scroll video RAM

*/

module jt_gng_b8(
	inout [7:0]		DB,		// from 7/9
	input			V128F,	// from 1/9
	input			V64F,
	input			V32F,
	input			V16F,
	input			V8F,
	input			V4F,
	input			V2F,
	input			V1F,
	input			OH,		// from 4/9
	input			POS3,	// from 1/9
	input			POS2,
	input			WR_b,
	input			SCREN_b,// from 7/9
	input			SCRCS_b,
	input			SH256,
	input			SH128,
	input			SH64,
	input			SH32,
	input			SH16,
	input			SH2,
	input			S2H,
	input			S0H,
	input			S4H,

	input [10:0]	AB,		// from 1/9
	output  reg [9:0]	AS,		// to 9/9

	output	reg		V256S,	// to 9/9
	output	reg		V128S,
	output	reg		V64S,
	output	reg		V32S,
	output	reg		V16S,
	output	reg		V8S,
	output	reg		V4S,
	output	reg		V2S,
	output	reg		V1S,
	output	reg		SVFLIP,
	output	reg		SHFLIP,
	output	reg		SHFLIP_q,
	output	reg		SCRWIN,
	output  reg [2:0]	SCO
);

reg [8:0] dbq;
reg [7:0] Vq;

always @(posedge POS2) dbq[7:0] <= DB;
always @(posedge POS3) dbq[ 8 ] <= DB[0];
always @(posedge OH) Vq <= {V128F,V64F,V32F,V16F,V8F,V4F,V2F,V1F};

// 10D, 10B, 11B
always @(*)
	{V256S,V128S,V64S,V32S,V16S,V8S,V4S,V2S,V1S} <= Vq+dbq;

wire [7:0] DB, DF;
reg  [10:0] ram_a;
reg ram_we_b;

jt74245 u_10A(
	.a		( DF      ),
	.b		( DB      ),
	.dir	( SCREN_b ),
	.en_b	( WR_b	  )
);

// 9A, 9B, 9C
always @(*)
	if( SCREN_b ) begin
		ram_a  = {	SH2, SH256, SH128,
					SH64, SH32, SH16, V256S, 
					V128S, V64S, V32S, V16S };
		ram_we_b = 1'b1;
	end else begin
		ram_a  = AB;
		ram_we_b = SCRCS_b | WR_b;
	end

M58725 ram(
	.addr	( ram_a 	),
	.d		( DF		),
	.oe_b	( 1'b0		),
	.ce_b	( 1'b0		),
	.we_b	( ram_we_b	)
);

// 5A
always @(posedge S2H) AS[7:0] <= DF;
// 6A
reg [3:0] aux;
always @(posedge S4H) {AS[9:8], SVFLIP, SHFLIP, aux} <= DF;
// 6B
always @(posedge S0H) {SHFLIP_q, SCRWIN, SCO } <= aux;

endmodule // jt_gng_b8