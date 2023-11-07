function Write-ColorString {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ColorString,
        [ValidateSet('&','$','%','#','@')]
        [string]$Delimiter
    )

    if($Delimiter.Length -eq 0){
        $Delimiter = '&'
    }

    $ColorStringArray = @()
    $ColorStringArray += $ColorString.Split($Delimiter)
    foreach($thing in $ColorStringArray){
        if($thing.Length -ge 1){
            if($thing.SubString(0,1) -eq "b"){
                Write-Host $thing.Substring(1) -ForegroundColor Blue -NoNewline
            }
            elseif($thing.SubString(0,1) -eq 'B'){
                Write-Host $thing.Substring(1) -ForegroundColor DarkBlue -NoNewline
            }
            elseif($thing.SubString(0,1) -eq 'g'){
                Write-Host $thing.Substring(1) -ForegroundColor Green -NoNewline
            }
            elseif($thing.SubString(0,1) -eq 'G'){
                Write-Host $thing.Substring(1) -ForegroundColor DarkGreen -NoNewline
            }
            elseif($thing.SubString(0,1) -eq 'c'){
                Write-Host $thing.Substring(1) -ForegroundColor Cyan -NoNewline
            }
            elseif($thing.SubString(0,1) -eq 'C'){
                Write-Host $thing.Substring(1) -ForegroundColor DarkCyan -NoNewline
            }
            elseif($thing.SubString(0,1) -eq 'r'){
                Write-Host $thing.Substring(1) -ForegroundColor Red -NoNewline
            }
            elseif($thing.SubString(0,1) -eq 'R'){
                Write-Host $thing.Substring(1) -ForegroundColor DarkRed -NoNewline
            }
            elseif($thing.SubString(0,1) -eq 'm'){
                Write-Host $thing.Substring(1) -ForegroundColor Magenta -NoNewline
            }
            elseif($thing.SubString(0,1) -eq 'M'){
                Write-Host $thing.Substring(1) -ForegroundColor DarkMagenta -NoNewline
            }
            elseif($thing.SubString(0,1) -eq 'y'){
                Write-Host $thing.Substring(1) -ForegroundColor Yellow -NoNewline
            }
            elseif($thing.SubString(0,1) -eq 'Y'){
                Write-Host $thing.Substring(1) -ForegroundColor DarkYellow -NoNewline
            }
            elseif($thing.SubString(0,1) -eq '1'){
                Write-Host $thing.Substring(1) -ForegroundColor White -NoNewline
            }
            elseif($thing.SubString(0,1) -eq '2'){
                Write-Host $thing.Substring(1) -ForegroundColor Gray -NoNewline
            }
            elseif($thing.SubString(0,1) -eq '3'){
                Write-Host $thing.Substring(1) -ForegroundColor DarkGray -NoNewline
            }
            elseif($thing.SubString(0,1) -eq '4'){
                Write-Host $thing.Substring(1) -ForegroundColor Black -NoNewline
            }
            else{
                Write-Host $thing -NoNewline
            }
        }
    }
    Write-Host ""
} # Use as "Write-ColorString $ColorString '&'" or "Write-ColorString 'here is &rsome &ctext'" - (color codes = w, White; y, Yellow; r, Red; m, Magenta; c, Cyan; g, Green etc)