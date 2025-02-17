/* testbench para Mux */
/* ordem de portas: out, a, b, sel */
/* input a; input b; input sel; */
/* output out; */

`include "Mux.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_Mux;
    reg a;
    reg b;
    reg sel;
    wire out;

    Mux mymodule(out, a, b, sel);
    
    initial
    begin
        $dumpfile("tb_Mux.vcd");
        $dumpvars(0, tb_Mux);

        a = 1'b0; b = 1'b0; sel = 1'b0; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b0; sel = 1'b1; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b1; sel = 1'b0; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b1; sel = 1'b1; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b0; sel = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b0; sel = 1'b1; #1;
         `assert(out, 1'b0)
        a = 1'b1; b = 1'b1; sel = 1'b0; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; sel = 1'b1; #1;
         `assert(out, 1'b1)

    end
endmodule