# Tests antivirus

## Python

```python
for a in range(300):
    with open(f"test{a}","w") as f:
        _ = f.write("X5O!P%@AP[4\\PZX54(P^)7CC)7}$_!$H+H*".replace("_", "EICAR-STANDARD-ANTIVIRUS-TEST-FILE"))
```

## Powershell

```powershell
$string = 'X5O!P%@AP[4\PZX54(P^)7CC)7}$_!$H+H*'.replace('_', 'EICAR-STANDARD-ANTIVIRUS-TEST-FILE')

for($i = 0; $i -lt 300; $i++){
	Set-Content "test$i.txt" $string
}
```

## Bash

```bash
a='X5O!P%@AP[4\PZX54(P^)7CC)7}$_!$H+H*'
for i in {0..300}; do
	echo "${a/_/EICAR-STANDARD-ANTIVIRUS-TEST-FILE}" > "test${i}.txt"
done
```

```bash
echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$'"EICAR-STANDARD-ANTIVIRUS-TEST-FILE"'!$H+H*' > "test.txt"
```

## Batch

```bash
@echo off
SET a=X5O!P%@AP[4\PZX54(P^)7CC)7}$
SET b=EICAR-STANDARD-ANTIVIRUS-TEST-FILE
SET c=!$H+H*

for /L %D in (1,1,300) do echo %a%%b%%c% > test%D.txt
```

## Ruby

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

```perl
foreach my $i ((1..300)) {
	# open a filehandle for your file
	open my $file, '>', "test$i.txt" or die "test$i.txt: $!";
	printf $file '%sEICAR-STANDARD-ANTIVIRUS-TEST-FILE%s', 'X5O!P%@AP[4\PZX54(P^)7CC)7}$', '!$H+H*';
	close $file;
}
```

## Go

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