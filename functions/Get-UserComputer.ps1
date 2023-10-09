#Serpenz Software, https://www.serpenz.co.nz/

function Get-UserComputer {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Username
    )

    $ComputerName = Get-WmiObject -Query "SELECT * FROM Win32_ComputerSystem" | Where-Object { $_.UserName -like "*\\$Username" } | Select-Object -ExpandProperty Name
    if($ComputerName)
    {
        Write-Host "$ComputerName"
    }
    else
    {
        Write-Host "Can't find $Username's computer."
    }
}
