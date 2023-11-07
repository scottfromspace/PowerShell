function Get-ComputerIP {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ComputerName
    )

    $IPAddress = [System.Net.Dns]::GetHostAddresses($ComputerName) | Where-Object { $_.AddressFamily -eq 'InterNetwork' } | Select-Object -ExpandProperty IPAddressToString
    if($IPAddress)
    {
        Write-Host "$IPAddress"
    }
    else
    {
        Write-Host "Could not determine the IP address for computer $ComputerName."
    }
}
