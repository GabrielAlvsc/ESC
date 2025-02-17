/* módulo Mux16 */

`ifndef _Mux16_
`define _Mux16_

`include "Not16.v"

module Mux16(out, a, b, sel);
    input [15:0] a, b;
    input sel;
    output [15:0] out;
    wire [15:0] w1, w2;
    wire w3;

    nand nand0_0(w1[0], a[0], sel);
    nand nand0_1(w1[1], a[1], sel);
    nand nand0_2(w1[2], a[2], sel);
    nand nand0_3(w1[3], a[3], sel);
    nand nand0_4(w1[4], a[4], sel);
    nand nand0_5(w1[5], a[5], sel);
    nand nand0_6(w1[6], a[6], sel);
    nand nand0_7(w1[7], a[7], sel);
    nand nand0_8(w1[8], a[8], sel);
    nand nand0_9(w1[9], a[9], sel);
    nand nand0_10(w1[10], a[10], sel);
    nand nand0_11(w1[11], a[11], sel);
    nand nand0_12(w1[12], a[12], sel);
    nand nand0_13(w1[13], a[13], sel);
    nand nand0_14(w1[14], a[14], sel);
    nand nand0_15(w1[15], a[15], sel);

    //

    nand nand1_0(w2[0], w3, b[0]);
    nand nand1_1(w2[1], w3, b[1]);
    nand nand1_2(w2[2], w3, b[2]);
    nand nand1_3(w2[3], w3, b[3]);
    nand nand1_4(w2[4], w3, b[4]);
    nand nand1_5(w2[5], w3, b[5]);
    nand nand1_6(w2[6], w3, b[6]);
    nand nand1_7(w2[7], w3, b[7]);
    nand nand1_8(w2[8], w3, b[8]);
    nand nand1_9(w2[9], w3, b[9]);
    nand nand1_10(w2[10], w3, b[10]);
    nand nand1_11(w2[11], w3, b[11]);
    nand nand1_12(w2[12], w3, b[12]);
    nand nand1_13(w2[13], w3, b[13]);
    nand nand1_14(w2[14], w3, b[14]);
    nand nand1_15(w2[15], w3, b[15]);


    //

    nand nand2_0(out[0], w1[0], w2[0]);
    nand nand2_1(out[1], w1[1], w2[1]);
    nand nand2_2(out[2], w1[2], w2[2]);
    nand nand2_3(out[3], w1[3], w2[3]);
    nand nand2_4(out[4], w1[4], w2[4]);
    nand nand2_5(out[5], w1[5], w2[5]);
    nand nand2_6(out[6], w1[6], w2[6]);
    nand nand2_7(out[7], w1[7], w2[7]);
    nand nand2_8(out[8], w1[8], w2[8]);
    nand nand2_9(out[9], w1[9], w2[9]);
    nand nand2_10(out[10], w1[10], w2[10]);
    nand nand2_11(out[11], w1[11], w2[11]);
    nand nand2_12(out[12], w1[12], w2[12]);
    nand nand2_13(out[13], w1[13], w2[13]);
    nand nand2_14(out[14], w1[14], w2[14]);
    nand nand2_15(out[15], w1[15], w2[15]);


    not not0(w3, sel);


    // Descrição de conexões internas do módulo

endmodule

`endif