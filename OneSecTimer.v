// ECE 5440
// Alec Medina, PSID: 1681041
// OneSecTimer
// This module is used to count to 1 second.
// Last Update : 3/23/21
module OneSecTimer(enable,rst,clk,sec);
	input enable,rst,clk;
	output sec;
	
	wire onems;
	LFSR1ms onemstimer(enable,clk,rst,onems);

	wire hundredms;
	CountTo100 count100(enable,onems,clk,rst,hundredms);
	
	CountTo10 count10(enable,hundredms,clk,rst,sec);
	
endmodule
