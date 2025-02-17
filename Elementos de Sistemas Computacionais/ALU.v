/* módulo ALU */

`ifndef _ALU_
`define _ALU_

`include "Mux16.v"
`include "Not16.v"
`include "And16.v"
`include "Adder16.v"
`include "Or8Way.v"


module ALU(out, zr, ng, x, y, zx, nx, zy, ny, f, no);
    // Declarando as entradas/saidas
    input [15:0] x, y;
    input zx, nx, zy, ny, f, no;
    output [15:0] out;
    output zr, ng;
    wire [15:0] aux, w0, w1, w2, w3, w4, w5, w6, w7, w8, w9;
    assign aux = 16'b0000000000000000;
    wire wnor0, wnor1, wnor2;
    wire ovfl;

    Mux16 mux_x0(w0, x, aux, zx);
    Mux16 mux_y0(w1, y, aux, zy);
    Not16 not_x0(w2, w0);
    Not16 not_y0(w3, w1);
    Mux16 mux_x1(w4, w0, w2, nx);
    Mux16 mux_y1(w5, w1, w3, ny);
    And16 and0(w6, w4, w5);
    Adder16 add0(w7, ovfl, w4, w5);
    Mux16 mux0(w8, w6, w7, f);
    Not16 not0(w9, w8);
    Mux16 mux1(out, w8, w9, no);
    
    assign ng = out[15];

    Or8Way nor0(wnor0, out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]);
    Or8Way nor1(wnor1, out[8], out[9], out[10], out[11], out[12], out[13], out[14], out[15]);
    or nor2(wnor2, wnor0, wnor1);
    not nor3(zr, wnor2);
    


    // Descrição de conexões internas do módulo

endmodule

`endif