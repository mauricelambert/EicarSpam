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
