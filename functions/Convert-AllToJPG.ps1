function Convert-ToJPGs {
    param(
        [Parameter(Mandatory=$true)]
        [array]$FileTypes,
        [switch]$Replace
    )

    $trimmedTypes = @()
    foreach($fileType in $FileTypes)
    {
        if($fileType -like ".*")
        {
            $trimmedTypes += $fileType
        }
    }

    $typesString = ""
    $trimmedTypes | % {
        $typesString = $typesString + ' *' + $_ + ','
    }
    $typesString = $typesString.substring(0,($typesString.length -1))
    $iex = ('$imageFiles = @(gci -Include ' + $typesString + ' -name)')

    Invoke-Expression $iex

    $imageFiles

    [Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    $root = (Get-Item -Path ".\").FullName + "\"

    foreach($imageFile in $imageFiles)
    {
        $image = new-object System.Drawing.Bitmap(($root + $imageFile))
        foreach($fileType in $FileTypes)
        {
            if(($root + $imageFile) -like "*$fileType")
            {
                $newFileName = (($root + $imageFile).Trim($fileType) + ".jpg")
            }
        }

        $image.Save("$newFileName", "jpeg")
    }

    # Delete originals
        
    if($Replace)
    {
        Write-host "Preparing to delete original files..." -ForegroundColor Yellow
        Start-Sleep -seconds 2

        foreach($imageFile in $imageFiles)
        {
            Remove-Item -Path ($root + $imageFile) -Force -ea 0 -confirm:$false
        }
    }
}
