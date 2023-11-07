function Get-EnvironmentVariables {
    Get-Childitem -Path Env:* | Sort-Object Name
}
