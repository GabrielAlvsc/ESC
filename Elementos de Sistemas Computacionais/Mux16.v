/* módulo Mux16 */

`ifndef _Mux16_
`define _Mux16_

`include "Mux.v"

module Mux16(out, a, b, sel);
    input [15:0] a, b;
    input sel;
    output [15:0] out;

    Mux mux16_0(out[0], a[0], b[0], sel);
    Mux mux16_1(out[1], a[1], b[1], sel);
    Mux mux16_2(out[2], a[2], b[2], sel);
    Mux mux16_3(out[3], a[3], b[3], sel);
    Mux mux16_4(out[4], a[4], b[4], sel);
    Mux mux16_5(out[5], a[5], b[5], sel);
    Mux mux16_6(out[6], a[6], b[6], sel);
    Mux mux16_7(out[7], a[7], b[7], sel);
    Mux mux16_8(out[8], a[8], b[8], sel);
    Mux mux16_9(out[9], a[9], b[9], sel);
    Mux mux16_10(out[10], a[10], b[10], sel);
    Mux mux16_11(out[11], a[11], b[11], sel);
    Mux mux16_12(out[12], a[12], b[12], sel);
    Mux mux16_13(out[13], a[13], b[13], sel);
    Mux mux16_14(out[14], a[14], b[14], sel);
    Mux mux16_15(out[15], a[15], b[15], sel);





    // Descrição de conexões internas do módulo

endmodule

`endif