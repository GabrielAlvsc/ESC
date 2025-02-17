/* módulo Mux4Way16 */

`ifndef _Mux4Way16_
`define _Mux4Way16_

`include "Mux16.v"

module Mux4Way16(out, a, b, c, d, sel);
    input [15:0] a, b, c, d;
    input [1:0] sel;
    output [15:0] out;
    wire [15:0] w0, w1;

    // 

    Mux16 mux16_0(w0, a, b, sel[0]);
    Mux16 mux16_1(w1, c, d, sel[0]);
    Mux16 mux16_2(out, w0, w1, sel[1]);

endmodule

`endif