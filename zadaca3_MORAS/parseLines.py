def _parse_lines(self):
    self._comment = False    
    self._iter_lines(self._parse_line)

def _parse_line(self, line, p, o):
    l = ""
    i = 0
    while i < len(line) - 1:
        p = line[i] + line[i + 1]

        if (self._comment == False and p == "/*") or (self._comment and p == "*/"):
            self._comment = not self._comment
            i += 1
        elif self._comment == False and p == "*/":
            self._flag = False
            self._line = o
            self._errm = "Unbalanced comment delimiter"
        elif (p == "//"):
            break
        elif line[i].isspace() == False and self._comment == False:
            l += line[i]
        #zadatak1
        elif line[0]=='@' and line[1] == '0123456789':
            if int(line[1:]) >= 32767 or int(line[1:]) <= 0:
                self._flag = False
                self._line = o
                self._errm = 'ne valja adresa'
                return ""

        i += 1
    return l 

    
    