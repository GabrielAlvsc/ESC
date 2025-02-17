/* testbench para Projeto Asssembly: Multiplica
 * utilizar o módulo CPU implementado pelos integrantes do grupo
 * se precisar, altere o nome do arquivo binário gerado pelo seu assembler (linha 6)
 */

`define FILENAME "multiplica.bin"

`include "CPU.v"

`define assert(signal, value) \
    if (signal !== value) \
    begin \
        $display("ASSERTION FAILED in %m: signal != %0d", value); \
        $finish; \
    end else begin \
        $display("Success! %m: signal = %0d", value); \
    end

module tb_ProjetoMultiplica;

    localparam MEMSIZE = 32768; // número de registradores das ROM/RAM
    reg [15:0] instruct, inM; 
    reg reset, clk;
    wire [15:0] pc, addrM, outM;
    wire writeM;
    reg [15:0] rom [0:MEMSIZE-1];
    reg signed [15:0] ram [0:MEMSIZE-1];
    integer i, sm, oldpc, break;
    integer signed a, b, c;

    CPU mymodule(pc, addrM, outM, writeM, instruct, inM, reset, clk);

    always
    begin
        #1 clk = ~clk;
    end
    
    initial
    begin
        $dumpfile("tb_ProjetoMultiplica.vcd");
        $dumpvars(0, tb_ProjetoMultiplica);

        clk = 1;

        // Inicializa ROM e RAM =============================
        for(i = 0; i < MEMSIZE; i = i + 1) begin
            rom[i] = 16'b0;
            ram[i] = 16'b0;
        end

        // MULTIPLICA: ram[0] = ram[0]*ram[1] =========================
        $readmemb(`FILENAME, rom);

        // Test Case #1
        i = 1;
        a = 3; b = 4; c = 12;
        ram[0] = a;
        ram[1] = b;
        reset = 1'b1; #2;
        $display("\nProg Multiplica, teste %0d: %0d*%0d = %0d ***", i, a, b, c);
        break = 0; sm = 0;
        for(i = 0; i < 100*MEMSIZE && break <= 3; i = i + 1) begin 
            oldpc = pc;
            instruct = rom[pc]; inM = ram[addrM]; reset = 1'b0; #2;
            if(writeM) begin
                ram[addrM] = outM;
            end
            // simulating 'break'
            if(sm > 0 && pc == oldpc + 1) begin sm = 0; end
            else begin
                if(sm == 0 && rom[oldpc] == oldpc) begin
                    sm = oldpc; break = break + 1;
                end
            end
        end
        for(i = 0; i < 3; i = i + 1) begin
            $display("ram[%0d] = 0x%4h (%0d)", i, ram[i], ram[i]);
        end
        `assert(ram[0], a); `assert(ram[1], b); `assert(ram[2], c);
        // $writememb("memory_binary_m0.txt", ram);

        // Test Case #2
        i = 2;
        a = 42; b = 7; c = 294;
        ram[0] = a;
        ram[1] = b;
        reset = 1'b1; #2;
        $display("\nProg Multiplica, teste %0d: %0d*%0d = %0d ***", i, a, b, c);
        break = 0; sm = 0;
        for(i = 0; i < 100*MEMSIZE && break <= 3; i = i + 1) begin 
            oldpc = pc;
            instruct = rom[pc]; inM = ram[addrM]; reset = 1'b0; #2;
            if(writeM) begin
                ram[addrM] = outM;
            end
            // simulating 'break'
            if(sm > 0 && pc == oldpc + 1) begin sm = 0; end
            else begin
                if(sm == 0 && rom[oldpc] == oldpc) begin
                    sm = oldpc; break = break + 1;
                end
            end
        end
        for(i = 0; i < 3; i = i + 1) begin
            $display("ram[%0d] = 0x%4h (%0d)", i, ram[i], ram[i]);
        end
        `assert(ram[0], a); `assert(ram[1], b); `assert(ram[2], c);
        // $writememb("memory_binary_m0.txt", ram);

        // Test Case #3
        i = 3;
        a = 0; b = 0; c = 0;
        ram[0] = a;
        ram[1] = b;
        reset = 1'b1; #2;
        $display("\nProg Multiplica, teste %0d: %0d*%0d = %0d ***", i, a, b, c);
        break = 0; sm = 0;
        for(i = 0; i < 100*MEMSIZE && break <= 3; i = i + 1) begin 
            oldpc = pc;
            instruct = rom[pc]; inM = ram[addrM]; reset = 1'b0; #2;
            if(writeM) begin
                ram[addrM] = outM;
            end
            // simulating 'break'
            if(sm > 0 && pc == oldpc + 1) begin sm = 0; end
            else begin
                if(sm == 0 && rom[oldpc] == oldpc) begin
                    sm = oldpc; break = break + 1;
                end
            end
        end
        for(i = 0; i < 3; i = i + 1) begin
            $display("ram[%0d] = 0x%4h (%0d)", i, ram[i], ram[i]);
        end
        `assert(ram[0], a); `assert(ram[1], b); `assert(ram[2], c);
        // $writememb("memory_binary_m0.txt", ram);

        // Test Case #4
        i = 4;
        a = 1; b = 0; c = 0;
        ram[0] = a;
        ram[1] = b;
        reset = 1'b1; #2;
        $display("\nProg Multiplica, teste %0d: %0d*%0d = %0d ***", i, a, b, c);
        break = 0; sm = 0;
        for(i = 0; i < 100*MEMSIZE && break <= 3; i = i + 1) begin 
            oldpc = pc;
            instruct = rom[pc]; inM = ram[addrM]; reset = 1'b0; #2;
            if(writeM) begin
                ram[addrM] = outM;
            end
            // simulating 'break'
            if(sm > 0 && pc == oldpc + 1) begin sm = 0; end
            else begin
                if(sm == 0 && rom[oldpc] == oldpc) begin
                    sm = oldpc; break = break + 1;
                end
            end
        end
        for(i = 0; i < 3; i = i + 1) begin
            $display("ram[%0d] = 0x%4h (%0d)", i, ram[i], ram[i]);
        end
        `assert(ram[0], a); `assert(ram[1], b); `assert(ram[2], c);
        // $writememb("memory_binary_m0.txt", ram);

        // Test Case #5
        i = 5;
        a = 0; b = 3; c = 0;
        ram[0] = a;
        ram[1] = b;
        reset = 1'b1; #2;
        $display("\nProg Multiplica, teste %0d: %0d*%0d = %0d ***", i, a, b, c);
        break = 0; sm = 0;
        for(i = 0; i < 100*MEMSIZE && break <= 3; i = i + 1) begin 
            oldpc = pc;
            instruct = rom[pc]; inM = ram[addrM]; reset = 1'b0; #2;
            if(writeM) begin
                ram[addrM] = outM;
            end
            // simulating 'break'
            if(sm > 0 && pc == oldpc + 1) begin sm = 0; end
            else begin
                if(sm == 0 && rom[oldpc] == oldpc) begin
                    sm = oldpc; break = break + 1;
                end
            end
        end
        for(i = 0; i < 3; i = i + 1) begin
            $display("ram[%0d] = 0x%4h (%0d)", i, ram[i], ram[i]);
        end
        `assert(ram[0], a); `assert(ram[1], b); `assert(ram[2], c);
        // $writememb("memory_binary_m0.txt", ram);

        // Test Case #6
        i = 6;
        a = -26; b = 1; c = -26;
        ram[0] = a;
        ram[1] = b;
        reset = 1'b1; #2;
        $display("\nProg Multiplica, teste %0d: %0d*%0d = %0d ***", i, a, b, c);
        break = 0; sm = 0;
        for(i = 0; i < 100*MEMSIZE && break <= 3; i = i + 1) begin 
            oldpc = pc;
            instruct = rom[pc]; inM = ram[addrM]; reset = 1'b0; #2;
            if(writeM) begin
                ram[addrM] = outM;
            end
            // simulating 'break'
            if(sm > 0 && pc == oldpc + 1) begin sm = 0; end
            else begin
                if(sm == 0 && rom[oldpc] == oldpc) begin
                    sm = oldpc; break = break + 1;
                end
            end
        end
        for(i = 0; i < 3; i = i + 1) begin
            $display("ram[%0d] = 0x%4h (%0d)", i, ram[i], ram[i]);
        end
        `assert(ram[0], a); `assert(ram[1], b); `assert(ram[2], c);
        // $writememb("memory_binary_m0.txt", ram);

        // Test Case #7
        i = 7;
        a = 26; b = -1; c = -26;
        ram[0] = a;
        ram[1] = b;
        reset = 1'b1; #2;
        $display("\nProg Multiplica, teste %0d: %0d*%0d = %0d ***", i, a, b, c);
        break = 0; sm = 0;
        for(i = 0; i < 100*MEMSIZE && break <= 3; i = i + 1) begin 
            oldpc = pc;
            instruct = rom[pc]; inM = ram[addrM]; reset = 1'b0; #2;
            if(writeM) begin
                ram[addrM] = outM;
            end
            // simulating 'break'
            if(sm > 0 && pc == oldpc + 1) begin sm = 0; end
            else begin
                if(sm == 0 && rom[oldpc] == oldpc) begin
                    sm = oldpc; break = break + 1;
                end
            end
        end
        for(i = 0; i < 3; i = i + 1) begin
            $display("ram[%0d] = 0x%4h (%0d)", i, ram[i], ram[i]);
        end
        `assert(ram[0], a); `assert(ram[1], b); `assert(ram[2], c);
        // $writememb("memory_binary_m0.txt", ram);
        
        // Test Case #8
        i = 8;
        a = 7; b = -2; c = -14;
        ram[0] = a;
        ram[1] = b;
        reset = 1'b1; #2;
        $display("\nProg Multiplica, teste %0d: %0d*%0d = %0d ***", i, a, b, c);
        break = 0; sm = 0;
        for(i = 0; i < 100*MEMSIZE && break <= 3; i = i + 1) begin 
            oldpc = pc;
            instruct = rom[pc]; inM = ram[addrM]; reset = 1'b0; #2;
            if(writeM) begin
                ram[addrM] = outM;
            end
            // simulating 'break'
            if(sm > 0 && pc == oldpc + 1) begin sm = 0; end
            else begin
                if(sm == 0 && rom[oldpc] == oldpc) begin
                    sm = oldpc; break = break + 1;
                end
            end
        end
        for(i = 0; i < 3; i = i + 1) begin
            $display("ram[%0d] = 0x%4h (%0d)", i, ram[i], ram[i]);
        end
        `assert(ram[0], a); `assert(ram[1], b); `assert(ram[2], c);
        // $writememb("memory_binary_m0.txt", ram);

        // Test Case #9
        i = 9;
        a = -7; b = -2; c = 14;
        ram[0] = a;
        ram[1] = b;
        reset = 1'b1; #2;
        $display("\nProg Multiplica, teste %0d: %0d*%0d = %0d ***", i, a, b, c);
        break = 0; sm = 0;
        for(i = 0; i < 100*MEMSIZE && break <= 3; i = i + 1) begin 
            oldpc = pc;
            instruct = rom[pc]; inM = ram[addrM]; reset = 1'b0; #2;
            if(writeM) begin
                ram[addrM] = outM;
            end
            // simulating 'break'
            if(sm > 0 && pc == oldpc + 1) begin sm = 0; end
            else begin
                if(sm == 0 && rom[oldpc] == oldpc) begin
                    sm = oldpc; break = break + 1;
                end
            end
        end
        for(i = 0; i < 3; i = i + 1) begin
            $display("ram[%0d] = 0x%4h (%0d)", i, ram[i], ram[i]);
        end
        `assert(ram[0], a); `assert(ram[1], b); `assert(ram[2], c);
        // $writememb("memory_binary_m0.txt", ram);

        $finish;
    end
endmodule