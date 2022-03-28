# Tests antivirus

Small programs to test your antivirus with eicar strings (create 300 eicar strings in 300 files).

Sources are available here and executables are available [here](https://github.com/mauricelambert/EicarSpam/releases/latest/)

 - Go
 - Rust
 - F#
 - C

## Go

### Linux

#### Start execution with command line

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

#### Start execution with command line

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

        fclose(file);
    }

    return 0;
}
```

## F#

### Linux

#### Start execution with command line

```bash
curl -o EicarSpam_fsharp_Linux.zip "https://objects.githubusercontent.com/github-production-release-asset-2e65be/470340204/bb93d9b2-e6a8-41fa-a489-16ffe71ffb27?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220319%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220319T160736Z&X-Amz-Expires=300&X-Amz-Signature=aff09d23f04c7f76b1a471c4b10ca829ce80b2c01f7fe8890a389fe21837eebf&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=470340204&response-content-disposition=attachment%3B%20filename%3DEicarSpam_fsharp_Linux.zip&response-content-type=application%2Foctet-stream"
unzip EicarSpam_fsharp_Linux.zip
cd EicarSpam_fsharp_Linux
chmod +x EicarSpam
./EicarSpam
```

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

### Linux

#### Start execution with command line

```bash
curl -o EicarSpam_rust_Linux "https://objects.githubusercontent.com/github-production-release-asset-2e65be/470340204/70c67674-6cff-4e71-86ea-73dba509468d?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220319%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220319T161424Z&X-Amz-Expires=300&X-Amz-Signature=f049be0260737dbe0ba2e9de3beb2c7abf7b4a8df81fa87e16ff24fe1f46f5c3&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=470340204&response-content-disposition=attachment%3B%20filename%3DEicarSpam_rust_Linux&response-content-type=application%2Foctet-stream"
chmod +x EicarSpam_rust_Linux
./EicarSpam_rust_Linux
```

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