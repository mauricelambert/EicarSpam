var part1: string = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$"

part1.add("EICAR-STANDARD-ANTIVIRUS-TEST-FILE")
for i in 1 .. 300:
    writeFile("eicar" & $i & ".txt", part1 & "!$H+H*")
