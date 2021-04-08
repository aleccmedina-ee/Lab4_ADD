module LoadRegister(dIn,dOut,clk,rst,load);
	input [3:0] dIn;
	output [3:0] dOut;
	reg [3:0] dOut;
	input clk, rst, load;

	always@(posedge clk)
	begin
		if(rst==1'b0)
		begin
			dOut<=4'b0000;
		end

		else
		begin
			if(load==1'b1)
			begin
				dOut<=dIn;
			end
		end      
	end
endmodule 