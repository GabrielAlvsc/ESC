import CPUtables as cpu
import sys


def assem(file):
    
    # symbol table na forma de dicionario (mais facil de armazenar)
    symtable = {
        "R0" : 0,
        "R1" : 1,
        "R2" : 2,
        "R3" : 3,
        "R4" : 4,
        "R5" : 5,
        "R6" : 6,
        "R7" : 7,
        "R8" : 8,
        "R9" : 9,
        "R10" : 10,
        "R11" : 11,
        "R12" : 12,
        "R13" : 13,
        "R14" : 14,
        "R15" : 15,
        "SCREEN" : 16384,
        "KBD" : 24576,
        "SP" : 0,
        "LCL" : 1,
        "ARG" : 2,
        "THIS" : 3,
        "THAT" : 4 
    }

    #Data symbols


    with open(file, "r") as f:
        lines = list(l.split("//")[0].strip() for l in f.readlines() \
                    if l.strip() and not l.startswith("//"))

    #print(lines)

    label_lineCounter = 0
    label_list = list()
    varstart = 16

    # valor das labels da tabela de simbolos
    for c in lines:
        if(c.startswith("(")):
            label = (c[1:]).split(")")[0]
            symtable[label]=label_lineCounter
            label_lineCounter -= 1
            label_list.append(c)
        label_lineCounter += 1

    for l in label_list:
        lines.remove(l)


    codasm = list()
    for l in lines:
        # A-instruction @n (15bits > 0)
        if(l.startswith("@")):
            try:
                n = int(l[1:])
                codasm.append(f"0{n:015b}")
            except:
                var = l[1:]
                if var in symtable:
                    codasm.append(f'0{symtable[var]:015b}')
                else:
                    symtable[var] = varstart
                    varstart += 1
                    codasm.append(f'0{symtable[var]:015b}')
        # C-instruction lllaccccccdddjjj
        else:
            ddd, aux = l.split("=") if "=" in l else ("", l) # dividindo dest
            acccccc, jjj = aux.split(";") if ";" in aux else (aux, "") # dividindo comp e jump
            codasm.append(f"111{cpu.tcomp(acccccc)}{cpu.tdest(ddd)}{cpu.tjump(jjj)}") 


    #print(symtable)
    #print(codasm) 

    with open(file.split('.')[0] + ".bin", "w") as f:
        for c in codasm:
            f.write(c + "\n")

assem(input("digite o nome do arquivo ASM: "))

"""
try:
    file = sys.argv[1]
    assem(file)
except:
    print("Digite o nome do arquivo no formato arquivo.asm ou o arquivo não existe") 
    """