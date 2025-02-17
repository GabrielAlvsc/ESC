/* módulo Mux */

`ifndef _Mux_
`define _Mux_

module Mux(out, a, b, sel);
    input a, b, sel;
    output out;
    wire w0, w1, w2;

    
    nand nand0(w0, a, w2);
    nand nand1(w1, b, sel);
    nand nand2(out, w0, w1);
    not not0(w2, sel);

    // Descrição de conexões internas do módulo

endmodule

`endif