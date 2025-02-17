/* testbench para Not16 */
/* ordem de portas: out, in */
/* input [15:0] in; */
/* output [15:0] out; */

`include "Not16.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_Not16;
    reg [15:0] in;
    wire [15:0] out;

    Not16 mymodule(out, in);
    
    initial
    begin
        $dumpfile("tb_Not16.vcd");
        $dumpvars(0, tb_Not16);

        in = 16'b0000011011101110; #1;
         `assert(out, 16'b1111100100010001)
        in = 16'b0000111011100110; #1;
         `assert(out, 16'b1111000100011001)
        in = 16'b0000111110110100; #1;
         `assert(out, 16'b1111000001001011)
        in = 16'b0010001001101100; #1;
         `assert(out, 16'b1101110110010011)
        in = 16'b0011011101111010; #1;
         `assert(out, 16'b1100100010000101)
        in = 16'b0011100000010110; #1;
         `assert(out, 16'b1100011111101001)
        in = 16'b0011100010111101; #1;
         `assert(out, 16'b1100011101000010)
        in = 16'b0011100101111001; #1;
         `assert(out, 16'b1100011010000110)
        in = 16'b0100100000000111; #1;
         `assert(out, 16'b1011011111111000)
        in = 16'b0110001000111001; #1;
         `assert(out, 16'b1001110111000110)
        in = 16'b0111010110100111; #1;
         `assert(out, 16'b1000101001011000)
        in = 16'b0111011000001010; #1;
         `assert(out, 16'b1000100111110101)
        in = 16'b0111110010111011; #1;
         `assert(out, 16'b1000001101000100)
        in = 16'b1000000111010000; #1;
         `assert(out, 16'b0111111000101111)
        in = 16'b1000010111110010; #1;
         `assert(out, 16'b0111101000001101)
        in = 16'b1000110011001011; #1;
         `assert(out, 16'b0111001100110100)
        in = 16'b1000111011000101; #1;
         `assert(out, 16'b0111000100111010)
        in = 16'b1001100000111100; #1;
         `assert(out, 16'b0110011111000011)
        in = 16'b1001100011000111; #1;
         `assert(out, 16'b0110011100111000)
        in = 16'b1001110011011101; #1;
         `assert(out, 16'b0110001100100010)
        in = 16'b1010011011001010; #1;
         `assert(out, 16'b0101100100110101)
        in = 16'b1100000101101111; #1;
         `assert(out, 16'b0011111010010000)
        in = 16'b1100100010100101; #1;
         `assert(out, 16'b0011011101011010)
        in = 16'b1100101101111110; #1;
         `assert(out, 16'b0011010010000001)
        in = 16'b1101110111010100; #1;
         `assert(out, 16'b0010001000101011)
        in = 16'b1101111010000000; #1;
         `assert(out, 16'b0010000101111111)
        in = 16'b1110111010100000; #1;
         `assert(out, 16'b0001000101011111)
        in = 16'b1111001011110100; #1;
         `assert(out, 16'b0000110100001011)
        in = 16'b1111101010000011; #1;
         `assert(out, 16'b0000010101111100)
        in = 16'b1111110010010000; #1;
         `assert(out, 16'b0000001101101111)

    end
endmodule