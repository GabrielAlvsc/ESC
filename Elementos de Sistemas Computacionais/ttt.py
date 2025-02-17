
file = 'ttt.txt'

"""with open(file, "r") as f:
    lines = list(l.split("//")[0].strip() for l in f.readlines() \
                 if l.strip() and not l.startswith("//"))
    
print(lines)"""

f = open(file, "w")
f.write("ABUBLE")
f.close()
