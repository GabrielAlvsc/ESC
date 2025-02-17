/* módulo DMux */

`ifndef _DMux_
`define _DMux_

module DMux(a, b, in, sel);
    input in, sel;
    output a, b;
    wire w0;

    and and0(a, in, sel);
    not not0(w0, sel);
    and and1(b, in, w0);
    // Descrição de conexões internas do módulo

endmodule

`endif