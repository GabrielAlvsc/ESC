/* testbench para DMux4Way */
/* ordem de portas: a, b, c, d, in, sel */
/* input in; input [1:0] sel; */
/* output a; output b; output c; output d; */

`include "DMux4Way.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_DMux4Way;
    reg in;
    reg [1:0] sel;
    wire a;
    wire b;
    wire c;
    wire d;

    DMux4Way mymodule(a, b, c, d, in, sel);
    
    initial
    begin
        $dumpfile("tb_DMux4Way.vcd");
        $dumpvars(0, tb_DMux4Way);

        in = 1'b0; sel = 2'b00; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0)
        in = 1'b0; sel = 2'b01; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0)
        in = 1'b0; sel = 2'b10; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0)
        in = 1'b0; sel = 2'b11; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0)
        in = 1'b1; sel = 2'b00; #1;
         `assert(a, 1'b1) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b0)
        in = 1'b1; sel = 2'b01; #1;
         `assert(a, 1'b0) `assert(b, 1'b1) `assert(c, 1'b0) `assert(d, 1'b0)
        in = 1'b1; sel = 2'b10; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b1) `assert(d, 1'b0)
        in = 1'b1; sel = 2'b11; #1;
         `assert(a, 1'b0) `assert(b, 1'b0) `assert(c, 1'b0) `assert(d, 1'b1)

    end
endmodule