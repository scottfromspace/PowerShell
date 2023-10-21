#Serpenz Software, https://www.serpenz.co.nz/

function Compare-ADUsers {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Shutdown", "Restart", "Hibernate", "Log off", "Abort")]
        [string]$Task,
        [string]$Hours,
        [string]$Minutes,
        [string]$Seconds
    )

    if($Task -eq "Shutdown")
    {
        shutdown -s
    }
    elseif($Task -eq "Restart")
    {
        shutdown -r
    }
    elseif($Task -eq "Hibernate")
    {
        shutdown -h
    }
    elseif($Task -eq "Log off")
    {
        shutdown -l
    }
    elseif($Task -eq "Abort")
    {
        shutdown -a
    }
}
