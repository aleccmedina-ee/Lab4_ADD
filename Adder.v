// ECE 5440
// Alec Medina, PSID: 1681041
// Adder
// This is the adder module that takes 2 4bit inputs and outputs the 4bit sum.
// Last Update : 3/5/21
module Adder(player1,player2,sum);
  input [3:0] player1,player2;
  output [3:0] sum;
  reg [3:0] sum;

  always@(player1,player2)
  begin
    sum=player1+player2;
  end 
endmodule
