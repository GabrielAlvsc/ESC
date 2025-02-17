/* testbench para Bit */
/* ordem de portas: out, in, load, clk */
/* input in, load, clk; */
/* output out; */

`include "Bit.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_Bit;
    reg in, load, clk;
    wire out;

    Bit bit0(out, in, load, clk);
    
    always
    begin
        #1 clk = ~clk;
    end
    
    initial
    begin
        $dumpfile("tb_Bit.vcd");
        $dumpvars(0, tb_Bit);

        clk = 0;

        in = 0; load = 1; #3;
        `assert(out, 1'b0)

        in = 0; load = 0; #3;
        `assert(out, 1'b0)
    
        in = 0; load = 1; #3;
        `assert(out, 1'b0)

        in = 1; load = 0; #3;
        `assert(out, 1'b0)

        in = 1; load = 1; #3;
        `assert(out, 1'b1)

        in = 0; load = 0; #3;
        `assert(out, 1'b1)

        $finish;
    end

endmodule
