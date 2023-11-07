function Start-RemoteAssist {
    param (
        [Parameter(Mandatory=$true)]
        [string]$recipientIP
    )

    msra.exe /offerra $recipientIP
}
