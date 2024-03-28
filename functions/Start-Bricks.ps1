function Start-Bricks {
	$palette = [Enum]::GetValues([ConsoleColor]) | where-object {$_ -ne "Black"}

	do
	{
		cls

		0..9 | % {
			$palette = $palette | Sort-Object {get-random}
			0..11 | % {
				write-host "█████████▓" -backgroundcolor black -foregroundcolor $palette[$_] -NoNewline
			}
			write-host ""
			0..11 | % {
				write-host "█▓▓▓▓▓▓▓▓▒" -backgroundcolor black -foregroundcolor $palette[$_] -NoNewline
			}
			write-host ""
			0..11 | % {
				write-host "▓▒▒▒▒▒▒▒▒▒" -backgroundcolor black -foregroundcolor $palette[$_] -NoNewline
			}

			if($_ -ne 9)
			{
				write-host ""
			}
			else
			{
				start-sleep -Seconds 1
			}
		}
	}
	while($true)
}