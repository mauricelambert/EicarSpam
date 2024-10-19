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
