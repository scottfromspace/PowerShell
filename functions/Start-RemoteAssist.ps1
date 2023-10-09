#Serpenz Software, https://www.serpenz.co.nz/

function Start-RemoteAssist {
    param (
        [Parameter(Mandatory=$true)]
        [string]$recipientIP
    )

    msra.exe /offerra $recipientIP
}
