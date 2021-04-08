// ECE 5440
// Alec Medina, PSID: 1681041
// DigitTimer.v
// This creates a modular digit timer than can be altered to fit any timer settings.

module DigitTimer(requestd, requestu, replyu, replyd, reconfig, out, clk, rst);
	input reconfig, clk, rst;
	input requestd, replyu;
	output requestu, replyd;
	output [3:0] out;

	reg requestu, replyd;
	reg enabled;
	reg [3:0] out;

	always@(posedge clk)
	begin
		if (rst == 1'b0)
			begin
				requestu <= 0;
				replyd <= 0;
				out <= 0;
				enabled <= 0;
			end

		else
		begin
				if (reconfig == 1'b1) begin
					out <= 9;
					requestu <= 0;
					replyd <= 0;
					enabled <= 1;
					end

				if (enabled == 1'b1) begin
					if (requestd == 1 && out > 0) begin
						out <= out - 1;
						replyd <= 0;
						requestu <= 0;
						end
					         
					if (out == 0) begin
						requestu <= 1;
						if (replyu==0 && requestd==1) begin
							out <= 9;
							requestu <= 0;
						end
						else if (replyu==1 && requestd==1) begin
							replyd <= 1;
							requestu <= 0;
							enabled <= 0;
						end
					end
				end
			end
	end
endmodule 