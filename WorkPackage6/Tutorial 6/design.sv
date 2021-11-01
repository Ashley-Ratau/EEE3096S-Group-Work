// Code your design here
//Define the module
module ALU(
    input clk, //clock of the ALU
  input [7:0] A,B, //input to ALU
  input [3:0] opcode,//for control of operations
  output reg [7:0] out//outpu of the ALU
);

  reg [7:0] acc;

always@(posedge clk) //Triggered on rising edge clock
    begin
      case(opcode)
            4'b0000:  //Manually enumerate ADD = 0000
                acc = A + B;

            4'b0001:  //Manually enumerate SUB = 0001
                acc = A - B;

            4'b0010:  //Manually enumerate MUL = 0010
                acc = B * A;

            4'b0011:  //Manually enumerate DIV = 0011
                acc = A / B;
        
        	4'b0100: //Manually enumarate ADDA = 0100
              	acc= acc + A;
        
        	/*4'b0100: //Manually enumarate ADDA = 0100
              	acc= acc + A;*/
        
        	4'b0101: //Manually enumarate MULA = 0101
              	acc= acc * A;
        
        	4'b0110: //Manually enumarate MAC = 0110
              	acc= acc + (A * B);
        
        	4'b0111: //Manually enumarate ROL = 0111
              	acc= A << 1;
        
        	4'b1000: //Manually enumarate ROR = 1000
              	acc= A >> 1;
        
        	4'b1001: //Manually enumarate AND = 1001
              	acc= A & B;
        
        	4'b1010: //Manually enumarate OR = 1010
              	acc= A | B;
        
        	4'b1011: //Manually enumarate XOR = 1011
              	acc= A ^ B;
        
        	4'b1100: //Manually enumarate NAND = 1100
              	acc= A ~& B;
        
        	4'b1101: //Manually enumarate ETH = 1101
              begin
                if(A == B)
                  acc= 8'hFF;
                else
                  acc=0;
              end
        
        	4'b1110: //Manually enumarate GTH = 1110
              begin
                if(A>B)
                  acc=8'hFF;
                else
                  acc=0;
              end
        
        	4'b1111: //Manually enumarate LTH = 1111
              begin
                if (A<B)
                  acc=8'hFF;
                else
                  acc= 0;
              end
            default: acc = A;
        endcase

        out = acc;
    end    
endmodule 