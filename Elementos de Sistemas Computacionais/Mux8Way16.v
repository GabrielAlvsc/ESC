/* módulo Mux8Way16 */

`ifndef _Mux8Way16_
`define _Mux8Way16_

`include "Mux4Way16.v"
`include "Mux16.v"

module Mux8Way16(out, a, b, c, d, e, f, g, h, sel);
    input [15:0] a, b, c, d, e, f, g, h;
    input [2:0] sel;
    output [15:0] out;
    wire [15:0] w0, w1;

    // 

    Mux4Way16 mux816_0(w0, a, b, c, d, sel[1:0]);
    Mux4Way16 mux816_1(w1, e, f, g, h, sel[1:0]);
    Mux16 mux816_2(out, w0, w1, sel[2]);



endmodule

`endif