/* módulo DMux4Way16 */

`ifndef _DMux4Way16_
`define _DMux4Way16_

`include "DMux16.v"

module DMux4Way16(a, b, c, d, in, sel);
    input [15:0] in;
    input [1:0] sel;
    output [15:0] a, b, c, d ;
    wire [15:0] w0, w1;

    // 

    DMux16 dmux16_0(w0, w1, in, sel[1]);
    DMux16 dmux16_1(a, b, w0, sel[0]);
    DMux16 dmux16_2(c, d, w1, sel[1]);

endmodule

`endif