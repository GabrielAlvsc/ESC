/* testbench para DMux */
/* ordem de portas: a, b, in, sel */
/* input in; input sel; */
/* output a; output b; */

`include "DMux.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_DMux;
    reg in;
    reg sel;
    wire a;
    wire b;

    DMux mymodule(a, b, in, sel);
    
    initial
    begin
        $dumpfile("tb_DMux.vcd");
        $dumpvars(0, tb_DMux);

        in = 1'b0; sel = 1'b0; #1;
         `assert(a, 1'b0) `assert(b, 1'b0)
        in = 1'b0; sel = 1'b1; #1;
         `assert(a, 1'b0) `assert(b, 1'b0)
        in = 1'b1; sel = 1'b0; #1;
         `assert(a, 1'b1) `assert(b, 1'b0)
        in = 1'b1; sel = 1'b1; #1;
         `assert(a, 1'b0) `assert(b, 1'b1)

    end
endmodule