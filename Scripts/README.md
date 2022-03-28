# Tests antivirus

Small scripts and programs to test your antivirus with eicar strings (create 300 eicar strings in 300 files).

1) Windows (without any installation)
 - Batch script: Windows XP - Windows 11/2022
 - VBScript script: Windows XP - Windows 11/2022
 - JScript script: Windows XP - Windows 11/2022
 - Powershell script: Windows 7 - Windows11/2022
2) Linux (without any installation)
 - Bash
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
