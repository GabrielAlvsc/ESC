/* módulo DMux16 */

`ifndef _DMux16_
`define _DMux16_

module DMux16(a, b, in, sel);
    input [15:0] in; 
    input sel;
    output [15:0] a, b;
    wire w0;

    // Descrição de conexões internas do módulo

    not not0(w0, sel);

    and and0_0(a[0], in[0], sel);
    and and0_1(a[1], in[1], sel);
    and and0_2(a[2], in[2], sel);
    and and0_3(a[3], in[3], sel);
    and and0_4(a[4], in[4], sel);
    and and0_5(a[5], in[5], sel);
    and and0_6(a[6], in[6], sel);
    and and0_7(a[7], in[7], sel);
    and and0_8(a[8], in[8], sel);
    and and0_9(a[9], in[9], sel);
    and and0_10(a[10], in[10], sel);
    and and0_11(a[11], in[11], sel);
    and and0_12(a[12], in[12], sel);
    and and0_13(a[13], in[13], sel);
    and and0_14(a[14], in[14], sel);
    and and0_15(a[15], in[15], sel);

    //


    and and1_0(b[0], in[0], w0);
    and and1_1(b[1], in[1], w0);
    and and1_2(b[2], in[2], w0);
    and and1_3(b[3], in[3], w0);
    and and1_4(b[4], in[4], w0);
    and and1_5(b[5], in[5], w0);
    and and1_6(b[6], in[6], w0);
    and and1_7(b[7], in[7], w0);
    and and1_8(b[8], in[8], w0);
    and and1_9(b[9], in[9], w0);
    and and1_10(b[10], in[10], w0);
    and and1_11(b[11], in[11], w0);
    and and1_12(b[12], in[12], w0);
    and and1_13(b[13], in[13], w0);
    and and1_14(b[14], in[14], w0);
    and and1_15(b[15], in[15], w0);



endmodule

`endif