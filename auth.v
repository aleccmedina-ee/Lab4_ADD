module auth(switches,enter,clk,rst,passed,loggedin,loggedout);
	input [3:0] switches;
	input enter, clk, rst;
	
	output passed,loggedin,loggedout;
	reg [4:0] addr;
	reg passed,loggedin,loggedout,verify;
	
	parameter BTNCHECK=0, GETROMDATA=1, ROMCYL1=2, ROMCYL2=3, ROMCATCH=4, COMPARE=5, COMPLETECHECK=6, VERIFY=7, SUCCESS=8;	
    reg [3:0] STATE;
	
	wire [3:0] q_ROM;
	ROM_PSWD rom(addr,clk,q_ROM);
	
	reg [1:0] counter;
	always@(posedge clk) begin
		if(rst==1'b0) begin
			passed<=1'b0;
			loggedin<=1'b0;
			loggedout<=1'b1;
			counter<=2'b00;
			verify<=1'b1;
			STATE<=BTNCHECK;
		end
		else begin
			case(STATE)
				BTNCHECK: begin
					if(enter==1'b1) begin
						STATE<=GETROMDATA;
					end
				end
				GETROMDATA: begin
					addr<={3'b000,counter};
					STATE<=ROMCYL1;
				end
				ROMCYL1: begin
					STATE<=ROMCYL2;
				end
				ROMCYL2: begin
					STATE<=ROMCATCH;
				end
				ROMCATCH: begin
					STATE<=COMPARE;
				end
				COMPARE: begin
					if(q_ROM!=switches) begin
						verify<=1'b0;
					end
					STATE<=COMPLETECHECK;
				end
				COMPLETECHECK: begin
					if(counter<2'b11) begin
						counter<=counter+1;
						STATE<=BTNCHECK;
					end
					else begin
						STATE<=VERIFY;
					end
				end
				VERIFY: begin
					if(verify==1'b1) begin
						STATE<=SUCCESS;
					end
					else begin
						verify<=1'b1;
						counter<=2'b0;
						STATE<=BTNCHECK;
					end
				end
				SUCCESS: begin
					passed=1'b1;
					loggedin<=1'b1;
					loggedout<=1'b0;
				end
				default: begin			
					passed<=1'b0;
					counter<=2'b0;
					addr<={3'b000,counter};
					verify<=1'b1;
					STATE<=BTNCHECK;
				end
			endcase
		end
	end
endmodule
