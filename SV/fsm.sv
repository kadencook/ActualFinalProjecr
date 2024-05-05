module FSM (
    input logic clk,
    input logic reset,
    input logic start,
    input logic lfsr_begin,
    output logic lfsr_reset,
    output logic rst,
    output logic en
);

    typedef enum logic [1:0] {S0, S1, S2} StateType;
    StateType state, nextState;

    // State Register
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= nextState;
    end

    // Next State Logic
    always_comb begin
        case (state)
            S0: begin
                lfsr_reset<=1;
                rst<=1;
                en<=0;
                if (~start && lfsr_begin)
                    nextState<=S2;
                else if (start)
                    nextState<=S1;
                else
                    nextState<=S0;
            end
            S1: begin
                lfsr_reset<=0;
                rst<=0;
                en<=1;
                if (lfsr_begin)
                    nextState<=S2;
                else
                    nextState<=S1;
            end
            S2: begin
                lfsr_reset<=0;
                rst<=1;
                en<=0;
                if (start)
                    nextState<=S1;
                else
                    nextState<=S2;
            end
            default: begin
                lfsr_reset<=1;
                rst<=1;
                en<=0;
                nextState<=S0;
            end
        endcase
    end

endmodule

