/* módulo Bit */

`ifndef _Bit_
`define _Bit_

`include "Mux.v"
`include "DLatch.v"

module Bit(out, in, load, clk);
    input in, load, clk;
    output out;
    wire w0, w1;

    Mux mux0(w0, w1, in, load);
    DLatch dff(w1, w0, clk);

    assign out = w1;


    // Descrição de conexões internas do módulo

endmodule

`endif