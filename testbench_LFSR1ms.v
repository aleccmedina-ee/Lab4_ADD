module testbench_LFSR1ms();
	reg enable,rst,clk;
	wire LFSR_onems,onems;
	
	always begin
		clk=1'b0;
		#10;
		clk=1'b1;
		#10;
	end
	
	LFSR1ms DUT_LFSR1ms(enable,clk,rst,LFSR_onems);
	OneMs DUT_OneMs(enable,clk,rst,onems);

	initial begin
		rst=1'b0;
		@(posedge clk);
		rst=1'b1;
		@(posedge clk);
		enable=1;
	end
endmodule