/* módulo ProgramCounter */

`ifndef _ProgramCounter_
`define _ProgramCounter_

`include "Increment16.v"
`include "Mux16.v"
`include "Register16.v"

module ProgramCounter(out, in, load, inc, reset, clk);
    input [15:0] in;
    input load, inc, reset, clk;
    output [15:0] out;
    wire [15:0] zeros;
    wire one;
    wire [15:0] b1, b2, b3, b4;

    assign one = 1'b1;
    assign zeros = 16'b0;

    Mux16 mux0(b2, out, b1, inc);
    Mux16 mux1(b3, b2, in, load);
    Mux16 mux2(b4, b3, zeros, reset);
    Increment16 inc0(b1, out);
    Register16 reg0(out, b4, one, clk);

endmodule

`endif
