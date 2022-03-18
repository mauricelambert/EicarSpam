# Tests antivirus

Small scripts and programs to test your antivirus with eicar strings (create 300 eicar strings in 300 files).

1) Windows (without any installation)
 - Batch script: Windows XP - Windows 11/2022
 - VBScript script: Windows XP - Windows 11/2022
 - JScript script: Windows XP - Windows 11/2022
 - Powershell script: Windows 7 - Windows11/2022
 - C executable
 - Go executable
 - F# executable (dotnet 6.0.201)
2) Linux (without any installation)
 - Bash
 - C executable
 - Go executable
 - F# executable (dotnet 6.0.201)
 - Rust executable
3) Linux (probably no installation)
 - Perl
 - Python
4) Others
 - Ruby

All these scripts work on Windows 10, Debian sid and CentOS 7, some requirements might be required.

## Python

```bash
python3 EicarSpam.py
```

```python
for a in range(300):
    with open(f"test{a}","w") as f:
        _ = f.write("X5O!P%@AP[4\\PZX54(P^)7CC)7}$_!$H+H*".replace("_", "EICAR-STANDARD-ANTIVIRUS-TEST-FILE"))
```

## Powershell

```bash
powershell ./EicarSpam.ps1
```

```powershell
$string = 'X5O!P%@AP[4\PZX54(P^)7CC)7}$_!$H+H*'.replace('_', 'EICAR-STANDARD-ANTIVIRUS-TEST-FILE')

for($i = 0; $i -lt 300; $i++){
	Set-Content "test$i.txt" $string
}
```

## Bash

```bash
bash EicarSpam.sh
```

```bash
a='X5O!P%@AP[4\PZX54(P^)7CC)7}$_!$H+H*'
for i in {0..300}; do
	echo "${a/_/EICAR-STANDARD-ANTIVIRUS-TEST-FILE}" > "test${i}.txt"
done
```

```bash
echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$'"EICAR-STANDARD-ANTIVIRUS-TEST-FILE"'!$H+H*' > "test.txt"
```

## VBScript

```bash
EicarSpam.vbs
```

```vbscript
part1 = "X5O!P%@AP[4\PZX54(P^)7CC)7}$"
part3 = "!$H+H*"

For i = 1 To 300
    Set FSO = CreateObject("Scripting.FileSystemObject")
    Set file = FSO.CreateTextFile("test" & CStr(i) & ".text", True)
    file.WriteLine(part1 & "EICAR-STANDARD-ANTIVIRUS-TEST-FILE" & part3)
    file.Close
Next
```

## JScript

```bash
EicarSpam.js
```

```js
var part1;
var part3;
var file;
var FSO;
var i;

part1 = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$";
part3 = "!$H+H*";

for (i = 0; i < 300; i++) {
    FSO = new ActiveXObject("Scripting.FileSystemObject");
    file = FSO.CreateTextFile("test" + i.toString() + ".text", true);
    file.WriteLine(part1 + "EICAR-STANDARD-ANTIVIRUS-TEST-FILE" + part3);
    file.Close()
}
```

## Batch

```bash
EicarSpam.bat
```

```bash
@echo off
SET a=X5O!P%@AP[4\PZX54(P^)7CC)7}$
SET c=!$H+H*
SET b=EICAR-STANDARD-ANTIVIRUS-TEST-FILE

for /L %D in (1,1,300) do echo %a%%b%%c% > test%D.txt
```

## Ruby

```bash
ruby EicarSpam.rb
```

```rb
300.times {
	|i| File.open("tmp#{i}.txt", 'w') do |f|
		f.write('X5O!P%@AP[4\PZX54(P^)7CC)7}$')
		f.write('EICAR-STANDARD-ANTIVIRUS-TEST-FILE')
		f.write('!$H+H*')
	end
}
```

## Perl

```bash
perl EicarSpam.pl
```

```perl
foreach my $i ((1..300)) {
	# open a filehandle for your file
	open my $file, '>', "test$i.txt" or die "test$i.txt: $!";
	printf $file '%sEICAR-STANDARD-ANTIVIRUS-TEST-FILE%s', 'X5O!P%@AP[4\PZX54(P^)7CC)7}$', '!$H+H*';
	close $file;
}
```

## Go

### Linux

#### Download executable

```bash
curl -o EicarSpam_go "https://objects.githubusercontent.com/github-production-release-asset-2e65be/470340204/d14fa6c1-7685-4c75-992d-d840d2726209?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220316%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220316T103304Z&X-Amz-Expires=300&X-Amz-Signature=dc572c25a04a593f666fe1556130f552ad93f631a91698ba40230dbf9c7e519d&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=470340204&response-content-disposition=attachment%3B%20filename%3DEicarSpam_go_Linux&response-content-type=application%2Foctet-stream"
chmod +x EicarSpam_go
./EicarSpam_go
```

### Compile

```bash
go build EicarSpam.go
./EicarSpam
```

### Code

```go
package main

import (
    "log"
    "os"
    "fmt"
)


func main() {
    var datas [3]string
    datas[0] = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$"
    datas[1] = "EICAR-STANDARD-ANTIVIRUS-TEST-FILE"
    datas[2] = "!$H+H*"

    for i := 0; i < 300; i++ {
        file, err := os.Create(fmt.Sprintf("./test%d.txt", i))

        if err != nil {
            log.Fatal(err)
        }
        
        defer file.Close()
        
        for _, data := range datas {
            file.WriteString(data)
        }
    }
}
```

## C

### Linux

#### Download executable

```bash
curl -o EicarSpam_c "https://objects.githubusercontent.com/github-production-release-asset-2e65be/470340204/1ec8cbc3-64bd-40f8-b403-839b11002280?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220316%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220316T101859Z&X-Amz-Expires=300&X-Amz-Signature=0201848ead42c88ee07095a2b056891ea0dcd1fcb0ba7c74b849049b0c4d100a&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=470340204&response-content-disposition=attachment%3B%20filename%3DEicarSpam_c_Linux&response-content-type=application%2Foctet-stream"
chmod +x EicarSpam_c
./EicarSpam_c
```

### Compile

```bash
gcc -o EicarSpam_c -O3 EicarSpam.c           # Debian sid / Windows 10 (MinGW)
gcc --std=c99 -o EicarSpam_c -O3 EicarSpam.c # CentOS 7
./EicarSpam_c
```

### Code

```c
#include<stdio.h>
 
int main() {
    FILE *file;
    char filename[12];
 
    for(int i = 0; i < 300; i++) {
        snprintf(filename, 12, "test%d.txt", i);
        file = fopen(filename, "w");
     
        if(file == NULL) {
            printf("file can't be opened\n");
            return 1;
        }
 
        fprintf(
            file,
            "%sEICAR-STANDARD-ANTIVIRUS-TEST-FILE%s",
            "X5O!P%@AP[4\\PZX54(P^)7CC)7}$",
            "!$H+H*"
        );
    }
 
    fclose(file);
 
    return 0;
}
```

## F#

### Compile

```bash
dotnet new console -lang F# --author MauriceLambert -o EicarSpam -n EicarSpam
mv EicarSpam.fsx EicarSpam/Program.fs

# Windows
dotnet build -o EicarSpamWindows --os win --self-contained
./EicarSpamWindows/EicarSpam.exe

# Linux
dotnet build -o EicarSpamLinux --os linux --self-contained
chmod +x ./EicarSpamLinux/EicarSpam.exe
./EicarSpamLinux/EicarSpam.exe
```

### Run

```bash
dotnet fsi EicarSpam.fsx
```

### Code

```fs
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
```

## Rust

### Compile

```bash
rustc EicarSpam.rs
```

### Code

```rs
use std::fs;

fn main() -> std::io::Result<()> {
    let eicar = format!(
        "{}EICAR-STANDARD-ANTIVIRUS-TEST-FILE{end}",
        "X5O!P%@AP[4\\PZX54(P^)7CC)7}$",
        end="!$H+H*"
    );

    for x in 0..301 {
        fs::write(
            format!("test{}.txt", x), eicar.clone()
        )?;
    }

    Ok(())
}
```