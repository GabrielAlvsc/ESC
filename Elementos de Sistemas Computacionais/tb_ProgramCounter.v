/* testbench para ProgramCounter */
/* ordem de portas: out, in, load, inc, reset, clk */
/* input [15:0] in; */
/* input load, inc, reset, clk; */
/* output [15:0] out; */

`include "ProgramCounter.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_ProgramCounter;
    reg [15:0] in;
    reg load, inc, reset, clk;
    wire [15:0] out;

    ProgramCounter pc0(out, in, load, inc, reset, clk);

    always
    begin
        #1 clk = ~clk;
    end

    initial
    begin
        $dumpfile("tb_ProgramCounter.vcd");
        $dumpvars(0, tb_ProgramCounter);

        clk = 0;

        in = 16'b0000000000000000; load = 0; inc = 0; reset = 1; #3;
        `assert(out, 16'b0000000000000000); //A

        in = 16'b0000000000000000; load = 0; inc = 1; reset = 0; #2;
        `assert(out, 16'b0000000000000001); //B

        in = 16'b0000000000000000; load = 0; inc = 1; reset = 0; #2;
        `assert(out, 16'b0000000000000010); //C

        in = 16'b0000000000000000; load = 0; inc = 1; reset = 0; #2;
        `assert(out, 16'b0000000000000011); //D

        in = 16'b0000000011111111; load = 1; inc = 0; reset = 0; #2;
        `assert(out, 16'b0000000011111111);

        in = 16'b0000000000000000; load = 0; inc = 1; reset = 0; #2;
        `assert(out, 16'b0000000100000000);

        in = 16'b0000000000000000; load = 0; inc = 1; reset = 0; #2;
        `assert(out, 16'b0000000100000001);

        in = 16'b0000000000000000; load = 0; inc = 1; reset = 0; #2;
        `assert(out, 16'b0000000100000010);

        in = 16'b1111111111111111; load = 1; inc = 0; reset = 0; #2;
        `assert(out, 16'b1111111111111111);

        in = 16'b1111111111111111; load = 0; inc = 1; reset = 0; #2;
        `assert(out, 16'b0000000000000000);

        in = 16'b1111111111111111; load = 0; inc = 1; reset = 0; #2;
        `assert(out, 16'b0000000000000001);

        in = 16'b1111111111111111; load = 0; inc = 1; reset = 0; #2;
        `assert(out, 16'b0000000000000010);

        in = 16'b1111111111111111; load = 0; inc = 0; reset = 1; #2;
        `assert(out, 16'b0000000000000000);

        $finish;
    end

endmodule
