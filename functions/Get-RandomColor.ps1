function Get-RandomColor {
    param (
        [ValidateSet("Full", "Monochrome", "LightOnly", "DarkOnly", "Passion")]
        [string]$Palette,
        [bool]$UseWhite,
        [bool]$UseBlack
    )

    if($Palette -like "Full" -or $Palette.Length -eq 0){
        $PaletteColorArray = @('Blue', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGreen', 'DarkMagenta', 'DarkRed', 'DarkYellow', 'Green', 'Magenta', 'Red', 'Yellow')
    }
    elseif($Palette -like "Monochrome"){
        $PaletteColorArray = @('DarkGray', 'Gray')
    }
    elseif($Palette -like "LightOnly"){
        $PaletteColorArray = @('Blue', 'Cyan', 'Green', 'Magenta', 'Red', 'Yellow')
    }
    elseif($Palette -like "DarkOnly"){
        $PaletteColorArray = @('DarkBlue', 'DarkCyan', 'DarkGreen', 'DarkMagenta', 'DarkRed', 'DarkYellow')
    }
    elseif($Palette -like "Passion"){
        $PaletteColorArray = @('DarkMagenta', 'DarkRed', 'Magenta', 'Red')
    }

    if($UseWhite -eq $true){
        $PaletteColorArray += "White"
    }

    if($UseBlack -eq $true){
        $PaletteColorArray += "Black"
    }

    $PaletteColorIndex = Get-Random -Maximum $PaletteColorArray.Length
    $Script:RandomColor = $PaletteColorArray[$PaletteColorIndex]

    $RandomColor
} # $RandomColor to call as variable