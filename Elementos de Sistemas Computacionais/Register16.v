/* módulo Register16 */

`ifndef _Register16_
`define _Register16_
`include "Bit.v"

module Register16(out, in, load, clk);
    input load, clk;
    input [15:0] in;
    output [15:0] out;

    Bit bit0(out[0], in[0], load, clk);
    Bit bit1(out[1], in[1], load, clk);
    Bit bit2(out[2], in[2], load, clk);
    Bit bit3(out[3], in[3], load, clk);
    Bit bit4(out[4], in[4], load, clk);
    Bit bit5(out[5], in[5], load, clk);
    Bit bit6(out[6], in[6], load, clk);
    Bit bit7(out[7], in[7], load, clk);
    Bit bit8(out[8], in[8], load, clk);
    Bit bit9(out[9], in[9], load, clk);
    Bit bit10(out[10], in[10], load, clk);
    Bit bit11(out[11], in[11], load, clk);
    Bit bit12(out[12], in[12], load, clk);
    Bit bit13(out[13], in[13], load, clk);
    Bit bit14(out[14], in[14], load, clk);
    Bit bit15(out[15], in[15], load, clk);
    

    // Descrição de conexões internas do módulo

endmodule

`endif