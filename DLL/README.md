# EicarSpam

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
eicarspam = sysdll.LoadLibrary(abspath("EicarSpam.dll"))
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