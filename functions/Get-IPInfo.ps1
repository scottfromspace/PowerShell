function Get-IPInfo {
    param (
        [string]$IPAddress
    )

    if($IPAddress.Length -eq 0)
    {
        $ipAddress = (Invoke-WebRequest -Uri "https://ipinfo.io/ip").Content.Trim()
    }

    Invoke-RestMethod -Uri "https://ipinfo.io/$ipAddress/json"
}
