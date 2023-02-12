proc eicar(number: int): int {.stdcall,exportc,dynlib.} =
  var part1: string = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$"
  part1.add("EICAR-STANDARD-ANTIVIRUS-TEST-FILE")
  for i in 1 .. number:
    writeFile("eicar" & $i & ".txt", part1 & "!$H+H*")
  return 0
