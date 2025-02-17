/* testbench para Mux4Way */
/* ordem de portas: out, a, b, c, d, sel */
/* input a; input b; input c; input d; input [1:0] sel; */
/* output out; */

`include "Mux4Way.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_Mux4Way;
    reg a;
    reg b;
    reg c;
    reg d;
    reg [1:0] sel;
    wire out;

    Mux4Way mymodule(out, a, b, c, d, sel);
    
    initial
    begin
        $dumpfile("tb_Mux4Way.vcd");
        $dumpvars(0, tb_Mux4Way);

        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; sel = 2'b00; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; sel = 2'b00; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; sel = 2'b00; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; sel = 2'b00; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; sel = 2'b01; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; sel = 2'b10; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; sel = 2'b00; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; sel = 2'b01; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; sel = 2'b11; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; sel = 2'b00; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; sel = 2'b00; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; sel = 2'b00; #1;
         `assert(out, 1'b0)
        a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0; sel = 2'b10; #1;
         `assert(out, 1'b1)
        a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0; sel = 2'b11; #1;
         `assert(out, 1'b0)
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; sel = 2'b01; #1;
         `assert(out, 1'b0)
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; sel = 2'b01; #1;
         `assert(out, 1'b0)
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; sel = 2'b01; #1;
         `assert(out, 1'b0)
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; sel = 2'b10; #1;
         `assert(out, 1'b0)
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; sel = 2'b01; #1;
         `assert(out, 1'b0)
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; sel = 2'b10; #1;
         `assert(out, 1'b0)
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; sel = 2'b11; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b0; sel = 2'b00; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b0; sel = 2'b10; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0; sel = 2'b10; #1;
         `assert(out, 1'b0)
        a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0; sel = 2'b10; #1;
         `assert(out, 1'b0)
        a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; sel = 2'b01; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; sel = 2'b10; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; sel = 2'b10; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; sel = 2'b10; #1;
         `assert(out, 1'b1)
        a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; sel = 2'b11; #1;
         `assert(out, 1'b1)

    end
endmodule