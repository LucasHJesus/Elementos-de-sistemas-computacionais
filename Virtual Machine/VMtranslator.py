
command_types = \
[
    "C_ARITHMETIC",
    "C_PUSH",
    "C_POP",
    "C_LABEL",
    "C_GOTO",
    "C_IF",
    "C_FUNCTION",
    "C_RETURN",
    "C_CALL",
]



class parser:
    def __init__(self,filename):
        if not filename.endswith(".vm"):
            filename+=".vm"
        with open(filename, "r") as f:
            self.input = [l.strip() for l in f.readlines() if not l.startswith("//")]  #tratamento do aruivo de entrada 
        self.seek = 0
        self.currentCommand = None

    def hasMoreCommands(self):
        return self.seek <= len(self.input)
    
    def advence(self):
        if self.hasMoreCommands():
            self.currentCommand = self.input[self.seek]
            self.seek += 1

    def commandType(self):
        head = self.currentCommand.split(" ")[0]
        if head in []:
            return "C_ARITHMETIC"
        if head in ["push","pop"]:
            return f"C_{head.upper()}"
        return f"C_{head.upper()}"
    
    def arg1(self):
        ct = self.commandType()
        if ct != "C_RETURN":
            if ct == "C_ARITHMETIC":
                return self.currentCommand().split(" ")[0]
            return self.currentCommand().split(" ")[1]
    def arg2(self):
        ct = self.commandType()
        if ct in ["C_PUSH","C_POP","C_FUNCTION","C_CALL",]:
            return int(self.currentCommand().split(" ")[2])



if __name__=="__main__":
    filename = input("Nome do arquivo VM:\t")
    
