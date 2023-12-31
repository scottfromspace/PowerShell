function Show-SerpenzSplash {
    param (
        [string]$color,
		[int]$sleepTime
    )
	
	$logoLines = @(
		'',
		'',
		'                                                                   ▄▄▄▄▄▄▄▄',
		'                                                               ▄▀▀▀        ▀▀▄▄',
		'                                                            ▄█▀                ▀▄',
		'                                                           █▀                    ▀▄',
		'                                      ▄▄▄                 █      ▄▄▀▀▀▀▀▀█▓▒▒▒     █',
		'                                        ▀▀█▓▓▄▄          ▐▌     █▀         ▀█▒▒▒    █',
		'                                            ▀█▓▓▓▄       █     ▐▌            █▒▒▒▒  ▐▌',
		'                                              ▀█▓▓▓█▄    █     █             ▐▌▒▒▒▒  █',
		'                                                ▀█▓▓▓█▄  █     █             ▐▌▒▒▒▒░ █',
		'                                                ▄▄██▓▓▓█ ▐▌    ▐▌           ▄▓▒▒▒▒▒▒▐▌',
		'                                          ▄▄█▓▀▒▒▒▒▒▒▒▒▀▀▓█     █         ▄█▀▒▒▒▒▒▒▒█',
		'                                       ▄█▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█    ▐█▄▄▄▄▄▄▓▀▒▒▒▒▒▒▒▒▒█',
		'                                      █▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓    ▐▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▀',
		'                                    ▄█▒▒▒▒▒▒▒▒▒▒▒▒▒▄▄▒▒▒▒▒▒▒▒█    ▐▓▒▒▒▒▒▒▒▒▒▒▒▓█▀',
		'                                   ▄▓▒▒▒▒▒▒▒▒▓▀▀▀      ▀██▓▓▄▒█     █▒▒▒▒▒▒▒▄█▀',
		'                                  ▐█▒▒▒▒▒▒▒▓▀           █▓▓▓▓█▀█▄    ▀▓▓▀▀▀▀',
		'                                  █▒▒▒▒▒▒▒█             ▐▓▓▓▓▓▓ ▀▄     ▀▄▄',
		'                                  █▒▒▒▒▒▒▓▌             ▐▓▓▓▓▓█   █▄      ▀▀▀▄▄',
		'                                  █▒▒▒▒▒▓▓▌             █▓▓▓▓▓█     █▄         █▄',
		'                                  ▐▓▒▒▒▒▓▓█▄           ▄▓▓▓▓▓▓█      ▀▄         ▀▄',
		'                                   ▀▓▒▒▒▓▓▓▓█▄▄      ▄█▓▓▓▓▓▓█▌        ▀▄▄        █',
		'                                    ▀▓▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▀            ▀▀▀▄▄▄▄▄█',
		'                                      ▀▓▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▀',
		'                                        ▀▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▀           Serpenz Software',
		'                                           ▀▀▓▓▓▓▓▓▓▓▀▀▀             www.serpenz.co.nz',
		'',
		''
	)
	
	cls
	if($color -ne "")
	{
		0..($logoLines.Count -1) | % {
			Write-Host $logoLines[$_] -foregroundcolor $color
		}
	}
	else
	{
		0..($logoLines.Count -1) | % {
			Write-Host $logoLines[$_]
		}
	}
	
	if($sleepTime -ne "")
	{
		Start-Sleep -seconds $sleepTime
	}
}