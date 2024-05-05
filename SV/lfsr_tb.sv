`timescale 1ns/1ps
module stimulus ();

   //logic variables to route input and output to DUT
  logic [63:0] seed
  logic [63:0] shift_seed;
  logic clk, reset;
   //create file handles to write results to a file
  integer handle3;
  integer desc3;
   // instantiate device under test (small LFSR)
  lfsr dut(seed, clk, reset, shift_seed);
   //set up a clock signal
   always     
     begin
	clk = 1; #1; clk = 0; #1;
     end
   
   initial
     begin
	//set up output file
  handle3 = $fopen("lsfr.out");
  desc3 = handle3;
     end
    initial
     begin
     #0 reset = 1'b1;
     #0 seed = 64'h0100;
     #20 reset 1'b0;
     end

   always @(posedge clk)
     begin
		$fdisplay(desc3, "%h || %h || %b" , seed, shift_seed, (seed == shift_seed));
     end

   // check results on falling edge of clk
   
endmodule // tb

