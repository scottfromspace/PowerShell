function Compare-ChildDirectorySizes{
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path
    )
    
    $dirs = gci $path -Directory -ea 0
    $result = @()

    foreach($dir in $dirs)
    {
        $index = 0
        $length = (gci -force $dir -Recurse -ErrorAction 0 | measure Length -s -ea 0).sum

        $result += [PSCustomObject]@{
            Name = $dir.Name
            Length = $length
        }
    }

    $result | Sort-Object Length -Descending | Select-Object Name, length
}

# Compare-ChildDirectorySizes -Path "C:\"
