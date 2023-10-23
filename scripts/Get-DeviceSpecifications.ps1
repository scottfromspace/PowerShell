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
}
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

cls

#System name
write-host "Device:" -ForegroundColor Yellow
Write-Host "----------------------------------"
Write-Host ("Name: " + $env:COMPUTERNAME)
write-host ("Model:" + (Get-WmiObject -Class Win32_ComputerSystem).Model)
Write-Host "----------------------------------"

#OS
write-host "`nOS:" -ForegroundColor Yellow
$var = Get-WmiObject -Class Win32_OperatingSystem
Write-Host "----------------------------------"
Write-Host ("Name: " + $var.Caption)
Write-Host ("Version: " + $var.Version)
Write-Host ("Service Pack: " + $var.ServicePackMajorVersion)
Write-Host ("Build: " + $var.BuildNumber)
Write-Host "----------------------------------"

#User accounts
write-host "`nUser Accounts:" -ForegroundColor Yellow
Write-Host "----------------------------------"
Get-WmiObject -Class Win32_UserAccount | Select -expand Name
Write-Host "----------------------------------"

#mobo
write-host "`nMotherboard:" -ForegroundColor Yellow
$var = Get-WmiObject -Class Win32_BaseBoard
Write-Host "----------------------------------"
Write-Host ("Manufacturer: " + $var.Manufacturer)
Write-Host ("Product Name: " + $var.Product)
Write-Host ("Revision: " + $var.Version)
Write-Host "----------------------------------"

#cpu
write-host "`nCPU:" -ForegroundColor Yellow
$var = Get-WmiObject -Class Win32_Processor
Write-Host "----------------------------------"
Write-Host ("Manufacturer: " + $var.Manufacturer)
Write-Host ("Product Name: " + $var.Name)
Write-Host ("Cores: " + $var.NumberOfCores)
Write-Host ("Processors: " + $var.NumberOfLogicalProcessors)
Write-Host ("Clock Speed: " + (ConvertTo-ReadableSpeed (($var.MaxClockSpeed * 1000) * 1000)))
Write-Host "----------------------------------"

#installed ram
write-host "`nRAM:" -ForegroundColor Yellow
Write-Host "----------------------------------"
write-host "Total: " -NoNewline
ConvertTo-ReadableFileSize (Get-WmiObject -class Win32_ComputerSystem).TotalPhysicalMemory
$var = Get-WmiObject -Class Win32_PhysicalMemory
$var | ForEach-Object {
    Write-Host "----------------------------------"
    write-host ("Slot: " + $_.DeviceLocator)
    write-host ("Capacity: " + (ConvertTo-ReadableFileSize $_.Capacity))
    write-host ("Speed: " + (ConvertTo-ReadableSpeed (($_.Speed * 1000) * 1000)))
}
Write-Host "----------------------------------"

#gpu
write-host "`nGPU:" -ForegroundColor Yellow
$var = Get-WmiObject -Class Win32_VideoController
Write-Host "----------------------------------"
Write-Host ("Name: " + $gpuInfo.Name)
Write-Host ("VRAM: " + (ConvertTo-ReadableFileSize $gpuInfo.AdapterRAM))
Write-Host ("Driver Version: " + $gpuInfo.DriverVersion)
Write-Host "----------------------------------"

#storage
write-host "`nStorage:" -ForegroundColor Yellow
$var = Get-PhysicalDisk | Where-Object MediaType -ne "Unspecified" # "Unspecified" blocks usb devices
Write-Host "----------------------------------"
foreach ($drive in $var)
{    
    Write-Host ("Type: " + $drive.FriendlyName)
    Write-Host ("Type: " + $drive.MediaType)
    Write-Host ("Capacity: " + (ConvertTo-ReadableFileSize $drive.Size))
    Write-Host "----------------------------------"
}

#network adapters
write-host "`nNetwork Adapters:" -ForegroundColor Yellow
$var = Get-WmiObject -Class Win32_NetworkAdapter | Where-Object { $_.PhysicalAdapter -eq $true }
Write-Host "----------------------------------"
$networkAdapters | ForEach-Object {
    Write-Host ("Name: " + ($_.Name))
    Write-Host ("Description: " + ($_.Description))
    Write-Host ("MAC Address: " + ($_.MACAddress))
    Write-Host ("Speed: " + (ConvertTo-ReadableDataRate $_.Speed))
    Write-Host "----------------------------------"
}
