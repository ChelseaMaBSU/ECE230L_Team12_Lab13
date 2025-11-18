`timescale 1ns / 1ps

module Full_Adder_1bit(
    input A, B, Cin,
    output Sum, Cout
    );
    
    assign Sum = A ^ B ^ Cin;
    
    assign Cout = (A & B) | (Cin & (A ^ B));
    
endmodule
