function Import-PSFunctions{
	param(
		[string]$Directory
	)
	
	if(-not(Test-Path $Directory))
	{
		$Directory = ".\"
	}
	
	if($Directory.SubString($Directory.Length -1) -ne "\")
	{
		$Directory = ($Directory + "\")
	}
	
	$files = (gci $Directory | Where-Object -property Extension -like "*.ps1")
	if($files.count -gt 0)
	{
		foreach($file in $files)
		{
			Write-Host ("Importing " + $file.BaseName + "...") -foregroundcolor yellow
			. ($Directory + $file.Name)
		}
	
		Write-Host ("`nImported " + $files.count.tostring() + " functions.") -foregroundcolor cyan
	}
}