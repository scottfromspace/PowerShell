#Serpenz Software, https://www.serpenz.co.nz/

function Compare-ADUsers {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Shutdown", "Restart", "Hibernate", "Log off", "Abort")]
        [string]$Task,
        [string]$Hours,
        [string]$Minutes,
        [string]$Seconds,
        [bool]$DisableWarning
    )

    $time = 0
    $time = $time + ((($Hours * 60) * 60) + ($Minutes * 60) + ($Seconds))

    if($Task -eq "Shutdown")
    {
        shutdown -s -f -t $time
    }
    elseif($Task -eq "Restart")
    {
        shutdown -r -f -t $time
    }
    elseif($Task -eq "Log off")
    {
        shutdown -l -f -t $time
    }
    elseif($Task -eq "Hibernate")
    {
        shutdown -h -f
    }
    elseif($Task -eq "Abort")
    {
        shutdown -a
    }
}
