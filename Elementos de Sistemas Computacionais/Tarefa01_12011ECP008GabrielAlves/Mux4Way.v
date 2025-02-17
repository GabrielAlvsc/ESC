/* módulo Mux4Way */

`ifndef _Mux4Way_
`define _Mux4Way_

`include "Mux.v"

module Mux4Way(out, a, b, c, d, sel);
    input a, b, c, d;
    input [1:0] sel;
    output out;
    wire w0, w1;

    //

    Mux mux0(w0, a, b, sel[1]);
    Mux mux1(w1, c, d, sel[1]);
    Mux mux2(out, w0, w1, sel[0]);



endmodule

`endif