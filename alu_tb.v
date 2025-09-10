
module alu_tb;
reg [7:0] a,b;
reg [3:0] opcode;
wire [7:0] out;
wire [3:0]flag;

alu a1(opcode,a,b,out,flag);

initial begin
$monitor("A=      %b   OPCODE=%b FLAG=%b \nB=      %b \nOUTPUT= %b",a,opcode,flag,b,out);
a=8'b11001010; 
b=8'b01011110;

a = 8'h05; b = 8'h03; opcode = 4'b0000; #10; // ADD
    a = 8'h05; b = 8'h07; opcode = 4'b0001; #10; // SUB
    a = 8'hFF; b = 8'h01; opcode = 4'b0000; #10; // ADD with carry
    a = 8'h80; b = 8'h80; opcode = 4'b0001; #10; // SUB with negative
    a = 8'hF0; b = 8'h0F; opcode = 4'b0010; #10; // AND
    a = 8'h55; b = 8'hAA; opcode = 4'b0011; #10; // XOR
    a = 8'h01; b = 8'h00; opcode = 4'b1111; #10; // ROTATE RIGHT
 repeat (16) begin
      opcode = $random % 16;
      a = $random;
      b = $random;
      #10;
end
$finish;
end
endmodule