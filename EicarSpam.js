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
