function Get-SdkPath {
    $dotnetInfo = dotnet --info
    $matches = $dotnetInfo | Select-String -Pattern '^\s*Base Path:\s*(.+)\s*$'
    if (!$matches) {
        Write-Error "Failed to find .NET SDK"
    }
    $sdkPath = $matches.Matches[0].Groups[1].Value
    return $sdkPath
}

Export-ModuleMember Get-SdkPath
