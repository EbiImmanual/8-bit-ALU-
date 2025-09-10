module alu(input[3:0] opcode,
	   input [7:0]a,b,
	   output reg [7:0] out,
	   output reg [3:0]flag);

reg[8:0] temp;

always @* begin
flag=0;
out=0;

case (opcode)
4'b0000: begin	//SUM
temp=a+b;	
flag[0]=temp[8];                              //CARRY FLAG 
out=temp[7:0];

flag[1]=~(^out);                             //PARITY FLAG

if(out==0)
flag[2]=1;	                             //ZERO FLAG
end

4'b0001: begin	//diffenence
temp=a-b;	
flag[0]=(a<b);	                     //carrry flag(borrow)
out=temp[7:0];

flag[1]=~(^out);                             //PARITY FLAG

if(out==0)
flag[2]=1;	                             //ZERO FLAG

if(a<b)		                             //sign flag(-ve)
flag[3]=1;
end

4'b0010: begin	//AND
out=a&b;	
flag[1]=~(^out);                            //PARITY FLAG

if(out==0)
flag[2]=1;	                            //ZERO FLAG
end

4'b0011: begin    //EX-OR
out=a^b;	
flag[1]=~(^out);                            //PARITY FLAG

if(out==0)
flag[2]=1;	                            //ZERO FLAG
end

4'b0100: begin	//OR
out=a|b;	
flag[1]=~(^out);                            //PARITY FLAG

if(out==0)
flag[2]=1;	                            //ZERO FLAG
end

4'b0101: begin	//NOT
out=~a;		
flag[1]=~(^out);                            //PARITY FLAG

if(out==0)
flag[2]=1;	                            //ZERO FLAG
end

4'b0110: begin	//RIGHT SHIFT
flag[0]=a[0];
out=a>>1;	
                               //CARRY FLAG

flag[1]=~(^out);                            //PARITY FLAG
end

4'b0111: begin	//left SHIFT
flag[0]=a[7];                              //CARRY FLAG
out=a<<1;	


flag[1]=~(^out);                            //PARITY FLAG	
end

4'b1000: begin	//INCREAMENT
temp=a+1;
flag[0]=temp[8];                            //carry flag
out=temp[7:0];

flag[1]=~(^out);                            //parity flag
if(out==0)
flag[2]=1;	                            //ZERO FLAG
end

4'b1001: begin	//DECREAMENT
temp=a-1;
flag[0]=(a<1);                            //carry flag
out=temp[7:0];

flag[1]=~(^out);                            //parity flag
if(out==0)
flag[2]=1;	                            //ZERO FLAG

if(a<1)		                             //sign flag(-ve)
flag[3]=1;
end

4'b1010: begin	//NAND
out=~(a&b);	
flag[1]=~(^out);                            //PARITY FLAG

if(out==0)
flag[2]=1;	                            //ZERO FLAG
end

4'b1011: begin	//NOR
out=~(a|b);	
flag[1]=~(^out);                            //PARITY FLAG

if(out==0)
flag[2]=1;	                            //ZERO FLAG
end

4'b1100: begin    //EX-NOR
out=~(a^b);	
flag[1]=~(^out);                            //PARITY FLAG

if(out==0)
flag[2]=1;	                            //ZERO FLAG
end

4'b1101: begin	  //COMPARE
temp=a-b;	
flag[0]=(a<b);	                     //carrry flag(borrow)

flag[1]=~(^temp[7:0]);                             //PARITY FLAG
if(temp[7:0]==0)
flag[2]=1;	                             //ZERO FLAG

if(a<b)		                             //sign flag(-ve)
flag[3]=1;
out=8'b0;
end

4'b1110: begin	//2'sCompliment
temp=(~a)+8'b00000001;                                  //carry flag
flag[0]=temp[8];                            
out=temp[7:0];

flag[1]=~(^out);                             //PARITY FLAG

if(out==0)
flag[2]=1;	                             //ZERO FLAG
end
4'b1111: begin	  //rotate 1 right 
out={a[0],a[7:1]};
flag[0]=a[0];                                 //carry flag
flag[1]=~(^out);                             //PARITY FLAG
if(out==0)
flag[2]=1;	                             //ZERO FLAG
end
default:out=8'b00000000;//DEFAULT
endcase
end
endmodule
 


