// ECE 5440
// Alec Medina, PSID: 1681041
// MatchCheck
// This is match check module. This module checks if the two values summed together equal F in hex. 
// Last Update : 3/5/21
module MatchCheck(player1,player2,match,nonmatch);
  input [3:0] player1,player2;
  output match,nonmatch;
  reg match,nonmatch;

  always@(player1,player2)
  begin
    if((player1+player2)==4'b1111)
    begin
      match=1;
		nonmatch=0;
    end
    else
    begin
      match=0;
		nonmatch=1;
    end
  end 
endmodule
