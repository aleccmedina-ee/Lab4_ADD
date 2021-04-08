`timescale 1 ns/100 ps;
module testbench_auth();
	reg enter,clk,rst;
	reg [3:0] switches;
	wire passed;
	
	always begin
		clk=1'b0;
		#10;
		clk=1'b1;
		#10;
	end
	
	auth auth_DUT(switches,enter,clk,rst,passed);
	
	initial begin
		rst=1'b0;
		@(posedge clk);
		rst=1'b1;
		@(posedge clk);
		
		switches=4'b0001;
		enter=1'b1;
		@(posedge clk);
		enter=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);		
		
		switches=4'b0010;
		enter=1'b1;
		@(posedge clk);
		enter=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);		
		
		switches=4'b0011;
		enter=1'b1;
		@(posedge clk);
		enter=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);		
		
		switches=4'b0101;
		enter=1'b1;
		@(posedge clk);
		enter=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
				switches=4'b0001;
		enter=1'b1;
		@(posedge clk);
		enter=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);		
		
		switches=4'b0010;
		enter=1'b1;
		@(posedge clk);
		enter=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);		
		
		switches=4'b0011;
		enter=1'b1;
		@(posedge clk);
		enter=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);		
		
		switches=4'b0100;
		enter=1'b1;
		@(posedge clk);
		enter=1'b0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
	end
endmodule
