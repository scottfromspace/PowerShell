#region Meta
	#Serpenz Software, https://www.serpenz.co.nz/
	#last updated: Fri 8th Sept, 2023
#endregion
function ConvertTo-ReadableFileSize {
    param (
        [double]$sizeInBytes
    )

    $suffixes = "Bytes", "KB", "MB", "GB", "TB", "PB"
    $index = 0

    while ($sizeInBytes -ge 1024 -and $index -lt $suffixes.Length - 1) {
        $sizeInBytes /= 1024
        $index++
    }

    $formattedSize = "{0} {1}" -f [math]::Round($sizeInBytes, 2), $suffixes[$index]
    $formattedSize = $formattedSize -replace '\.00 ', ' '
    return $formattedSize
} #converts a file size in bytes (normally fetched in a get-file result's .length, into a more readable format)