// ECE 5440
// Alec Medina, PSID: 1681041
// CountTo10
// This module is used to count to 10.
// Last Update : 3/23/21
module CountTo10(enable,hundredms,clk,rst,sec);
	input enable,hundredms,clk,rst;
	output sec;
	reg sec;
	reg [3:0] count;
	
	always@(posedge clk) begin
		if(rst==1'b0)
			count<=1'b0;
		else begin
			if(enable&hundredms) begin
				if(count==4'd10) begin
					sec<=1'b1;
					count<=4'd0;
				end
			
				else begin
					sec<=1'b0;
					count<=count+4'd1;
				end
			end
			else	
				sec<=1'b0;
		end
	end
endmodule
