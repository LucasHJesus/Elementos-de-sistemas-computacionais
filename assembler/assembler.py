import CPUtables as cpu

'''
ainda a fazer:
testar, refatorar

'''

nextVariable = 16
variables = \
{
    "R0":"0",
    "R1":"1",
    "R2":"2",
    "R3":"3",
    "R4":"4",
    "R5":"5",
    "R6":"6",
    "R7":"7",
    "R8":"8",
    "R9":"9",
    "R10":"10",
    "R11":"11",
    "R12":"12",
    "R13":"13",
    "R14":"14",
    "R15":"15",
    "SCREEN":"16384",
    "KBD":"24576",
    "SP":"0",
    "LCL":"1",
    "ARG":"2",
    "THIS":"3",
    "THAT":"4"
}


def saveLabels(vector):
    length = len(vector)
    lineNumber = 0
    while lineNumber <= length:
        line = vector[lineNumber]
        if line.startswith("("):
            variables[line[1:-1]] = lineNumber
            vector.remove(line)
            length = len(vector)
        
        lineNumber += 1
    return variables


def convertTypeC(command):
    if command.isdigit():
        return f"0{int(command): 016b}\n".replace(" ", "")
    if command in variables:
        temp = int(variables[command])
        return f"0{int(temp): 016b}\n".replace(" ", "")
    variables[command] = nextVariable
    nextVariable +=1
    temp = int(variables[command])
    return f"0{int(temp): 016b}\n".replace(" ", "")

def convertTypeA(command):
    ddd, restOfCommand = command.split("=") if "=" in command else ["",command]   
    acccccc = restOfCommand.split(";")[0] if ";" in command else restOfCommand
    jjj = restOfCommand.split(";")[1] if ";" in command else ""
    cmd = f"111{cpu.comp(acccccc)}{cpu.dest(ddd)}{cpu.jump(jjj)}\n".replace(" ","")
    return cmd


def conertToBinary(command):
    if command.startswith("@"):
        return convertTypeC(command[1:])
    else:
        return convertTypeA(command)        


def openFile(file):
    
    with open(file, "r") as f:
        lines = list(l.split("//")[0].replace(" ","") \
        for l in f.readlines() \
        if l.replace(" ","") and not l.startswith("//"))
    return lines

def assembler(fileName):
    bin = []
    try: 
        lines = openFile(file)
    except:
        print("Unable to open file")

    saveLabels(lines)

    for line in lines:
        try:
            bin.append(conertToBinary(line))
        except:
            print("not able to convert instruction:" + line)
            
    with open(file.split(".")[0] + ".bin", "w") as f:
        f.writelines(bin)


if __name__ == "__main__":
    file = input("nome do arquivo asm:\t")
    try:
        assembler(file)
    except:
        print("not possible")