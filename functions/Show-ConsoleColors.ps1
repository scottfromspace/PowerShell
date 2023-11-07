function Show-ConsoleColors {
    foreach ($bgcolor in [Enum]::GetValues([ConsoleColor]))
    {
        foreach ($fgcolor in [Enum]::GetValues([ConsoleColor]))
        {
            write-host "This is an example of $fgcolor text on a $bgcolor background" -ForegroundColor $fgcolor -BackgroundColor $bgcolor
        }
    }
}