param (
    [parameter(Mandatory = $false)]
    [String]
    $Args = ""
)

Import-Module "$PSScriptRoot\dotnet.psm1"
$sdkPath = Get-SdkPath
$fsiPath = [IO.Path]::Combine($sdkPath, "FSharp", "fsc.exe")

function fsi {
    return dotnet $fsiPath $args
}

fsi $Args
