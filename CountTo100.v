// ECE 5440
// Alec Medina, PSID: 1681041
// CountTo100
// This module is used to count to 100.
// Last Update : 3/23/21
module CountTo100(enable,onems,clk,rst,hundredms);
	input enable,onems,clk,rst;
	output hundredms;
	reg hundredms;
	reg [6:0] count;

	always@(posedge clk) begin
		if(rst==1'b0)
			count<=7'd0;
		else begin
			if(enable & onems) begin
				if(count==7'd100) begin
					hundredms<=1'b1;
					count<=7'd0;
				end
		
				else begin
					hundredms<=1'b0;
					count<=count+7'd1;
				end
			end
			else
				hundredms<=1'b0;
		end
	end
endmodule