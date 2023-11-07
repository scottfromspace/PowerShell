function Get-WifiKeys {
    $savedNetworks = netsh wlan show profiles | Select-String "All User Profile"

    $networkNames = foreach($savedNetwork in $savedNetworks){
        ($savedNetwork.Line -replace "All User Profile\s+:\s+","").Trim()
    }

    foreach($networkName in $networkNames){
        $networkKey = netsh wlan show profile name="$networkName" key=clear | select-string "Key Content"
        $networkKey = ($networkKey.Line -replace "Key Content\s+:\s+","").Trim()
        $networkDetails = [PSCustomObject]@{
            Name = $networkName
            Password = $networkKey
        }

        $networkDetails
    }
}
