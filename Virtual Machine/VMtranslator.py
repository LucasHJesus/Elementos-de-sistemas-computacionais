"""
Trabalho feito em conjunto pelos alunos
Lucas Humberto Jesus de Lima 12011ECP011
Leonardo Meirelles Vecchi 12011ECP002
Bruno Pavan Ciriani da Silva 12011ECP012
"""


import VMCodeWriter as VMCodeWriter
import VMParser as VMParser

def vm_translator(file_name):
        output_file_name = file_name[:-3] + ".asm"
        code_writer = VMCodeWriter.CodeWriter(output_file_name)
        code_writer.write_init()
        code_writer.set_file_name(file_name)
        parser = VMParser.Parser(file_name)

        while parser.hasMoreCommands():
            parser.advance()
            # Write the current command as a comment to the output file for debugging purposes.
            code_writer.comment(parser.current_command)
            # Determine the current command type.
            # C_ARITHMETIC, C_PUSH, or C_POP.
            command_type = parser.commandType()
            if command_type == "C_ARITHMETIC":
                # Pass the arithmetic command to the code writer.
                code_writer.write_arithmetic(parser.arg1())
            elif command_type in ["C_PUSH", "C_POP"]:
                # Pass the push/pop command to the code writer with its arguments.
                segment = parser.arg1()
                index = parser.arg2()
                code_writer.write_push_pop(command_type, segment, index)
            elif command_type == "C_LABEL":
                # Define label.
                code_writer.write_label(parser.arg1())
            elif command_type == "C_GOTO":
                # Unconditional jump to label.
                code_writer.write_goto(parser.arg1())
            elif command_type == "C_IF":
                # Conditional jump to label.
                code_writer.write_if(parser.arg1())
            elif command_type == "C_FUNCTION":
                # Define a function with number of variables.
                function_name = parser.arg1()
                num_vars = parser.arg2()
                code_writer.write_function(function_name, num_vars)
            elif command_type == "C_CALL":
                # Call a function with number of arguments.
                function_name = parser.arg1()
                num_args = parser.arg2()
                code_writer.write_call(function_name, num_args)
            elif command_type == "C_RETURN":
                # Return from the current function.
                code_writer.write_return()
            else:
                raise NameError("Unsupported Command Type")


if __name__=="__main__":
    file_name = input("Nome do arquivo VM:\t")

