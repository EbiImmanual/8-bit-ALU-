
module alu_tb;
reg [7:0] a,b;
reg [2:0] opcode;
wire [7:0] out;
wire [3:0]flag;

alu a1(opcode,a,b,out,flag);

initial begin
$monitor("A=%b B=%b OPCODE=%b OUTPUT=%b",a,b,opcode,out);
a=8'b11001010; 
b=8'b01011110;

opcode=000;#100
opcode=001;#100
opcode=010;#100
opcode=011;#100
opcode=100;#100
opcode=101;#100
opcode=110;#100
opcode=111;#100
$finish;
end
endmodule