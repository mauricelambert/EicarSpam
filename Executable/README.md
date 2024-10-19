# EicarSpam Executables

Cross-platform executables to test your antivirus software with multiple Eicar files, and different ways to use it.

 - Sources are available on my [Github](https://github.com/mauricelambert/EicarSpam/tree/main/Executable)
 - Binary files are available in [Github releases](https://github.com/mauricelambert/EicarSpam/releases/) and [SourceForge files](https://sourceforge.net/projects/eicarspam/files/Executables/)

1) Go
2) Rust
3) F#
4) C
5) Nim
6) ASM Linux
7) Zig
8) Vala
9) Pony

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

## ASM Linux

### Compile

```bash
nasm -felf64 EicarSpam_Linux.asm
ld EicarSpam_Linux.o -o EicarSpam_Linux
```

### Sources

```asm
global _start

section .text
    itoa:
        mov rax, r10
        mov rsi, filename+4
        mov byte [rsi], '0'             ; reset first digit to 0
        add rsi, 1
        mov byte [rsi], '0'             ; reset second digit to 0
        add rsi, 1
        mov byte [rsi], '0'             ; reset third (and last) digit to 0 (max value 300)
        mov rcx, 10                     ; divisiion by 10
._1:    xor rdx, rdx
        div rcx                         ; rax / rcx
        add dl, '0'                     ; remainder to ASCII digit
        mov byte [rsi], dl
        dec rsi                         ; postion -= 1
        test rax, rax                   ; if (rax != 0)
        jnz ._1                         ;     itoa._1()
        jmp endloop

    _start:
        mov rdi, eicarstring
._3:    mov al, byte [rdi]
        test al, al
        je ._2
        add al, 13
        mov byte [rdi], al
        add rdi, 1
        jmp ._3
._2:    mov r10, 300                    ; counter = 300
        push r10
    startloop:
        mov rax, 2                      ; 0x2 (2) == open
        mov rsi, 65                     ; second argument (mode): O_WRONLY (0o1) | O_CREAT (0o100) == 0o101 (65)
        mov rdi, filename               ; first argument (filename)
        xor rdx, rdx
        syscall
        mov r8, rax                     ; r8 = fd (file descriptor)
        mov rdx, 68                     ; third argument (data length to write) length(eicarstring) == 65
        mov rsi, eicarstring            ; second argument (pointer for data to write)
        mov rax, 1                      ; 0x1 (1) == write
        mov rdi, r8                     ; first argument: file descriptor
        syscall
        pop r10
        dec r10                         ; counter -= 1
        push r10
        jmp itoa
    endloop:
        test r10, r10                   ; if (counter != 0)
        jne startloop                   ;         startloop();

        mov rax, 3                      ; 0x3 (3) == close
        mov rdi, r8                     ; first argument: file descriptor
        syscall

        mov rax, 60                     ; 0x3c (60) == exit
        xor rdi, rdi                    ; exit code: 0
        syscall
        ret

section .data
    eicarstring db 75, 40, 66, 20, 67, 24, 51, 52, 67, 78, 39, 79, 67, 77, 75, 40, 39, 27, 67, 81, 28, 42, 54, 54, 28, 42, 112, 23, 56, 60, 54, 52, 69, 32, 70, 71, 52, 65, 55, 52, 69, 55, 32, 52, 65, 71, 60, 73, 60, 69, 72, 70, 32, 71, 56, 70, 71, 32, 57, 60, 63, 56, 20, 23, 59, 30, 59, 29, 0
    filename db 'file000.txt'
    len equ $-filename
```

## Zig

### Compile

```bash
zig-linux-x86_64-0.14.0-dev.1917+ecd5878b7/zig build-exe -O ReleaseSafe EicarSpam.zig
zig-linux-x86_64-0.14.0-dev.1917+ecd5878b7/zig build-exe -fstrip -fsingle-threaded -target x86_64-windows -O ReleaseFast  EicarSpam.zig
zig-linux-x86_64-0.14.0-dev.1917+ecd5878b7/zig build-exe -fstrip -fsingle-threaded -target x86_64-linux   -O ReleaseSmall EicarSpam.zig
```

### Sources

```zig
const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    const part2 = "!$H+H*";
    const part1 = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$";
    const eicar = try std.fmt.allocPrint(allocator, "{s}EICAR-STANDARD-ANTIVIRUS-TEST-FILE{s}", .{part1, part2});
    
    var i: u32 = 0;
    while (i < 300) : (i += 1) {
        const filename = try std.fmt.allocPrint(allocator, "file_{}.txt", .{i+1});
        defer allocator.free(filename);
        
        var file = try std.fs.cwd().createFile(filename, .{});
        defer file.close();
        
        _ = try file.write(eicar);
    }
}
```

## Vala

### Compile

```bash
valac --Xcc="-O3" --pkg glib-2.0 --pkg gobject-2.0 EicarSpam.vala
```

### Sources

```zig
void main() {
    string part2 = "!$H+H*\0";
    string part1 = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$";
    string eicar = part1 + "EICAR-STANDARD-ANTIVIRUS-TEST-FILE" + part2;
    for (int i = 1; i <= 300; i++) {
        string file_name = "file_" + i.to_string() + ".txt";
        FileStream fs = FileStream.open(file_name, "w");
        fs.write(eicar.data, 1);
    }
}
```

## Pony

### Compile

```bash
ponyc -b EicarSpam .
```

### Sources

```zig
use "files"
use "collections"
actor Main
  new create(env: Env) =>
    let part2 = "!$H+H*"
    let part1 = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$"
    let eicar: String box = part1 + "EICAR-STANDARD-ANTIVIRUS-TEST-FILE" + part2
    for i in Range[U32](1, 301) do
      let filename: String val = "file" + i.string() + ".txt"
      let caps = recover val FileCaps + FileCreate + FileWrite + FileRead + FileStat end
      let file_path = FilePath(FileAuth(env.root), filename, caps)
      let file = File.create(file_path)
      file.write(eicar)
      file.flush()
      file.dispose()
    end
```
