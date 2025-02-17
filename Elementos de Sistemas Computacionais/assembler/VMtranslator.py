class Parser:
    def __init__(self, filename):
        if not filename.endswith(".vm"):
            filename += "vm"
        with open(filename, "r") as f:
            self.input = list(l.strip() \
                              for l in f.readlines() if not l.startswith("//"))
        self.seek=0
        self.current_command = None
    
    def hasMoreCommmands(self):
        return self.seek < len(self.input)
    
    def advance(self):
        if self.hasMoreCommmands():
            self.current_ommand = self.input[self.seek]
            self.seek += 1

    def commandTypes(self):
        head = self.current_command.split(' ')[0]
        if head in ['add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or', 'not',]:
            return 'C_ARITHMETIC'
        elif head in ['push', 'pop']:
            return f'C_{head.upper()}'
        else:
            return f'C_{head.upper()}?'
        
    def arg1(self):
        ct = self.commandTypes()
        if ct != 'C_RETURN':
            if ct == 'C_ARITHMETIC':
                return self.current_command.split(' ')[0]
            return self.current_command.split(' ')[1]

    def arg2(self):
        ct = self.commandTypes()
        if ct in ['C_PUSH', 'C_POP', 'C_FUNCTION', 'C_CALL']:
            
    
    def run(self):
        pass        