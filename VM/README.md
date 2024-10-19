# EicarSpam Executables

Cross-platform executables to test your antivirus software with multiple Eicar files, and different ways to use it.

 - Sources are available on my [Github](https://github.com/mauricelambert/EicarSpam/tree/main/VM)
 - Binary files are available in [Github releases](https://github.com/mauricelambert/EicarSpam/releases/) and [SourceForge files](https://sourceforge.net/projects/eicarspam/files/VM/)

1) Elixir
2) Erlang
3) Java

## Elixir

### Compile

```bash
elixir EicarSpam.ex
```

### Run

```bash
iex -e 'EicarSpam.eicar()' 
```

### Sources

```elixir
defmodule EicarSpam do
  def eicar do
    part2 = "!$H+H*"
    string_end = "EICAR-STANDARD-ANTIVIRUS-TEST-FILE" <> part2
    eicar_string = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$#{string_end}"
    1..300
    |> Enum.each(fn i ->
      file_name = "file_#{i}.txt"
      File.write!(file_name, eicar_string)
    end)
  end
end
```

## Erlang

### Compile

```bash
erlc eicarspam.erl
```

### Run

```bash
echo 'eicarspam:eicar().' | erl
```

### Code

```erlang
-module(eicarspam).
-export([eicar/0]).

eicar() ->
    Part1 = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$",
    Part2 = "!$H+H*",
    EicarString = Part1 ++ "EICAR-STANDARD-ANTIVIRUS-TEST-FILE" ++ Part2,
    eicar(1, 300, EicarString).

eicar(End, End, Content) ->
    FileName = io_lib:format("file_~p.txt", [End]),
    {ok, File} = file:open(lists:flatten(FileName), [write]),
    file:write(File, Content),
    file:close(File);
eicar(Start, End, Content) when Start =< End ->
    FileName = io_lib:format("file_~p.txt", [Start]),
    {ok, File} = file:open(lists:flatten(FileName), [write]),
    file:write(File, Content),
    file:close(File),
    eicar(Start + 1, End, Content).
```

## Java

### Compile

```bash
javac EicarSpam.java
echo "Main-Class: EicarSpam" > manifest.txt
jar cfm EicarSpam.jar manifest.txt EicarSpam.class
```

### Run

```bash
java -jar EicarSpam.jar
```

### Code

```java
import java.io.FileWriter;
import java.io.IOException;

public class EicarSpam {
    public static void main(String[] args) {
        String baseFileName = "file_";
        String part2 = "!$H+H*";
        String part1 = "X5O!P%@AP[4\\PZX54(P^)7CC)7}$";
        String eicar = part1 + "EICAR-STANDARD-ANTIVIRUS-TEST-FILE" + part2;

        for (int i = 1; i <= 300; i++) {
            String fileName = baseFileName + i + ".txt";
            writeFile(fileName, eicar);
        }
    }

    public static void writeFile(String fileName, String content) {
        try (FileWriter fileWriter = new FileWriter(fileName)) {
            fileWriter.write(content);
        } catch (IOException e) {
            System.out.println("An error occurred while writing to file: " + fileName);
            e.printStackTrace();
        }
    }
}
```
