param (
    [string]
    $Path = "Interface.fsi"
)

dotnet clean | Out-Null
dotnet build /p:GenerateInterfaceFile="$Path"
