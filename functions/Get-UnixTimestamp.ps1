function Get-UnixTimestamp {
    param (
        [int]$addSeconds = 0,
        [int]$addMinutes = 0,
        [int]$addHours = 0,
        [int]$subtractSeconds = 0,
        [int]$subtractMinutes = 0,
        [int]$subtractHours = 0
    )
    
    $date = Get-Date
    $date = $date.AddSeconds($addSeconds)
    $date = $date.AddMinutes($addMinutes)
    $date = $date.AddHours($addHours)
    $date = $date.AddSeconds(-$subtractSeconds)
    $date = $date.AddMinutes(-$subtractMinutes)
    $date = $date.AddHours(-$subtractHours)
    
    $timestamp = $date.ToUniversalTime().Subtract((Get-Date "1970-01-01 00:00:00")).TotalSeconds
    return [math]::Round($timestamp)
}
