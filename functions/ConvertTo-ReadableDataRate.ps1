function ConvertTo-ReadableDataRate {
    param (
        [double]$dataRateInBitsPerSecond
    )

    $suffixes = "bps", "Kbps", "Mbps", "Gbps", "Tbps", "Pbps"
    $index = 0

    while ($dataRateInBitsPerSecond -ge 1000 -and $index -lt $suffixes.Length - 1) {
        $dataRateInBitsPerSecond /= 1000
        $index++
    }

    $formattedDataRate = "{0} {1}" -f [math]::Round($dataRateInBitsPerSecond, 2), $suffixes[$index]
    $formattedDataRate = $formattedDataRate -replace '\.00 ', ' '
    return $formattedDataRate
}
