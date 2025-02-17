/* módulo FullAdder */

`ifndef _FullAdder_
`define _FullAdder_
`include "HalfAdder.v"

module FullAdder(s, cout, a, b, cin);
    input a, b, cin;
    output cout, s;
    wire w0, w1, w2;

    HalfAdder ha0(w1, w0, a, b);
    HalfAdder ha1(s, w2, w1, cin);
    or or0(cout, w0, w2);

    // Descrição de conexões internas do módulo

endmodule

`endif