
module lfsr(seed, clk, reset, shift_seed);
input logic [15:0]seed;
     input logic clk, reset;
     output logic [15:0]shift_seed;
     always @(posedge clk) begin
        if(reset) shift_seed[15:0] <= seed[15:0];
     else shift_seed <= {shift_seed[15:0], (shift_seed[3]^shift_seed[12]^shift_seed[14]^shift_seed[15])};
     
     end;
//inputs and outputs for a smaller implementation
//perhaps 8 or 16 bits

//your implementation of the LFSR.  Remember that this 
//implementation has memory so it should be done 
//with some form of a flip-flop based register

endmodule

module lfsr64(input logic [63:0] seed, input logic clk, reset, output logic [63:0] shift_seedAll);
//inputs and outputs for the full seed size (64 bits)
logic [15:0] seed1, seed2, seed3, seed4;

lfsr dut1(seed [15:0], clk, reset, seed1);
lfsr dut2(seed [31:16], clk, reset, seed2);
lfsr dut3(seed [47:32], clk, reset, seed3);
lfsr dut4(seed [63:48], clk, reset, seed4);
//inputs and outputs for the full seed size (64 bits)
assign shift_seedAll = {seed4, seed3, seed2, seed1};
//either build a 64 bit version using your smaller implementation above
//or use the same methods from the xilinx document to build a full
//64 bit version

endmodule