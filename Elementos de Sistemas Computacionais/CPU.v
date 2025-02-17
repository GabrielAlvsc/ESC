/* módulo CPU */

`ifndef _CPU_
`define _CPU_

`include "Mux16.v"
`include "ALU.v"
`include "ProgramCounter.v"
`include "Register16.v"


module CPU(pc, addrM, outM, writeM, instruct, inM, reset, clk);
    
    input [15:0] instruct, inM;
    input reset, clk;
    output [15:0] outM, pc, addrM;
    output writeM;
    wire [15:0] w0, w1, w2;
    wire addrM, a0, sel0, loadA, loadD, zr, ng, w3, w4, w5, w6, w7, w8, loadPC;

    and and0(a0, instruct[15], instruct[5]);
    not not0(sel0, instruct[15]);
    or or0(loadA, sel0, a0);
    Mux16 muxA(w0, outM, instruct, sel0);

    Register16 regA(addrM, w0, loadA, clk);

    Mux16 muxB(w1, addrM, inM, instruct[12]);

    and and1(loadD, instruct[15], instruct[4]);
    and and2(writeM, instruct[15], instruct[3]);

    Register16 regD(w2, outM, loadD, clk);

    ALU alu0(outM, zr, ng, w2, w1, instruct[11], instruct[10], instruct[9], instruct[8], instruct[7], instruct[6]);

    nor nor0(w3, zr, ng);
    and and3(w4, instruct[2], ng);
    and and4(w5, instruct[1], zr);
    and and5(w6, instruct[0], w3);
    or or1(w7, w5, w6);
    or or2(w8, w4, w7);
    
    and and6(loadPC, w8, instruct[15]);

    ProgramCounter programcounter0(pc, addrM, loadPC, 1'b1, reset, clk);
    


    

    // Descrição de conexões internas do módulo

endmodule

`endif