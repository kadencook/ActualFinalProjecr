`timescale  1ns / 1ps

module tb ();

logic clk;


logic [63:0] shift_seed;
logic start;
logic flopreset;
logic [63:0] gridOut;


Game dut (clk, flopreset, start, shift_seed, gridOut);

initial 
    begin
    clk =1'b1;
    forever #10 clk = ~clk;
    end

initial
    begin

    #0 flopreset = 1'b0;
    #0 start = 1'b1; 
    #0 shift_seed = 64'h0000700000000000; 

    #50 start = 1'b0;


    end
endmodule