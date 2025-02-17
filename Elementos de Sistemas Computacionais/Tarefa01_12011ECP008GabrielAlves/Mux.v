/* módulo Mux */

`ifndef _Mux_
`define _Mux_

module Mux(out, a, b, sel);
    input a, b, sel;
    output out;
    wire w1, w2, w3;

    nand nand0(w1, a, sel);
    nand nand1(w2, w3, b);
    nand nand2(out, w1, w2);
    not not0(w3, sel);

    // Descrição de conexões internas do módulo

endmodule

`endif