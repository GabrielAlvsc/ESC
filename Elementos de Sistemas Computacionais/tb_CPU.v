/* testbench para CPU
 * ordem de portas: pc, addrM, outM, writeM, instruct, inM, reset, clk
 * input  [15:0] instruct, inM; 
 * input  reset, clk;
 * output [15:0] pc, addrM, outM;
 * output writeM;
 */

`include "CPU.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != value"); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = value"); \
    end

module tb_CPU;
    localparam MEMSIZE = 16; // número de registradores das ROM/RAM
    reg [15:0] instruct, inM; 
    reg reset, clk;
    wire [15:0] pc, addrM, outM;
    wire writeM;
    reg [15:0] rom [0:MEMSIZE-1];
    reg [15:0] ram [0:MEMSIZE-1];
    integer i;

    CPU mymodule(pc, addrM, outM, writeM, instruct, inM, reset, clk);

    always
    begin
        #1 clk = ~clk;
    end
    
    initial
    begin
        $dumpfile("tb_CPU.vcd");
        $dumpvars(0, tb_CPU);

        clk = 1;

        // Inicializa ROM e RAM =============================
        for(i = 0; i < MEMSIZE; i = i + 1) begin
            rom[i] = 16'b0;
            ram[i] = 16'b0;
        end

        // ADD: ram[0] = 30 + 12 = 42 =======================
        $readmemb("add_bin_file.mem", rom);

        reset = 1'b1; #2;
        $display("\nProg ADD: ram[0] = 30 + 12 ***");
        $display("reset pc = 0x%4h", pc); #2;
        // add_bin_file possui 6 instruções!
        for(i = 0; i < 6; i = i + 1) begin 
            instruct = rom[pc]; inM = ram[addrM]; reset = 1'b0;
            $display("exec rom[%0d] = 0x%4h", pc, rom[pc]); #2;
            if(writeM) begin
                ram[addrM] = outM;
            end
        end
        `assert(addrM, 16'b0); `assert(outM, 16'b101010);
        `assert(writeM, 1'b1); `assert(pc, 16'b110);
        for(i = 0; i < MEMSIZE; i = i + 1) begin
            $display("ram[%0d] = 0x%4h (%0d)", i, ram[i], ram[i]);
        end

        // MAX: ram[2] = max(ram[0], ram[1]) ================
        $readmemh("max_hex_file.mem", rom);
        
        // max(33, 42) ---------------------------------
        ram[0] = 33;
        ram[1] = 42;
        reset = 1'b1; #2;
        $display("\nProg MAX: ram[2] = max(ram[0], ram[1]) ***");
        $display("reset pc = 0x%4h", pc); #2;
        // max_hex_file possui 16 instruções!
        for(i = 0; i < 16; i = i + 1) begin
            instruct = rom[pc]; inM = ram[addrM]; reset = 1'b0;
            $display("exec rom[%0d] = 0x%4h", pc, rom[pc]); #2;
            if(writeM) begin
                ram[addrM] = outM;
            end
        end
        `assert(addrM, 16'b1110); `assert(outM, 16'b0);
        `assert(writeM, 1'b0); `assert(pc, 16'b1110);
        for(i = 0; i < MEMSIZE; i = i + 1) begin
            $display("ram[%0d] = 0x%4h (%0d)", i, ram[i], ram[i]);
        end

        // max(121, 13) ---------------------------------
        ram[0] = 121;
        ram[1] = 13;
        reset = 1'b1; #2;
        $display("\nProg MAX: ram[2] = max(ram[0], ram[1]) ***");
        $display("reset pc = 0x%4h", pc); #2;
        // max_hex_file possui 16 instruções!
        for(i = 0; i < 16; i = i + 1) begin
            instruct = rom[pc]; inM = ram[addrM]; reset = 1'b0;
            $display("exec rom[%0d] = 0x%4h", pc, rom[pc]); #2;
            if(writeM) begin
                ram[addrM] = outM;
            end
        end
        `assert(addrM, 16'b1110); `assert(outM, 16'b0);
        `assert(writeM, 1'b0); `assert(pc, 16'b1110);
        for(i = 0; i < MEMSIZE; i = i + 1) begin
            $display("ram[%0d] = 0x%4h (%0d)", i, ram[i], ram[i]);
        end

        $finish;
    end
endmodule