# Feito em conjunto pelos alunos:
# Bruno Pavan Ciriani da Silva - 12011ECP012
# Leonardo Vecchi Meirelles - 12011ECP002
# Lucas Humberto Jesus de Lima - 12011ECP011

from CPUtables import *

file = input("Nome do arquivo ASM: ")

with open(file, "r") as f:
    lines = [l.split("//")[0].strip().replace(" ", "") \
             for l in f.readlines() \
             if l.strip() and not l.startswith("//")]

lines = list(filter(None, lines))

#print(lines)

codasm = list()
line_count = 0
label_symbols = {}
variable_symbols = {}
next_variable_address = 16

# Finding lables
for l in lines:
    if l.startswith("(") and l.endswith(")"):
        # Found a label line, extract the label and assign the line count as its value
        label = l[1:-1]
        label_symbols[label] = line_count
    else:
        # Increment line count for non-label lines
        line_count += 1

line_count = 0
for l in lines:
    # A-instruction @n (15bits > 0) or symbol (variable, predefined or label)
    # Can't count lines that initializes lables '(label)'
    if not l.startswith("(") and not l.endswith(")"):
        if(l.startswith("@")):
            symbol = (l[1:])
            # If it's a digit, it's an integer. Ex. @12
            if symbol.isdigit():
                n = int(symbol)
                codasm.append(f"0{n:015b}")
            # Else, it starts with some kind of letter, that could be a label, a variable or a predefined symbol.
            else:
                # If it's a symbol in the label list created above (while finding lables).
                # The label value is the line that it was initialized.
                # The code for finding the labels already set the value of each label. 
                if symbol in label_symbols:
                    label_value = label_symbols[symbol]
                    codasm.append(f"0{label_value:015b}")
                # If it's a variable, the value is the next variable address, starting in 16;
                # The counter for this variable is incremented after because of the way I made the code.
                # The lists of labels and variables are on the main program, but the others are dictionaries in another file.
                elif symbol in variable_symbols:
                    variable_value = variable_symbols[symbol]
                    codasm.append(f"0{variable_value:015b}")
                else:
                    # It verifies if the symbol is part of the set of predefined symbols.
                    symbol_value = tPreSymbols(symbol)
                    if symbol_value is not None:
                        codasm.append(f"0{symbol_value:015b}")
                    else:
                        # If it's not, it means that is a variable being accessed for at least the second time.
                        # Of course it will not be in the predefined table and the value is already set.
                        # The next variable address is finally incremented.
                        variable_symbols[symbol] = next_variable_address
                        codasm.append(f"0{next_variable_address:015b}")
                        next_variable_address += 1

        # C-instruction 111accccccdddjjj dest=comp; jump
        # If it has "=" or ";" it has to be a C-instruction
        elif "=" or ";" in l:
            ddd, aux = l.split("=") if "=" in l else ("",l)
            acccccc, jjj = aux.split(";") if ";" in aux else (aux,"")
            codasm.append(f"111{tcomp(acccccc)}{tdest(ddd)}{tjump(jjj)}")
        # After all, the line count is incremented
        line_count += 1

#print(codasm)

with open(file.split('.')[0]+".bin", "w") as f:
    for c in codasm:
        f.write(c+"\n")