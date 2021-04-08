// ECE 5440
// Alec Medina, PSID: 1681041
// RandomNumberGenerator
// This module is used to create a random number 
// Last Update : 3/23/21
module RandomNumberGenerator(request, out, clk, rst);
   input request, clk, rst;
   output [3:0] out;
   wire count;

   assign count =~ request;
   Counter15 countto15(count, out, clk, rst);


endmodule

module Counter15(count, count_out, clk, rst);
   input count, clk, rst;
   output [3:0] count_out;
   reg [3:0] count_out;

   always@(posedge clk) begin
      if (rst == 1'b0) begin
         count_out <= 0;
         end
      else begin
         if (count == 1'b1) begin
            count_out <= count_out + 1;
            end
         end
      end
endmodule 