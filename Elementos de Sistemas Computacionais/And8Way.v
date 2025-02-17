/* módulo And8Way */

`ifndef _And8Way_
`define _And8Way_

module And8Way(out, a, b, c, d, e, f, g, h);
    input a, b, c, d, e, f, g, h;
    output out;
    wire w0, w1, w2, w3, w4, w5;

    and and0(w0, a, b);
    and and1(w1, c, d);
    and and2(w2, e, f);
    and and3(w3, g, h);
    and and4(w4, w0, w1);
    and and5(w5, w2, w3);
    and and6(out, w5, w4);

    // Descrição de conexões internas do módulo

endmodule

`endif