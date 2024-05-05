module gameOfLife (input logic clk, reset, start, lfsr_begin, [63:0]seed, output logic [63:0]grid_evolve);

logic [63:0] grid, lfsr_out; 
logic lfsr_reset, en; 

    lfsr64 dut3 (seed, clk, reset, lfsr_out);
    flopenr #(64)dut2 (clk, reset, en, grid_evolve, lfsr_out, grid);
    datapath dut( grid, grid_evolve );
     FSM dut4 (clk, reset, start, lfsr_begin, lfsr_reset, rst, en);

    

   

endmodule