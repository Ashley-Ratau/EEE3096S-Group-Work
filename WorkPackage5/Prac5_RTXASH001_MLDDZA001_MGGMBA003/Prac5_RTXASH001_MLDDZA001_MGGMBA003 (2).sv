// Code your testbench here
// or browse Examples
//Define the ALU testbench module
module ALU_tb();    
//inputs
reg clk;
  reg [7:0] A,B;
  reg[3:0] opcode;
// output
  wire[7:0] out; 

//Instantiate the design under test
ALU dut(
    .clk(clk),
    .A(A),
    .B(B),
  .opcode(opcode),
  .out(out));

initial begin //Initial means this only happens once
  $display("A         B         opcode   out");
  $monitor("%b  %b  %b     %b",A,B,opcode, out);
  	$dumpfile("dump.vcd");
  	$dumpvars;
    clk = 1'b1;
    A = 8'b00000100;
    B = 8'b00000001;
    opcode = 4'b0000;
    #5  //Note: This is not synthesizable and only available in simulation
        clk=!clk;
    #5
        clk=!clk;
        opcode = 4'b0110;
  	
    #5
        clk=!clk;
    #5
        clk=!clk;
        opcode = 4'b1000;
  	
    #5
        clk=!clk;
    #5
        clk=!clk;
        opcode = 4'b1111;
  	
    #5
        clk = !clk;
    end
endmodule 