function Write-RainbowString {
    param (
        [Parameter(Mandatory=$true)]
        [string]$RainbowString
    )

    if($Shade.Length -eq 0 -or $Shade -like "Light"){
        $RainbowCharacterArray = $RainbowString.ToCharArray()
        $RainbowColorArray = @("DarkRed", "DarkYellow", "Yellow", "DarkGreen", "Blue", "Magenta", "DarkMagenta")
        $RainbowArrayIndexPosition = 0
        foreach($thing in $RainbowCharacterArray){
            Write-Host $thing -ForegroundColor $RainbowColorArray[$RainbowArrayIndexPosition] -NoNewline
            $RainbowArrayIndexPosition++
            if($RainbowArrayIndexPosition -ge ($RainbowColorArray.Count -1)){
                $RainbowArrayIndexPosition = 0
            }
        }
        Write-Host ""
    }
}