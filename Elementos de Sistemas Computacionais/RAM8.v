/* módulo RAM8 */

`ifndef _RAM8_
`define _RAM8_

`include "DMux.V"
`include "DMux4Way.V"
`include "Register16.v"
`include "Mux8Way16.v"

module RAM8(out, in, addr, write, clk);
    input [15:0] in;
    input [2:0] addr;
    input write, clk;
    output [15:0] out;
    wire dm0, dm1, w0, w1, w2, w3, w4, w5, w6, w7; 
    wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7;

    DMux dmuxw0(dm0, dm1, write, addr[2]);
    DMux4Way dmuxw1(w0, w1, w2, w3, dm0, addr[1:0]);
    DMux4Way dmuxw2(w4, w5, w6, w7, dm1, addr[1:0]);

    Register16 reg0(r0, in, w0, clk);
    Register16 reg1(r1, in, w1, clk);
    Register16 reg2(r2, in, w2, clk);
    Register16 reg3(r3, in, w3, clk);
    Register16 reg4(r4, in, w4, clk);
    Register16 reg5(r5, in, w5, clk);
    Register16 reg6(r6, in, w6, clk);
    Register16 reg7(r7, in, w7, clk);

    Mux8Way16 muxw0(out, r0, r1, r2, r3, r4, r5, r6, r7, addr);

    // Descrição de conexões internas do módulo

endmodule

`endif