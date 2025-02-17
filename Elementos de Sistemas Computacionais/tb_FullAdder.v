/* testbench para FullAdder */
/* ordem de portas: s, cout, a, b, cin */
/* input a; input b; input cin; */
/* output s; output cout; */

`include "FullAdder.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_FullAdder;
    reg a;
    reg b;
    reg cin;
    wire s;
    wire cout;

    FullAdder mymodule(s, cout, a, b, cin);
    
    initial
    begin
        $dumpfile("tb_FullAdder.vcd");
        $dumpvars(0, tb_FullAdder);

        a = 1'b0; b = 1'b0; cin = 1'b0; #1;
         `assert(s, 1'b0) `assert(cout, 1'b0)
        a = 1'b0; b = 1'b0; cin = 1'b1; #1;
         `assert(s, 1'b1) `assert(cout, 1'b0)
        a = 1'b0; b = 1'b1; cin = 1'b0; #1;
         `assert(s, 1'b1) `assert(cout, 1'b0)
        a = 1'b0; b = 1'b1; cin = 1'b1; #1;
         `assert(s, 1'b0) `assert(cout, 1'b1)
        a = 1'b1; b = 1'b0; cin = 1'b0; #1;
         `assert(s, 1'b1) `assert(cout, 1'b0)
        a = 1'b1; b = 1'b0; cin = 1'b1; #1;
         `assert(s, 1'b0) `assert(cout, 1'b1)
        a = 1'b1; b = 1'b1; cin = 1'b0; #1;
         `assert(s, 1'b0) `assert(cout, 1'b1)
        a = 1'b1; b = 1'b1; cin = 1'b1; #1;
         `assert(s, 1'b1) `assert(cout, 1'b1)

    end
endmodule