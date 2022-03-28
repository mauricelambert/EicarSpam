part1 = "X5O!P%@AP[4\PZX54(P^)7CC)7}$"
part3 = "!$H+H*"

For i = 1 To 300
    Set FSO = CreateObject("Scripting.FileSystemObject")
    Set file = FSO.CreateTextFile("test" & CStr(i) & ".text", True)
    file.WriteLine(part1 & "EICAR-STANDARD-ANTIVIRUS-TEST-FILE" & part3)
    file.Close
Next
