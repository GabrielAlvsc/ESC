/* testbench para DLatch */
/* ordem de portas: q, d, clk */
/* input d, clk; */
/* output q; */

`include "DLatch.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_DLatch;
    reg d, clk;
    wire q;

    DLatch dlatch0(q, d, clk);
    
    always
    begin
        #1 clk = ~clk;
    end
    
    initial
    begin
        $dumpfile("tb_DLatch.vcd");
        $dumpvars(0, tb_DLatch);

        clk = 0;

        d = 0; #3;
        `assert(q, 1'b0)

        d = 1; #3;
        `assert(q, 1'b1)

        d = 1; #3;
        `assert(q, 1'b1)

        d = 0; #3;
        `assert(q, 1'b0)

        d = 0; #3;
        `assert(q, 1'b0)

        $finish;
    end

endmodule
