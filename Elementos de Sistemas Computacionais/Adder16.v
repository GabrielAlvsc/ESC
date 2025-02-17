/* módulo Adder16 */

`ifndef _Adder16_
`define _Adder16_

`include "HalfAdder.v"
`include "FullAdder.v"


module Adder16(s, ovfl, a, b);
    // Declarando as entradas/saidas
    input [15:0] a, b;
    output [15:0] s;
    output ovfl;
    wire [14:0] c;

    // Conexoes internas do modulo
    HalfAdder HalfAdder0(s[0], c[0], a[0], b[0]);
    FullAdder FullAdder0(s[1], c[1], a[1], b[1], c[0]);
    FullAdder FullAdder1(s[2], c[2], a[2], b[2], c[1]);
    FullAdder FullAdder2(s[3], c[3], a[3], b[3], c[2]);
    FullAdder FullAdder3(s[4], c[4], a[4], b[4], c[3]);
    FullAdder FullAdder4(s[5], c[5], a[5], b[5], c[4]);
    FullAdder FullAdder5(s[6], c[6], a[6], b[6], c[5]);
    FullAdder FullAdder6(s[7], c[7], a[7], b[7], c[6]);
    FullAdder FullAdder7(s[8], c[8], a[8], b[8], c[7]);
    FullAdder FullAdder8(s[9], c[9], a[9], b[9], c[8]);
    FullAdder FullAdder9(s[10], c[10], a[10], b[10], c[9]);
    FullAdder FullAdder10(s[11], c[11], a[11], b[11], c[10]);
    FullAdder FullAdder11(s[12], c[12], a[12], b[12], c[11]);
    FullAdder FullAdder12(s[13], c[13], a[13], b[13], c[12]);
    FullAdder FullAdder13(s[14], c[14], a[14], b[14], c[13]);
    FullAdder FullAdder14(s[15], ovfl, a[15], b[15], c[14]);

endmodule

`endif