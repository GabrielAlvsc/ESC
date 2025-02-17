/* testbench para Or8Way */
/* ordem de portas: out, a, b, c, d, e, f, g, h */
/* input a; input b; input c; input d; input e; input f; input g; input h; */
/* output out; */

`include "Or8Way.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_Or8Way;
    reg a;
    reg b;
    reg c;
    reg d;
    reg e;
    reg f;
    reg g;
    reg h;
    wire out;

    Or8Way mymodule(out, a, b, c, d, e, f, g, h);
    
    initial
    begin
        $dumpfile("tb_Or8Way.vcd");
        $dumpvars(0, tb_Or8Way);

        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b1; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b1; g = 1'b0; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b1; f = 1'b1; g = 1'b0; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b0; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b1; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; e = 1'b0; f = 1'b1; g = 1'b1; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; e = 1'b1; f = 1'b0; g = 1'b0; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; e = 1'b0; f = 1'b1; g = 1'b0; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0; e = 1'b1; f = 1'b1; g = 1'b0; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b0; f = 1'b1; g = 1'b0; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b0; g = 1'b0; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b0; g = 1'b1; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b0; f = 1'b0; g = 1'b1; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b0; e = 1'b1; f = 1'b0; g = 1'b1; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; e = 1'b0; f = 1'b1; g = 1'b0; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; e = 1'b0; f = 1'b1; g = 1'b0; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0; e = 1'b1; f = 1'b0; g = 1'b0; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1; e = 1'b1; f = 1'b0; g = 1'b0; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b0; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b0; e = 1'b0; f = 1'b1; g = 1'b1; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b0; e = 1'b1; f = 1'b0; g = 1'b1; h = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b0; g = 1'b1; h = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b1; #1;
         `assert(out, 1'b1)

    end
endmodule