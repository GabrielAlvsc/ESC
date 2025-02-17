/* módulo DMux8Way16 */

`ifndef _DMux8Way16_
`define _DMux8Way16_

`include "DMux4Way16.v"
`include "DMux16.v"

module DMux8Way16(a, b, c, d, e, f, g, h, in, sel);
    input [15:0] in;
    input [2:0] sel;
    output [15:0] a, b, c, d, e, f, g, h;
    wire [15:0] w1, w0;

    // 

    DMux16 dmux816_0(w1, w0, in, sel[2]);
    DMux4Way16 dmux816_1(a, b, c, d, w1, sel[1:0]);
    DMux4Way16 dmux816_2(e, f, g, h, w0, sel[1:0]);

endmodule

`endif