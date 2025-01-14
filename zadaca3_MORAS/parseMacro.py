def _parse_macros(self):
    self._counter = 0
    self._stack = []
    self._iter_lines(self._parse_macro)

def _parse_macro(self, line, p, o):
    if line[0] == '$':
        if line[1] == 'M' and line[2] == 'V':
            A = line[4]
            B = line[6]
            l = "@" + A + "\nD=M\n@" + B + "\nM=D\n"
        elif line[1] == 'S' and line[2] == 'W' and line[3] == 'P':
            A = line[5]
            B = line[7]
            l = "@" + A + "\nD=M\n"
            l += "@15\nM=D\n@" + B + "\nD=M\n"
            l += "@" + A + "\nM=D\n@15\nD=M\n@" + B + "\nM=D\n"
        elif line[1] == 'A' and line[2] == 'D' and line[3] == 'D':
            A = line[5]
            B = line[7]
            D = line[9]
            l = "@" + A + "\nD=M\n@" + B + "\nD=D+M\n@" + D + "\nM=D\n"
        elif line[1] == 'W' and line[2] == 'H' and line[3] == 'I' and line[4] == 'L' and line[5] == 'E':
            self._counter += 1
            self._stack.append(self._counter)
            A = line[7]
            l = "(WHILE" + str(self._counter) + ")"
            l += "\n@" + A + "\nD=M\n"
            l += "@END" + str(self._counter)
            l += "\nD;JEQ\n"
        elif line[1] == 'E' and line[2] == 'N' and line[3] == 'D':
            n = self._stack.pop()
            l = "@WHILE" + str(n) + "\n0;JMP\n"
            l += "(END" + str(n) + ")\n"
        else:
            self._flag = False
            self._line = o
            self._errm = "ne valja ime naredbe"
        
        return l
    else:
        return line