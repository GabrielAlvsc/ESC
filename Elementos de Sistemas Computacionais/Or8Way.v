/* módulo Or8Way */

`ifndef _Or8Way_
`define _Or8Way_

module Or8Way(out, a, b, c, d, e, f, g, h);
    input a, b, c, d, e, f, g, h;
    output out;
    wire w0, w1, w2, w3, w4, w5;

    or or0(w0, a, b);
    or or1(w1, c, d);
    or or2(w2, e, f);
    or or3(w3, g, h);
    or or4(w4, w0, w1);
    or or5(w5, w2, w3);
    or or6(out, w5, w4);

endmodule

`endif