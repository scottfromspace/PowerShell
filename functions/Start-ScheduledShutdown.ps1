#Serpenz Software, https://www.serpenz.co.nz/
#Schedules a shutdown without the annoying warning before execution, and allows user to more easily set a time

function Start-ScheduledShutdown {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Shutdown", "Restart", "Hibernate", "Log off", "Abort")]
        [string]$Task,
        [int]$Hours,
        [int]$Minutes,
        [int]$Seconds
    )

    $Time = 0
    $Time = $Time + ((($Hours * 60) * 60) + ($Minutes * 60) + ($Seconds))

    if($Task -notlike "Abort")
    {
        $scriptBlock = {
            Param (
                [string]$Task,
                [string]$Time
            )

            if($Task -like "Shutdown")
            {
                shutdown -s -f -t 0
            }
            elseif($Task -like "Restart")
            {
                shutdown -r -f -t 0
            }
            elseif($Task -like "Log off")
            {
                shutdown -l -f -t 0
            }
            elseif($Task -like "Hibernate")
            {
                shutdown -h -f
            }
        }

        $job = Start-Job -Name "ScheduledShutdown" -ScriptBlock $scriptBlock -ArgumentList $Task, $Time
    }
    else
    {
        Stop-Job -Name "ScheduledShutdown"
        Remove-Job -Name "ScheduledShutdown"
        shutdown -a
    }
}
