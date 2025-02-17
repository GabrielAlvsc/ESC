/* testbench para Increment16 */
/* ordem de portas: out, in */
/* input [15:0] in; */
/* output [15:0] out; */

`include "Increment16.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_Increment16;
    reg [15:0] in;
    wire [15:0] out;

    Increment16 mymodule(out, in);
    
    initial
    begin
        $dumpfile("tb_Increment16.vcd");
        $dumpvars(0, tb_Increment16);

        in = 16'b0000000000000000; #1;
         `assert(out, 16'b0000000000000001)
        in = 16'b0000000011111101; #1;
         `assert(out, 16'b0000000011111110)
        in = 16'b0000101010011101; #1;
         `assert(out, 16'b0000101010011110)
        in = 16'b0001100001011000; #1;
         `assert(out, 16'b0001100001011001)
        in = 16'b0001111100101010; #1;
         `assert(out, 16'b0001111100101011)
        in = 16'b0011010011100100; #1;
         `assert(out, 16'b0011010011100101)
        in = 16'b0100100000100000; #1;
         `assert(out, 16'b0100100000100001)
        in = 16'b0101111100000100; #1;
         `assert(out, 16'b0101111100000101)
        in = 16'b0101111110011001; #1;
         `assert(out, 16'b0101111110011010)
        in = 16'b0110110000110111; #1;
         `assert(out, 16'b0110110000111000)
        in = 16'b0111000001000110; #1;
         `assert(out, 16'b0111000001000111)
        in = 16'b0111001001111001; #1;
         `assert(out, 16'b0111001001111010)
        in = 16'b0111110010001101; #1;
         `assert(out, 16'b0111110010001110)
        in = 16'b1001010001111101; #1;
         `assert(out, 16'b1001010001111110)
        in = 16'b1001011010000100; #1;
         `assert(out, 16'b1001011010000101)
        in = 16'b1001101101000000; #1;
         `assert(out, 16'b1001101101000001)
        in = 16'b1001110000010101; #1;
         `assert(out, 16'b1001110000010110)
        in = 16'b1010000000010001; #1;
         `assert(out, 16'b1010000000010010)
        in = 16'b1010101111011010; #1;
         `assert(out, 16'b1010101111011011)
        in = 16'b1011011110000011; #1;
         `assert(out, 16'b1011011110000100)
        in = 16'b1100000101101010; #1;
         `assert(out, 16'b1100000101101011)
        in = 16'b1100011110010001; #1;
         `assert(out, 16'b1100011110010010)
        in = 16'b1100110000010011; #1;
         `assert(out, 16'b1100110000010100)
        in = 16'b1101000111101011; #1;
         `assert(out, 16'b1101000111101100)
        in = 16'b1101010011111010; #1;
         `assert(out, 16'b1101010011111011)
        in = 16'b1101101001111010; #1;
         `assert(out, 16'b1101101001111011)
        in = 16'b1101110010000010; #1;
         `assert(out, 16'b1101110010000011)
        in = 16'b1110000011111000; #1;
         `assert(out, 16'b1110000011111001)
        in = 16'b1110010001100111; #1;
         `assert(out, 16'b1110010001101000)
        in = 16'b1111111111111111; #1;
         `assert(out, 16'b0000000000000000)

    end
endmodule