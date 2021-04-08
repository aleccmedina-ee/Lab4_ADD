// ECE 5440
// Alec Medina, PSID: 1681041
// OneSecTimer
// This module is used to count to 1 ms.
// Last Update : 3/23/21
module OneMs(enable,clk,rst,onems);
	input enable,clk,rst;
	output onems;
	reg onems;
	reg [15:0] count;

	always@(posedge clk) begin
		if(rst==1'd0)
			count<=16'd0;
		else begin
			if(enable==1'b1) begin
				if(count==16'd50000) begin
					onems<=1'd1;
					count<=16'd0;
				end

				else begin
					onems<=1'd0;
					count<=count+16'd1;
				end
			end
		end	
	end
endmodule
