/* módulo DMux4Way */

`ifndef _DMux4Way_
`define _DMux4Way_

`include "DMux.v"

module DMux4Way(a, b, c, d, in, sel);
    input in;
    input [1:0] sel;
    output a, b, c, d;
    wire w0, w1;

    // 

    DMux dmux0(w0, w1, in, sel[1]);
    DMux dmux1(a, b, w0, sel[0]);
    DMux dmux2(c, d, w1, sel[0]);

endmodule

`endif