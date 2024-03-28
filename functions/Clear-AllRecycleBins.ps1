function Clear-AllRecycleBins {
	$allBins = @()
	foreach ($drivePath in (Get-WmiObject -Class Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 } | Select-Object -ExpandProperty DeviceID))
	{
		try
		{
			$allBins += gci $drivePath -Directory -Force -ea 0 | Where-Object -Property Name -eq '$Recycle.Bin'
			Write-Host "Found Recycle Bin on $drivePath"
		}
		catch
		{
			Write-Host "Error processing $drivePath" -ForegroundColor Yellow
		}
	}

	foreach($recycleBin in $allBins)
	{
		foreach ($item in $recycleBin)
		{
			if ($item.PSIsContainer)
			{
				Remove-Item -Path $item.FullName -Recurse -Force
			}
			else
			{
				Remove-Item -Path $item.FullName -Force
			}
		}
	}
}
