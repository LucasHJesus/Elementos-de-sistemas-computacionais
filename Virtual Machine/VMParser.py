class Parser:
    """Hack File Parser

    Loads the given VM file and provides helper functions to parse the commands.
    """

    def __init__(self, file_name: str):
        """Opens the file and prepares for parsing."""
        # Current command that's being processed.
        self.current_command = ""
        # Current command index.
        self.current = -1
        # All commands from the input file.
        self.commands = []
        # Open the file and prepare for parsing.
        # Remove all comments, empty lines, and whitespace characters.
        file = open(file_name)
        for line in file:
            line = line.partition("//")[0]
            line = line.strip()
            if line:
                self.commands.append(line)
        file.close()

    def hasMoreCommands(self) -> bool:
        """Checks if there are any more commands."""
        return (self.current + 1) < len(self.commands)

    def advance(self) -> None:
        """Reads the next command and makes it the current command."""
        self.current += 1
        self.current_command = self.commands[self.current]

    def commandType(self) -> str:
        """Returns the type of the current command."""
        # Define the list of known arithmetic commands.
        arithmetic_commands = ["add", "sub", "neg",
                               "eq", "gt", "lt", "and", "or", "not"]
        # Extract the current command from the input line.
        cmd = self.current_command.split(" ")[0]
        # Determine the type of the current command.
        if cmd in arithmetic_commands:
            return "C_ARITHMETIC"
        elif cmd == "push":
            return "C_PUSH"
        elif cmd == "pop":
            return "C_POP"
        elif cmd == "label":
            return "C_LABEL"
        elif cmd == "goto":
            return "C_GOTO"
        elif cmd == "if-goto":
            return "C_IF"
        elif cmd == "function":
            return "C_FUNCTION"
        elif cmd == "call":
            return "C_CALL"
        elif cmd == "return":
            return "C_RETURN"
        else:
            raise NameError("Unexpected Command Type")

    def arg1(self) -> str:
        """Returns the first argument of the current command. For C_ARITHMETIC returns the command itself. Should not be called for C_RETURN."""
        if self.commandType() == "C_ARITHMETIC":
            return self.current_command.split(" ")[0]
        else:
            return self.current_command.split(" ")[1]

    def arg2(self) -> int:
        """Returns the second argument of the current command. Only valid for C_PUSH, C_POP, C_FUNCTION, and C_RETURN."""
        return int(self.current_command.split(" ")[2])
