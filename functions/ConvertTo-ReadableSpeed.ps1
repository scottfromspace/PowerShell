function ConvertTo-ReadableSpeed {
    param (
        [double]$speedInHertz
    )

    $suffixes = "Hz", "kHz", "MHz", "GHz", "THz", "PHz"
    $index = 0

    while ($speedInHertz -ge 1000 -and $index -lt $suffixes.Length - 1) {
        $speedInHertz /= 1000
        $index++
    }

    $formattedSpeed = "{0} {1}" -f [math]::Round($speedInHertz, 2), $suffixes[$index]
    $formattedSpeed = $formattedSpeed -replace '\.00 ', ' '
    return $formattedSpeed
}
