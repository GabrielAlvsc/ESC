/* testbench para HalfAdder */
/* ordem de portas: s, c, a, b */
/* input a; input b; */
/* output s; output c; */

`include "HalfAdder.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_HalfAdder;
    reg a;
    reg b;
    wire s;
    wire c;

    HalfAdder mymodule(s, c, a, b);
    
    initial
    begin
        $dumpfile("tb_HalfAdder.vcd");
        $dumpvars(0, tb_HalfAdder);

        a = 1'b0; b = 1'b0; #1;
         `assert(s, 1'b0) `assert(c, 1'b0)
        a = 1'b0; b = 1'b1; #1;
         `assert(s, 1'b1) `assert(c, 1'b0)
        a = 1'b1; b = 1'b0; #1;
         `assert(s, 1'b1) `assert(c, 1'b0)
        a = 1'b1; b = 1'b1; #1;
         `assert(s, 1'b0) `assert(c, 1'b1)

    end
endmodule