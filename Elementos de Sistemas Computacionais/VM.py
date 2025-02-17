# VIRTUAL MACHINE

# Elementos de Sistemas Computacionais 2022-2
# Alexandre Sued
# Arthur Biliato Javaroni
# Bruna Isabela de Oliveira
# Bruno Pavan
# Gabriel Alves
# Karoline Adelaide Barbosa
# Maria Fernanda Lopes
# Otavio Del Bianco Reis
# Victor Augusto Pinheiro Rocha
# Walter Alves
# -----------------------------------------------

# -----------------------------------------------

#-----------------------------------------------------------------PARSE3R----------------------------------------------------------------------------------


class Parser:
    def __init__(self, filename):
        if not filename.endswith(".vm"):
            filename += "vm"
        with open(filename, "r") as f:
            self.input = list(l.strip() \
                for l in f.readlines() if not l.startswith("//"))
        self.seek = 0
        self.current_command = None
    def hasMoreCommands(self):
        return self.seek < len(self.input)
    def advance(self):
        self.current_command = self.input[self.seek]
        self.seek += 1
    def command_type(self):
        head = self.current_command.split(' ')[0]
        if head in ['add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or', 'not']:
            return 'C_ARITHMETIC'
        elif head in ['push', 'pop', 'goto', 'function', 'call', 'return', 'label']:
            return f'C_{head.upper()}'
        elif head == 'if-goto': return 'C_IF'
        else:
            return f'C_{head.upper()}?'
    def arg1(self):
        ct = self.command_type()
        if ct != 'C_RETURN':
            if ct == 'C_ARITHMETIC':
                return self.current_command.split(' ')[0]
            return self.current_command.split(' ') [1]
    def arg2(self):
        ct = self.command_type()
        if ct in ['C_PUSH', 'C_POP', 'C_FUNCTION', 'C_CALL']:
            return int(self.current_command.split(' ')[2])
    
#---------------------------------------------------------------------CODE  WRITER------------------------------------------------------------------------------

        
class CodeWriter:
    def __init__(self,output_file):
        self.output = open(output_file, "w")
        self.label_counter = 0
        self.vm_filename = None
    
    def close(self):
        self.output.write("(END) \n")
        self.output.write("@END \n")
        self.output.write("0;JMP \n")
        self.output.close()
    
    def writeArithmetic(self, command):
        if command == "add":
            self.writeBinaryOperation("+")
        elif command == "sub":
            self.writeBinaryOperation("-")
        elif command == "neg":
            self.writeUnaryOperation("-")
        elif command == "eq":
            self.writeComparison("JEQ")
        elif command == "gt":
            self.writeComparison("JGT")
        elif command == "lt":
            self.writeComparison("JLT")
        elif command == "and":
            self.writeBinaryOperation("&")
        elif command == "or":
            self.writeBinaryOperation("|")
        elif command == "not":
            self.writeUnaryOperation("!")

    def writePushPop(self, command, segment, index):
        if command == "push":
            if segment == "constant":
                self.writePushConstant(index)
            elif segment in ["local", "argument", "this", "that"]:
                self.writePushSegment(segment, index)
            elif segment == "temp":
                self.writePushTemp(index)
            elif segment == "pointer":
                self.writePushPointer(index)
            elif segment == "static":
                self.writePushStatic(index)
        elif command == "pop":
            if segment in ["local", "argument", "this", "that"]:
                self.writePopSegment(segment, index)
            elif segment == "temp":
                self.writePopTemp(index)
            elif segment == "pointer":
                self.writePopPointer(index)
            elif segment == "static":
                self.writePopStatic(index)
    
    def writeInit(self):
        self.output.write("@256 \n")
        self.output.write("D=A \n")
        self.output.write("@SP \n")
        self.output.write("M=D \n")
    
    def writeLabel(self, label):
        self.output.write("(" + label + ")\n")

    def writeGoto(self, label):
        self.output.write("@" + label + "\n")
        self.output.write("0;JMP\n")
    
    def writeIf(self, label):
        self.decreaseStackPointer()
        self.writePopToD()
        self.output.write("@" + label + "\n")
        self.output.write("D;JNE\n")
    
    def writeFunction(self, functionName, nVars):
        self.output.write("(" + functionName + ")\n")
        for _ in range(nVars):
            self.writePushConstant(0)
    
    def writeCall(self, functionName, nArgs):
        retAddrLabel = "RETURN_" + functionName
        self.writePushLabel(retAddrLabel)
        self.writePushCallerImage("LCL")
        self.writePushCallerImage("ARG")
        self.writePushCallerImage("THIS")
        self.writePushCallerImage("THAT")
        self.writeSetARG(nArgs)
        self.writeSetLCL()
        self.writeGoto(functionName)
        self.output.write("(RETURN" + retAddrLabel + ")\n")
    
    def writeReturn(self):
        self.writeFrameToR13()  
        self.writeReturnAddressToR14() 
        self.writeReturnValueToARG() 
        self.writeSPToARG() 
        self.writeRestoreThat() 
        self.writeRestoreThis()  
        self.writeRestoreArgument()
        self.writeRestoreLocal() 
        self.writeReturnAddressToA()
        self.writeGotoA()
    
    def setFileName(self, filename):
        self.vm_filename = filename
    

    def getUniqueLabel(self):
        label = f"UL{self.label_counter}"
        self.label_counter += 1
        return label
    
#---------------------------------------------------------------------------------------------------------------------------------------------------
    
    #ARITHMETICS & BOOLEANS

    def writeBinaryOperation(self, operation):
        self.decreaseStackPointer()
        self.writePopToD()
        self.decreaseStackPointer()
        self.writeDOperation(operation)
        self.increaseStackPointer()
        self.writeDtoStack()

    def writeUnaryOperation(self, operation):
        self.decreaseStackPointer()
        self.writePopToD()
        self.writeDUnaryOperation(operation)
        self.increaseStackPointer()
        self.writeDtoStack()

    def writeComparison(self, jump):
        self.decreaseStackPointer()
        self.writePopToD()
        self.writeR13ToM()
        self.decreaseStackPointer()
        self.writePopToD()
        self.writeR13ToCompare()
        self.writeCompareDAndM(jump)
        self.increaseStackPointer()
        self.writeDtoStack()
    
    def writeDOperation(self, operation):
        self.output.write("D=D" + operation + "M\n")
    
    def writeDUnaryOperation(self, operation):
        self.output.write("D=" + operation + "D\n")

    def writeCompareDAndM(self, jump):
        label = self.getUniqueLabel()
        self.output.write("@TRUE_" + label + "\n")
        self.output.write("D;" + jump + "\n")
        self.output.write("D=0\n")
        self.output.write("@END_" + label + "\n")
        self.output.write("0;JMP\n")
        self.output.write("(TRUE_" + label + ")\n")
        self.output.write("D=-1\n")
        self.output.write("(END_" + label + ")\n")

    #PUSH -------------------------------------------------------

    def writePushConstant(self, index):
        self.writeAConstantCommand(index)
        self.writeDtoStack()
        self.increaseStackPointer()
    
    def writePushSegment(self, segment, index):
        self.writeSegmentAddress(segment, index)
        self.writeACommand()
        self.writeDtoStack()
        self.increaseStackPointer()
    
    def writePushTemp(self, index):
        self.writeTempAddress(index)
        self.writeACommand()
        self.writeDtoStack()
        self.increaseStackPointer()
    
    def writePushPointer(self, index):
        self.writePointerAddress(index)
        self.writeDtoStack()
        self.increaseStackPointer()
    
    def writePushStatic(self, index):
        self.writeStaticAddress(index)
        self.writeDtoStack()
        self.increaseStackPointer()
    

    #POP ---------------------------------------------------------

    def writePopSegment(self, segment, index):
        self.writeSegmentAddress(segment, index)
        self.writeR13ToM() 
        self.decreaseStackPointer()
        self.writePopToD()
        self.writeR13ToA()
        self.writeDtoM()

    def writePopTemp(self, index):
        self.writeTempAddress(index)
        self.writeR13ToM()
        self.decreaseStackPointer()
        self.writePopToD()
        self.writeR13ToA()
        self.writeDtoM()

    def writePopPointer(self, index):
        self.writePointerAddress(index)
        self.writeR13ToM() 
        self.decreaseStackPointer()
        self.writePopToD()
        self.writeR13ToA()
        self.writeDtoM()

    def writePopStatic(self, index):
        self.writeStaticAddress(index)
        self.writeR13ToM() 
        self.decreaseStackPointer()
        self.writePopToD()
        self.writeR13ToA()
        self.writeDtoM()
     

    #COMMAND TYPES (ASM) A=ADDRESS D=DEST ------------------------------------

    def writeAConstantCommand(self, address):
        self.output.write("@" + str(address) + "\n")
        self.output.write("D=A\n")
    
    def writeACommand(self):
        self.output.write("A=D\n")
        self.output.write("D=M\n")
    
    def writeR13ToM(self):
        self.output.write("@R13\n")
        self.output.write("M=D\n")
    
    def writeR13ToCompare(self):
        self.output.write("@R13\n")
        self.output.write("M=M-D\n")
    
    
    def writePopToD(self):
        self.output.write("@SP\n")
        self.output.write("A=M\n")
        self.output.write("D=M\n")
    
    def writeR13ToA(self):
        self.output.write("@R13\n")
        self.output.write("A=M\n")
    
    def writeDtoM(self):
        self.output.write("M=D\n")
    
    #SEGMENT ADRESSES ------------------------------------------------------------------
    
    def writeDtoStack(self):
        self.output.write("@SP\n")
        self.output.write("A=M\n")
        self.output.write("M=D\n")
    
    def writePointerAddress(self, index):
        if index == 0:
            self.output.write("@THIS\n")
            self.output.write("D=M\n")
        elif index == 1:
            self.output.write("@THAT\n")
            self.output.write("D=M\n")
    
    def writeStaticAddress(self, index):
        self.output.write("@" + self.vm_filename + "." + str(index) + "\n")
        self.output.write("D=M\n")
    
    
    def writeSegmentAddress(self, segment, index):
        if segment == "local":
            self.output.write("@LCL\n")
        elif segment == "argument":
            self.output.write("@ARG\n")
        elif segment == "this":
            self.output.write("@THIS\n")
        elif segment == "that":
            self.output.write("@THAT\n")
        self.output.write("D=M\n")
        self.output.write("@" + str(index) + "\n")
        self.output.write("D=D+A\n")
    
    def writeTempAddress(self, index):
        self.output.write("@R5\n")
        self.output.write("D=A\n")
        self.output.write("@" + str(index) + "\n")
        self.output.write("D=D+A\n")

    #HANDLING CALL/FUNCTIONS ----------------------------------------------

    def writePushLabel(self, label):
        self.output.write("@" + label + "\n")
        self.output.write("D=A\n")
        self.output.write("@SP\n")
        self.output.write("A=M\n")
        self.output.write("M=D\n")
        self.output.write("@SP\n")
        self.output.write("M=M+1\n")
    
    def writeSetARG(self, nArgs):
        self.output.write("@SP\n")
        self.output.write("D=M\n")
        self.output.write("@" + str(nArgs) + "\n")
        self.output.write("D=D-A\n")
        self.output.write("@5\n")
        self.output.write("D=D-A\n")
        self.output.write("@ARG\n")
        self.output.write("M=D\n")

    def writeSetLCL(self):
        self.output.write("@SP\n")
        self.output.write("D=M\n")
        self.output.write("@LCL\n")
        self.output.write("M=D\n")
    
    def writePushCallerImage(self, segment):
        self.output.write("@" + segment + "\n")
        self.output.write("D=M\n")
        self.output.write("@SP\n")
        self.output.write("A=M\n")
        self.output.write("M=D\n")
        self.output.write("@SP\n")
        self.output.write("M=M+1\n")
           
           
    
    #HANDLING RETURN ------------------------------------------------------

    def writeFrameToR13(self):
        self.output.write("@LCL\n")
        self.output.write("D=M\n")
        self.output.write("@R13\n")
        self.output.write("M=D\n")

    def writeReturnAddressToR14(self):
        self.output.write("@5\n")
        self.output.write("A=D-A\n")
        self.output.write("D=M\n")
        self.output.write("@R14\n")
        self.output.write("M=D\n")

    def writeReturnValueToARG(self):
        self.decreaseStackPointer()
        self.writePopToD()
        self.output.write("@ARG\n")
        self.output.write("A=M\n")
        self.output.write("M=D\n")

    def writeSPToARG(self):
        self.output.write("@ARG\n")
        self.output.write("D=M+1\n")
        self.output.write("@SP\n")
        self.output.write("M=D\n")

    def writeRestoreThat(self):
        self.output.write("@R13\n")
        self.output.write("AM=M-1\n")
        self.output.write("D=M\n")
        self.output.write("@THAT\n")
        self.output.write("M=D\n")

    def writeRestoreThis(self):
        self.output.write("@R13\n")
        self.output.write("AM=M-1\n")
        self.output.write("D=M\n")
        self.output.write("@THIS\n")
        self.output.write("M=D\n")

    def writeRestoreArgument(self):
        self.output.write("@R13\n")
        self.output.write("AM=M-1\n")
        self.output.write("D=M\n")
        self.output.write("@ARG\n")
        self.output.write("M=D\n")

    def writeRestoreLocal(self):
        self.output.write("@R13\n")
        self.output.write("AM=M-1\n")
        self.output.write("D=M\n")
        self.output.write("@LCL\n")
        self.output.write("M=D\n")

    def writeReturnAddressToA(self):
        self.output.write("@R14\n")
        self.output.write("A=M\n")

    def writeGotoA(self):
        self.output.write("0;JMP\n")
    

    


    #SP MOVES -------------------------------------------------------------

    def increaseStackPointer(self):
        self.output.write("@SP\n")
        self.output.write("M=M+1\n")
    
    def decreaseStackPointer(self):
        self.output.write("@SP\n")
        self.output.write("M=M-1\n")

#------------------------------------------------------------------------MAIN---------------------------------------------------------------------------


class Main:
    def __init__(self, filename):
        self.parser = Parser(filename)
        fileout = filename.split(".")[0]
        self.code_writer = CodeWriter(fileout + ".asm") 
        self.code_writer.setFileName(fileout)

    def translate(self):
        if self.parser.hasMoreCommands(): self.code_writer.writeInit()
        while self.parser.hasMoreCommands():
            self.parser.advance()
            command_type = self.parser.command_type()
            if command_type == "C_ARITHMETIC":
                self.code_writer.writeArithmetic(self.parser.arg1())
            elif command_type in ["C_PUSH", "C_POP"]:
                segment = self.parser.arg1()
                index = self.parser.arg2()
                self.code_writer.writePushPop(command_type[2:].lower(), segment, index)
            elif command_type == "C_LABEL":
                self.code_writer.writeLabel(self.parser.arg1())
            elif command_type == "C_GOTO":
                self.code_writer.writeGoto(self.parser.arg1())
            elif command_type == "C_IF":
                self.code_writer.writeIf(self.parser.arg1())
            elif command_type == "C_FUNCTION":
                functionName = self.parser.arg1()
                nVars = self.parser.arg2()
                self.code_writer.writeFunction(functionName,nVars)
            elif command_type == "C_CALL":
                functionName = self.parser.arg1()
                nArgs = self.parser.arg2()
                self.code_writer.writeCall(functionName,nArgs)
            elif command_type == "C_RETURN":
                self.code_writer.writeReturn()
        self.code_writer.close()


if __name__ == '__main__':
    filename = input("Entre com seu arquivo VM: ")
    vm = Main(filename)
    vm.translate()