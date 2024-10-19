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
