`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2020 13:43:29
// Design Name: 
// Module Name: hex_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hex_test
(
    input [9:0] sw,
    output reg [6:0] hex,
    output [7:0] AN,
    output [9:0] led
    
);
wire [3:0] dc1;
wire [3:0] dc2;
wire [1:0] f;


reg [3:0] dc1_out;
reg [3:0] dc2_out;
reg [3:0] dc_dec;
reg [3:0] func_out;

assign AN = 8'b1111_1110;
assign led = sw;
assign f = sw[9:8];
assign dc1 = sw[3:0];
assign dc2 = sw[7:4];

/*always @(*) begin
   case(dc_dec)
   4'b0000 : hex = 7'b100_0000;
   4'b0001 : hex = 7'b111_1001;
   4'b0010 : hex = 7'b010_0100;
   4'b0011 : hex = 7'b011_0000;
   4'b0100 : hex = 7'b001_1001;
   4'b0101 : hex = 7'b001_0010;
   4'b0110 : hex = 7'b000_0010;
   4'b0111 : hex = 7'b111_1000;//7
   4'b1000 : hex = 7'b000_0000;
   4'b1001 : hex = 7'b001_0000;
   4'b1010 : hex = 7'b100_0000;//10
   4'b1011 : hex = 7'b000_1000;
   4'b1100 : hex = 7'b000_0011;
   4'b1101 : hex = 7'b010_0001;
   4'b1110 : hex = 7'b000_0110;
   4'b1111 : hex = 7'b000_0110;
  
   endcase
end*/


always @(*) begin
//dc1
   case(dc1)
   4'b0000 : hex = 7'b010_0001;
   4'b0001 : hex = 7'b000_0110;
   4'b0010 : hex = 7'b000_0110;
   4'b0011 : hex = 7'b100_0000;
   4'b0100 : hex = 7'b111_1001;
   4'b0101 : hex = 7'b010_0100;
   4'b0110 : hex = 7'b011_0000;
   4'b0111 : hex = 7'b001_1001;
   4'b1000 : hex = 7'b001_0010;
   4'b1001 : hex = 7'b000_0010;
   4'b1010 : hex = 7'b111_1000;
   4'b1011 : hex = 7'b000_0000;
   4'b1100 : hex = 7'b001_0000;
   4'b1101 : hex = 7'b100_0000;
   4'b1110 : hex = 7'b000_1000;
   4'b1111 : hex = 7'b000_0011;
  
   endcase
end


 always @(*) begin
    case(f)
     2'b00 : dc_dec = dc1; 
     2'b01 : dc_dec = dc2;
     2'b10 : dc_dec = f;   
     2'b11 : dc_dec = sw[3:0];
     endcase
 end



   

always @(*) begin
//dc2
   dc2_out = dc2^ 4'b1000;
end
always @(*) begin
func_out = ((~sw[0]) & sw[1])|sw[2]|sw[3];
end
endmodule
