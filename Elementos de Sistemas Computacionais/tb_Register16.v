/* testbench para Register16 */
/* ordem de portas: out, in, load, clk */
/* input [15:0] in; */
/* input load, clk; */
/* output [15:0] out; */

`include "Register16.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_Register16;
    reg [15:0] in;
    reg load, clk;
    wire [15:0] out;

    Register16 reg0(out, in, load, clk);
    
    always
    begin
        #1 clk = ~clk;
    end
    
    initial
    begin
        $dumpfile("tb_Register16.vcd");
        $dumpvars(0, tb_Register16);

        clk = 0;

        in = 16'b0; load = 1; #3;
        `assert(out, 16'b0)

        in = 16'b0000000000000000; load = 1; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000011001000110; load = 0; #3;
        `assert(out, 16'b0000000000000000);

        in = 16'b0000100001100000; load = 1; #3;
        `assert(out, 16'b0000100001100000);

        in = 16'b0001001001100101; load = 0; #3;
        `assert(out, 16'b0000100001100000);

        in = 16'b0001001110011011; load = 1; #3;
        `assert(out, 16'b0001001110011011);

        in = 16'b0001111001110110; load = 0; #3;
        `assert(out, 16'b0001001110011011);

        in = 16'b0010000001110100; load = 1; #3;
        `assert(out, 16'b0010000001110100);

        in = 16'b0010010101101000; load = 0; #3;
        `assert(out, 16'b0010000001110100);

        in = 16'b0010011100011111; load = 1; #3;
        `assert(out, 16'b0010011100011111);

        in = 16'b0010101010110011; load = 0; #3;
        `assert(out, 16'b0010011100011111);

        in = 16'b0011001010000001; load = 1; #3;
        `assert(out, 16'b0011001010000001);

        in = 16'b0101001001011111; load = 0; #3;
        `assert(out, 16'b0011001010000001);

        in = 16'b0101001011010000; load = 1; #3;
        `assert(out, 16'b0101001011010000);

        in = 16'b0101100011001001; load = 0; #3;
        `assert(out, 16'b0101001011010000);

        in = 16'b0101110110100111; load = 1; #3;
        `assert(out, 16'b0101110110100111);

        in = 16'b1000000110000101; load = 0; #3;
        `assert(out, 16'b0101110110100111);

        in = 16'b1000110101100011; load = 1; #3;
        `assert(out, 16'b1000110101100011);

        in = 16'b1001000001001110; load = 0; #3;
        `assert(out, 16'b1000110101100011);

        in = 16'b1001001100111100; load = 1; #3;
        `assert(out, 16'b1001001100111100);

        in = 16'b1010100101100001; load = 0; #3;
        `assert(out, 16'b1001001100111100);

        in = 16'b1010101101010101; load = 1; #3;
        `assert(out, 16'b1010101101010101);

        in = 16'b1011001010111001; load = 0; #3;
        `assert(out, 16'b1010101101010101);

        in = 16'b1011100010000111; load = 1; #3;
        `assert(out, 16'b1011100010000111);

        in = 16'b1100100001010011; load = 0; #3;
        `assert(out, 16'b1011100010000111);

        in = 16'b1101011110111110; load = 1; #3;
        `assert(out, 16'b1101011110111110);

        in = 16'b1101101011111101; load = 0; #3;
        `assert(out, 16'b1101011110111110);

        in = 16'b1110001101011000; load = 1; #3;
        `assert(out, 16'b1110001101011000);

        in = 16'b1110011101101000; load = 0; #3;
        `assert(out, 16'b1110001101011000);

        in = 16'b1110111010100100; load = 1; #3;
        `assert(out, 16'b1110111010100100);

        in = 16'b1111111111111111; load = 0; #3;
        `assert(out, 16'b1110111010100100);

        $finish;
    end

endmodule
