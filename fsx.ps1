param (
    [string]
    $Path
)

$CmdPath = "$Path.cmd"
$FsxPath = "$Path.fsx"

[Environment]::CurrentDirectory = $pwd.Path
$fullPath = [IO.Path]::GetFullPath("./.fake/$FsxPath/intellisense.fsx").Replace("$($pwd.Path)\", "")

$FsxContent = "#r `"paket:
nuget FSharp.Core //`"
#load @`"$fullPath`"

printfn `"Hello world!`"
"

$CmdContent = "@echo off
fake --silent run $FsxPath -- %*"

$CmdContent > $CmdPath
$FsxContent > $FsxPath
