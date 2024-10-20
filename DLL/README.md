# EicarSpam DLLs

Cross-platform DLLs to test your antivirus software with multiple Eicar files, and different ways to use it.

 - Sources are available on my [Github](https://github.com/mauricelambert/EicarSpam/tree/main/DLL)
 - Binary files are available in [Github releases](https://github.com/mauricelambert/EicarSpam/releases/) and [SourceForge files](https://sourceforge.net/projects/eicarspam/files/DLLs/)

1) How to use DLLs
    - Python
    - Ruby
    - Perl
    - VBScript
    - JScript
2) DLLs Sources
    - ASM Linux
    - Nim
    - Rust
    - Go
    - C

## How to use

### Python

```python
# Windows
from ctypes import windll as sysdll
filename = "EicarSpam.dll"

# Linux
from ctypes import cdll as sysdll
filename = "EicarSpam.so"

from os.path import abspath
eicarspam = sysdll.LoadLibrary(abspath(filename))
eicarspam.eicar(300)
```

### Ruby

```rb
# Windows
FILENAME = "EicarSpam.dll"

# Linux
FILENAME = "EicarSpam.so"

require 'fiddle/import'
require 'fiddle/types'

module EicarSpam
    extend Fiddle::Importer
    dlload File.join(Dir.pwd, FILENAME)
    include Fiddle::Win32Types
    extern 'int eicar(int)'
end

EicarSpam.eicar(5)
```

### Perl

```perl
# Windows
use Cwd qw(abs_path);
use File::Spec;
use Win32::API;

Win32::API->Import(abs_path(File::Spec->canonpath('EicarSpam.dll')),'int eicar(int x)');
eicar(5);
```

### JScript

```bash
# download dynwrapx.dll (https://dynwrapx.script-coding.com/dwx/pages/download.php?ver=2.2.0.0&lang=en)
regsvr32.exe /i <path>\dynwrapx.dll
cscript EicarSpam.js
```

```js
var oDynaWrap = new ActiveXObject( "DynamicWrapper" )
oDynaWrap.Register( "EicarSpam.dll", "eicar", "I=l", "R=l" ) // I(input)=l(int), R(return)=l(int)
oDynaWrap.eicar(5)
```

### VBScript

```bash
# download dynwrapx.dll (https://dynwrapx.script-coding.com/dwx/pages/download.php?ver=2.2.0.0&lang=en)
regsvr32.exe /i <path>\dynwrapx.dll
cscript EicarSpam.vbs
```

```vbs
Set DX = CreateObject("DynamicWrapperX")
DX.Register "EicarSpam.dll", "eicar", "i=l", "r=l"
DX.eicar(5)
```

## Sources

### ASM Linux

#### Compile

```bash
nasm -felf64 lib_Linux.asm
ld -shared lib_Linux.o -o EicarSpam_Linux.so
strip EicarSpam_Linux.so
```

```asm
; eicar([IN] int number) -> None

global eicar
default rel

section .text

    itoa:
        mov rax, r10
        lea rsi, [filename]
        add rsi, 4
        mov rcx, 0x30
        mov byte [rsi], cl        ; reset first digit to '0' (0x30, 48)
        add rsi, 1
        mov byte [rsi], cl        ; reset second digit to '0' (0x30, 48)
        add rsi, 1
        mov byte [rsi], cl        ; reset third (and last) digit to '0' (0x30, 48)
        mov rcx, 10               ; divisiion by 10
 ._1:   xor rdx, rdx
        div rcx                   ; rax / rcx
        add dl, 0x30              ; remainder to ASCII digit
        mov byte [rsi], dl
        dec rsi                   ; postion -= 1
        test rax, rax             ; if (rax != 0)
        jnz ._1                   ;     itoa._1()
        ret
        
    eicar:
        mov r10, rdi              ; counter = first_argument
        lea rdi, [eicarstring]
._3:    mov al, byte [rdi]
        test al, al
        je ._4
        add al, 13
        mov byte [rdi], al
        add rdi, 1
        jmp ._3
._4:    push r10
        mov rax, 2                ; 0x2 (2) == open
        mov rsi, 65               ; second argument (mode): O_WRONLY (0o1) | O_CREAT (0o100) == 0o101 (65)
        lea rdi, [filename]       ; first argument (filename)
        xor rdx, rdx
        syscall
        mov r8, rax               ; r8 = fd (file descriptor)
        mov rdx, 68               ; third argument (data length to write) length(eicarstring) == 65
        lea rsi, [eicarstring]    ; second argument (pointer for data to write)
        mov rax, 1                ; 0x1 (1) == write
        mov rdi, r8               ; first argument: file descriptor
        syscall
        pop r10
        dec r10                   ; counter -= 1
        call itoa
        test r10, r10             ; if (counter != 0)
        jne ._4                   ;     eicar._4();

        mov rax, 3                ; 0x3 (3) == close
        mov rdi, r8               ; first argument: file descriptor
        syscall
        ret

section .data
    eicarstring db 75, 40, 66, 20, 67, 24, 51, 52, 67, 78, 39, 79, 67, 77, 75, 40, 39, 27, 67, 81, 28, 42, 54, 54, 28, 42, 112, 23, 56, 60, 54, 52, 69, 32, 70, 71, 52, 65, 55, 52, 69, 55, 32, 52, 65, 71, 60, 73, 60, 69, 72, 70, 32, 71, 56, 70, 71, 32, 57, 60, 63, 56, 20, 23, 59, 30, 59, 29, 0
    filename db 'file000.txt', 0
```

### Nim

```nim
proc eicar(number: int): int {.stdcall,exportc,dynlib.} =
  var part1: string = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$"
  part1.add("EICAR-STANDARD-ANTIVIRUS-TEST-FILE")
  for i in 1 .. number:
    writeFile("eicar" & $i & ".txt", part1 & "!$H+H*")
  return 0
```

### Rust

```rs
use std::fs;

#[no_mangle]
pub extern fn eicar(x: i32) -> i32 {
    let eicar = format!(
        "{}EICAR-STANDARD-ANTIVIRUS-TEST-FILE{end}",
        "X5O!P%@AP[4\\PZX54(P^)7CC)7}$",
        end="!$H+H*"
    );

    for x in 0..x {
        fs::write(
            format!("test{}.txt", x), eicar.clone()
        );
    }

    return 0;
}
```

### C

```c
#include<stdio.h>
 
__declspec( dllexport ) int eicar(int x) {
    FILE *file;
    char filename[12];
 
    for(int i = 0; i < x; i++) {
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

### Go

```go
package main

import (
    "log"
    "os"
    "fmt"
    "C"
)

//export eicar
func eicar(x C.uint) C.uint {
    var datas [3]string
    datas[0] = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$"
    datas[1] = "EICAR-STANDARD-ANTIVIRUS-TEST-FILE"
    datas[2] = "!$H+H*"

    var i C.uint

    for i = 0; i < x; i++ {
        file, err := os.Create(fmt.Sprintf("./test%d.txt", i))

        if err != nil {
            log.Fatal(err)
        }
        
        defer file.Close()
        
        for _, data := range datas {
            file.WriteString(data)
        }
    }

    return C.uint(0)
}

func main () {}
```
