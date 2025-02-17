/* módulo Adder16 */

`ifndef _Adder16_
`define _Adder16_

`include "FullAdder.v"
`include "HalfAdder.v"


module Adder16(s, ovfl, a, b);
    input [15:0] a, b;
    output [15:0] s;
    output ovfl;
    wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15;

    // 

    HalfAdder adder0(s[0], w0, a[0], b[0]);
    FullAdder adder1(s[1], w1, a[1], b[1], w0);
    FullAdder adder2(s[2], w2, a[2], b[2], w1);
    FullAdder adder3(s[3], w3, a[3], b[3], w2);
    FullAdder adder4(s[4], w4, a[4], b[4], w3);
    FullAdder adder5(s[5], w5, a[5], b[5], w4);
    FullAdder adder6(s[6], w6, a[6], b[6], w5);
    FullAdder adder7(s[7], w7, a[7], b[7], w6);
    FullAdder adder8(s[8], w8, a[8], b[8], w7);
    FullAdder adder9(s[9], w9, a[9], b[9], w8);
    FullAdder adder10(s[10], w10, a[10], b[10], w9);
    FullAdder adder11(s[11], w11, a[1], b[11], w10);
    FullAdder adder12(s[12], w12, a[12], b[12], w11);
    FullAdder adder13(s[13], w13, a[13], b[13], w12);
    FullAdder adder14(s[14], w14, a[14], b[14], w13);
    FullAdder adder15(s[15], ovfl, a[15], b[15], w14);


endmodule

`endif