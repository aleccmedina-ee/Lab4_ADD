module gamecontrol(generaterng,enterplayer,gameaction,switches,timeout,passed,clk,rst,rngout,playerout,timerenable,reconfig);
	input generaterng,enterplayer,gameaction,timeout,clk,rst,passed;
	input [3:0] switches;
	output rngout,playerout,timerenable,reconfig;
	reg rngout,playerout,timerenable,reconfig;

	parameter PASSED=0,RECONFIGURE=1,BEGINGAME=2,ENDGAME=3;
	reg [1:0] STATE;
		
    always@(posedge clk) begin
		if(rst==1'b0) begin
			rngout <= 1'b1;
			playerout <= 1'b0;
			reconfig <= 1'b0;
			timerenable <= 1'b0;
			STATE <= PASSED;
		end
		else begin
			case(STATE)
				PASSED: begin
					if(passed==1'b1) begin
						STATE<=RECONFIGURE;
					end
				end
				RECONFIGURE: begin
					rngout <= 1'b1;
					playerout <= 1'b0;
					reconfig <= 1'b1;
					timerenable <= 1'b0;
					STATE <= BEGINGAME;
				end
				BEGINGAME: begin
					reconfig <= 1'b0;
					playerout<=enterplayer;
					rngout<=generaterng;
					
					if (gameaction == 1'b1) begin 
						timerenable <= 1'b1; 
					end

					if (timeout == 1'b1) begin 
						timerenable <= 1'b0;
						STATE <= ENDGAME;
					end
					else begin 
						STATE <= BEGINGAME; 
					end
				end
				ENDGAME: begin
                    if (gameaction == 1'b1) begin
						STATE <= RECONFIGURE;
                    end
                    else begin
						STATE <= ENDGAME;
                    end
				end
			endcase
		end
    end
endmodule