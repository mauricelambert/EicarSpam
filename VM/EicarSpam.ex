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
