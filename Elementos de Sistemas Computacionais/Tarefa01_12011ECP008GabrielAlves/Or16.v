/* módulo Or16 */

`ifndef _Or16_
`define _Or16_

module Or16(out, a, b);
    input [15:0] a, b;
    output [15:0] out ;

    or or0(out[0], a[0], b[0]);
    or or1(out[1], a[1], b[1]);
    or or2(out[2], a[2], b[2]);
    or or3(out[3], a[3], b[3]);
    or or4(out[4], a[4], b[4]);
    or or5(out[5], a[5], b[5]);
    or or6(out[6], a[6], b[6]);
    or or7(out[7], a[7], b[7]);
    or or8(out[8], a[8], b[8]);
    or or9(out[9], a[9], b[9]);
    or or10(out[10], a[10], b[10]);
    or or11(out[11], a[11], b[11]);
    or or12(out[12], a[12], b[12]);
    or or13(out[13], a[13], b[13]);
    or or14(out[14], a[14], b[14]);
    or or15(out[15], a[15], b[15]);

    // Descrição de conexões internas do módulo

endmodule

`endif