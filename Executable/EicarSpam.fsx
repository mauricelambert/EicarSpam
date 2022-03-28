open System.IO
let start = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$"
let end_ = "!$H+H*"
let eicar = (
    sprintf
    $"{start}EICAR-STANDARD-ANTIVIRUS-TEST-FILE{end_}"
)
for i = 1 to 300 do
    File.WriteAllText(
        (sprintf "test%i.txt" i), eicar
    )