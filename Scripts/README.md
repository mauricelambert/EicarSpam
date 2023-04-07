# EicarSpam Scripts

Cross-platform scripts to test your antivirus software with multiple Eicar files, and different ways to use it.

 - Scripts are available on my [Github](https://github.com/mauricelambert/EicarSpam/tree/main/Scripts)
 - Scripts are available on [SourceForge files](https://sourceforge.net/projects/eicarspam/files/Scripts)

1) Web
    - HTML (javascript)
2) Windows (without any installation)
    - Batch script: Windows XP - Windows 11/2022
    - VBScript script: Windows XP - Windows 11/2022
    - JScript script: Windows XP - Windows 11/2022
    - Powershell script: Windows 7 - Windows11/2022
3) Linux (without any installation)
    - Bash
4) Linux (probably no installation)
    - Perl
    - Python
5) Others
    - Ruby
    - Nodejs
    - PHP

All these scripts work on Windows 10, Debian sid and CentOS 7, some requirements might be required.

## Python

### Usages

```bash
python3 EicarSpam.py
```

### Sources

```python
for a in range(300):
    with open(f"test{a}","w") as f:
        _ = f.write("X5O!P%@AP[4\\PZX54(P^)7CC)7}$_!$H+H*".replace("_", "EICAR-STANDARD-ANTIVIRUS-TEST-FILE"))
```

### Link

[SourceForge](https://sourceforge.net/projects/eicarspam/files/Scripts/EicarSpam.py/download)

## Powershell

### Usages

```bash
powershell ./EicarSpam.ps1
```

### Sources

```powershell
$string = 'X5O!P%@AP[4\PZX54(P^)7CC)7}$_!$H+H*'.replace('_', 'EICAR-STANDARD-ANTIVIRUS-TEST-FILE')

for($i = 0; $i -lt 300; $i++){
	Set-Content "test$i.txt" $string
}
```

### Link

[SourceForge](https://sourceforge.net/projects/eicarspam/files/Scripts/EicarSpam.ps1/download)

## Bash

### Usages

```bash
bash EicarSpam.sh
```

### Sources

```bash
a='X5O!P%@AP[4\PZX54(P^)7CC)7}$_!$H+H*'
for i in {0..300}; do
	echo "${a/_/EICAR-STANDARD-ANTIVIRUS-TEST-FILE}" > "test${i}.txt"
done
```

```bash
echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$'"EICAR-STANDARD-ANTIVIRUS-TEST-FILE"'!$H+H*' > "test.txt"
```

### Link

[SourceForge](https://sourceforge.net/projects/eicarspam/files/Scripts/EicarSpam.sh/download)

## VBScript

### Usages

```bash
cscript EicarSpam.vbs
```

### Sources

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

### Link

[SourceForge](https://sourceforge.net/projects/eicarspam/files/Scripts/EicarSpam.vbs/download)

## JScript

### Usages

```bash
cscript EicarSpam.js
```

### Sources

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

### Link

[SourceForge](https://sourceforge.net/projects/eicarspam/files/Scripts/EicarSpam.js/download)

## Batch

### Usages

```bash
EicarSpam.bat
```

### Sources

```bash
@echo off
SET a=X5O!P%@AP[4\PZX54(P^)7CC)7}$
SET c=!$H+H*
SET b=EICAR-STANDARD-ANTIVIRUS-TEST-FILE

for /L %D in (1,1,300) do echo %a%%b%%c% > test%D.txt
```

### Link

[SourceForge](https://sourceforge.net/projects/eicarspam/files/Scripts/EicarSpam.bat/download)

## Ruby

### Usages

```bash
ruby EicarSpam.rb
```

### Sources

```rb
300.times {
	|i| File.open("tmp#{i}.txt", 'w') do |f|
		f.write('X5O!P%@AP[4\PZX54(P^)7CC)7}$')
		f.write('EICAR-STANDARD-ANTIVIRUS-TEST-FILE')
		f.write('!$H+H*')
	end
}
```

### Link

[SourceForge](https://sourceforge.net/projects/eicarspam/files/Scripts/EicarSpam.rb/download)

## Perl

### Usages

```bash
perl EicarSpam.pl
```

### Sources

```perl
foreach my $i ((1..300)) {
	# open a filehandle for your file
	open my $file, '>', "test$i.txt" or die "test$i.txt: $!";
	printf $file '%sEICAR-STANDARD-ANTIVIRUS-TEST-FILE%s', 'X5O!P%@AP[4\PZX54(P^)7CC)7}$', '!$H+H*';
	close $file;
}
```

### Link

[SourceForge](https://sourceforge.net/projects/eicarspam/files/Scripts/EicarSpam.pl/download)

## PHP

### Usages

```bash
php EicarSpam.php
```

### Sources

```php
<?php

$middle_string = "EICAR-STANDARD-ANTIVIRUS-TEST-FILE";

for ($i = 0; $i < 300; $i++) {
  $file = fopen("file{$i}.txt", "w");
  fwrite($file, 'X5O!P%@AP[4\\PZX54(P^)7CC)7}$' . $middle_string  . '!$H+H*');
  fclose($file);
}
?>
```

### Link

[SourceForge](https://sourceforge.net/projects/eicarspam/files/Scripts/EicarSpam.php/download)

## NodeJS

### Usages

```bash
node EicarSpam.node.js
```

### Sources

```js
const fs = require('fs');

let middle_string = String.fromCharCode(69,73,67,65,82,45,83,84,65,78,68,65,82,68,45,65,78,84,73,86,73,82,85,83,45,84,69,83,84,45,70,73,76,69);
let middle_string2 = "\133\064\134\120\132\130\065\064";

for (let i = 0; i < 300; i++) {
  fs.writeFile(`file${i}.txt`, '\u{0058}\u{0035}\u{004f}\u{0021}\u{0050}\u{0025}\u{0040}\u{0041}\u{0050}\u{005f}\u{0028}\u{0050}\u{005e}\u{0029}\u{0037}\u{0043}\u{0043}\u{0029}\u{0037}\u{007d}\u{0024}'.replace('_', middle_string2) + middle_string  + atob('ISRIK0gq'), (err) => {if (err) {console.log(err);}});
}
```

### Link

[SourceForge](https://sourceforge.net/projects/eicarspam/files/Scripts/EicarSpam.node.js/download)

## HTML

### Usages

```bash
start EicarSpam.html   # Windows
open EicarSpam.html    # Linux
```

### Sources

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Eicar Spam</title>
  </head>
  <body>
    <h1>Eicar Spam using javascript into WebPage</h1>
    <script>
const middle_string = 'EICAR-STANDARD-ANTIVIRUS-TEST-FILE';
const url = URL.createObjectURL(new Blob(['X5O!P%@AP[4\\PZX54(P^)7CC)7}$' + middle_string  + '!$H+H*'], { type: 'text/plain' }));
for (let i = 0; i < 300; i++) {
  const link = document.createElement('a');
  link.href = url;
  link.download = `file${i}.txt`;
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
}
    </script>
  </body>
</html>
```

### Link

[SourceForge](https://sourceforge.net/projects/eicarspam/files/Scripts/EicarSpam.html/download)
