# EicarSpam Executables

Cross-platform executables to test your antivirus software with multiple Eicar files, and different ways to use it.

 - Sources are available on my [Github](https://github.com/mauricelambert/EicarSpam/tree/main/Executable)
 - Binary files are available in [Github releases](https://github.com/mauricelambert/EicarSpam/releases/latest/) and [SourceForge files](https://sourceforge.net/projects/eicarspam/files/Executables/)

1) Go
2) Rust
3) F#
4) C
5) Nim

## Go

### Compile

```bash
go build EicarSpam.go
./EicarSpam
```

### Sources

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

        fclose(file);
    }

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

## Nim

### Compile

```bash
nim c -r --stackTrace:off --lineTrace:off --lineDir:off EicarSpam.nim
```

### Sources

```nim
var part1: string = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$"
part1.add("EICAR-STANDARD-ANTIVIRUS-TEST-FILE")
for i in 1 .. 300:
    writeFile("eicar" & $i & ".txt", part1 & "!$H+H*")
```
