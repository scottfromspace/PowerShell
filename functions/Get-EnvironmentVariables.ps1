#Serpenz Software, https://www.serpenz.co.nz/

function Get-EnvironmentVariables {
    Get-Childitem -Path Env:* | Sort-Object Name
}
