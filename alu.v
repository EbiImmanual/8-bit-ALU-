module alu(input[2:0] opcode,
	   input [7:0]a,b,
	   output reg [7:0] out,
	   output reg [3:0]flag);

reg[8:0] temp;

always @* begin
flag=0;
out=0;

case (opcode)
3'b000: begin	//SUM
temp=a+b;	
flag[0]=temp[8];                              //CARRY FLAG 
out=temp[7:0];

flag[1]=~(^out);                             //PARITY FLAG

if(out==0)
flag[2]=1;	                             //ZERO FLAG
end

3'b001: begin	//diffenence
temp=a-b;	
flag[0]=temp[8];	                     //carrry flag(borrow)
out=temp[7:0];

flag[1]=~(^out);                             //PARITY FLAG

if(out==0)
flag[2]=1;	                             //ZERO FLAG

if(a<b)		                             //sign flag(-ve)
flag[3]=1;
end

3'b010: begin	//AND
out=a&b;	
flag[1]=~(^out);                            //PARITY FLAG

if(out==0)
flag[2]=1;	                            //ZERO FLAG
end

3'b011: begin    //EX-OR
out=a^b;	
flag[1]=~(^out);                            //PARITY FLAG

if(out==0)
flag[2]=1;	                            //ZERO FLAG
end

3'b100: begin	//OR
out=a|b;	
flag[1]=~(^out);                            //PARITY FLAG

if(out==0)
flag[2]=1;	                            //ZERO FLAG
end

3'b101: begin	//NOT
out=~a;		
flag[1]=~(^out);                            //PARITY FLAG

if(out==0)
flag[2]=1;	                            //ZERO FLAG
end

3'b110: begin	//RIGHT SHIFT
out=a>>1;	
flag[0]=a[1];                               //CARRY FLAG

flag[1]=~(^out);                            //PARITY FLAG
end
3'b111: begin	//left SHIFT
out=a<<1;	
flag[0]=a[7];                               //CARRY FLAG

flag[1]=~(^out);                            //PARITY FLAG	
end
default:out=8'b00000000;//DEFAULT
endcase
end
endmodule
 


