// ECE 5440
// Alec Medina, PSID: 1681041
// ButtonShaper
// This module is used shape an input of any clock cylce length to an output of exactly one clock cycle in length.
// Last Update : 3/23/21
module ButtonShaper(bin,bout,clk,rst);
	input bin,clk,rst;
	output bout;
	reg bout;
	parameter INIT=0,PULSE=1,WAIT=2;
	reg [1:0] state,nextState;

	always@(state,bin) begin
		case(state)
			INIT: begin
				bout=1'b0;
				if(bin==1'b0)
					nextState=PULSE;
				else
					nextState=INIT;
			end
			PULSE: begin
				bout=1'b1;
				nextState=WAIT;
			end
			WAIT: begin
				bout=1'b0;
				if(bin==1'b1)
					nextState=INIT;
				else
					nextState=WAIT;
			end
			default: begin
				bout=1'b0;
				nextState=INIT;
			end
		endcase
	end

	always @(posedge clk) begin
		if (rst==1'b0)
			state<=INIT;
		else
			state<=nextState;
	end
endmodule











