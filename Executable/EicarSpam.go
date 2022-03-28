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