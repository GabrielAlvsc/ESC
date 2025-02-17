/* testbench para DMux8Way */
/* ordem de portas: a, b, c, d, e, f, g, h, in, sel */
/* input in; input [2:0] sel; */
/* output a; output b; output c; output d; output e; output f; output g; output h; */

`include "DMux8Way.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_DMux8Way;
    reg in;
    reg [2:0] sel;
    wire a;
    wire b;
    wire c;
    wire d;
    wire e;
    wire f;
    wire g;
    wire h;

    DMux8Way mymodule(a, b, c, d, e, f, g, h, in, sel);
    
    initial
    begin
        $dumpfile("tb_DMux8Way.vcd");
        $dumpvars(0, tb_DMux8Way);

        in = 1'b0; sel = 3'b000; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b0; sel = 3'b001; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b0; sel = 3'b010; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b0; sel = 3'b011; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b0; sel = 3'b100; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b0; sel = 3'b101; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b0; sel = 3'b110; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b0; sel = 3'b111; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b1; sel = 3'b000; #1;
         `assert(a, 1'b1) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b1; sel = 3'b001; #1;
         `assert(a, 1'b0) `assert(b, 1'b1) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b1; sel = 3'b010; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b1) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b1; sel = 3'b011; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b1) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b1; sel = 3'b100; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b1) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b1; sel = 3'b101; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b1) `assert(g, 1'b0) `assert(h, 1'b0)
        in = 1'b1; sel = 3'b110; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b1) `assert(h, 1'b0)
        in = 1'b1; sel = 3'b111; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0) `assert(e, 1'b0) `assert(f, 1'b0) `assert(g, 1'b0) `assert(h, 1'b1)

    end
endmodule