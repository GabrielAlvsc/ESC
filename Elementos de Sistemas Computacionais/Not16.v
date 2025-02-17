/* módulo Not16 */

`ifndef _Not16_
`define _Not16_

module Not16(out, in);
    input [15:0] in;
    output [15:0] out ;

    not not0(out[0], in[0]);
    not not1(out[1], in[1]);
    not not2(out[2], in[2]);
    not not3(out[3], in[3]);
    not not4(out[4], in[4]);
    not not5(out[5], in[5]);
    not not6(out[6], in[6]);
    not not7(out[7], in[7]);
    not not8(out[8], in[8]);
    not not9(out[9], in[9]);
    not not10(out[10], in[10]);
    not not11(out[11], in[11]);
    not not12(out[12], in[12]);
    not not13(out[13], in[13]);
    not not14(out[14], in[14]);
    not not15(out[15], in[15]);

    // Descrição de conexões internas do módulo

endmodule

`endif