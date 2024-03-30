function Start-SystemSearch {
    param(
        [Parameter(Mandatory=$true)]
        [string]$SearchString,
        [string]$Directory = "",
        [array]$Directories = @(),
        [int]$ThrottleLimit = 6
    )

    if($PSVersionTable.PSVersion.Major -ge 7)
    {
        if($Directory)
        {
            if(Test-Path $Directory)
            {
                $Directories += $Directory
            }
        }
        elseif($Directories)
        {
            $tested = @()
            foreach($child in $Directories)
            {
                if(Test-Path $child)
                {
                    $tested += $child
                }
            }

            $Directories = $tested
        }
        else
        {
            $Directories = Get-PSDrive |
                where-object{
                    $_.Provider.Name -eq "FileSystem"
                } | 
                where-object{
                    $_.DisplayRoot.Length -le 3
                } | 
                where-object{
                    $_.Used -gt 0
                } | 
                where-object{
                    $_.root.length -eq 3
                } | 
                select-object -expand root
        }

        Write-Host ("Searching: " + $Directories + "`n")

        $Directories | ForEach-Object -Parallel {
            gci $_ -file -recurse -ea 0 | 
            Where-Object name -like $using:SearchString | 
            Select-Object -Expand FullName
        } -ThrottleLimit $ThrottleLimit
    }
    else
    {
        Write-Host "Sorry, this function is only compatible with PowerShell 7 or newer :(" -ForegroundColor Yellow
    }
}