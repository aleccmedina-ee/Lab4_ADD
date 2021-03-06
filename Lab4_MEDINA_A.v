module Lab4_MEDINA_A(enterp1,p1in,p1out,enterrng,rngout,sumout,enterpw,pwin,match,nonmatch,loggedin,loggedout,digit1,digit10,clk,rst);
   input enterp1, enterrng, enterpw, clk, rst;
   input [3:0] p1in, pwin;
   output match, nonmatch, loggedin, loggedout;
   output [6:0] p1out, sumout, digit1, digit10, rngout;

   wire loadp1, loadp1out, loadpw, loadrngout, reconfig, timeranout, timerenable,passed;
   wire [3:0] dispsum, dispp1, dispones, disptens, disprand;
   wire borrow_dn_t, noBorrow_o, borrow_dn_h, secondTimer_out, borrow_up_t, timer_out, timer_re;

   Adder sumPlayers(dispp1, disprand, dispsum);

   SevenSegmentDecoder player1_display(dispp1, p1out);
   SevenSegmentDecoder RNG_display(disprand,rngout); 
   SevenSegmentDecoder sum_display(dispsum, sumout);
   SevenSegmentDecoder ones_display(dispones, digit1);
   SevenSegmentDecoder tens_display(disptens, digit10);
   
   ButtonShaper p1_bs(enterp1, loadp1, clk, rst);
   ButtonShaper pw_bs(enterpw, loadpw, clk, rst);
   ButtonShaper tens(borrow_dn_t, borrow_up_t, clk, rst);
   ButtonShaper timerOut(timer_re, timer_out, clk, rst);
	
   //AccessController access(loadpw,pwin,loadp1,loggedin,loggedout,loadp1out,clk,rst,enterrng,loadrngout,reconfig,timer_out,timerenable);
	auth authorization(pwin,loadpw,clk,rst,passed,loggedin,loggedout);
	gamecontrol game(enterrng,loadp1,loadpw,pwin,timer_out,passed,clk,rst,loadrngout,loadp1out,timerenable,reconfig);
	
   LoadRegister p1_load(p1in, dispp1, clk, rst, loadp1out);

   OneSecTimer onesecondTimer_1(timerenable,rst,clk,secondTimer_out);
	
   DigitTimer digitTimer_ones(secondTimer_out, borrow_dn_t, noBorrow_o, timeranout, reconfig, dispones, clk, rst);
   DigitTimer digitTimer_tens(borrow_up_t, borrow_dn_h, 1'b1, noBorrow_o, reconfig, disptens, clk, rst); 
	
   RandomNumberGenerator RNG_1(loadrngout, disprand, clk, rst);
	
   assign timer_re = ~timeranout;
endmodule 