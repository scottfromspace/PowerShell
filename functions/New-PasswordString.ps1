function New-PasswordString {
    param(
        [Parameter(Mandatory=$true)]
        [int]$PasswordLength,
        [ValidateSet("AllChars", "LowerAlpha", "UpperAlpha", "AlphaNumeric", "LowerAlphaNumeric", "UpperAlphaNumeric", "Numeric", "Special")]
        [string]$Mode
    )
    
    if($PasswordLength -gt 0)
    {
        if($mode -eq "")
        {
            $mode = "AllChars"
        }
    
        $characterSheet = [PSCustomObject]@{
	        LowerAlpha = "abcdefghijklmnopqrstuvwxyz"
	        UpperAlpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	        Numeric = "0123456789"
	        Special = ("`-=~!@#$%^&*()_+[]\{}|;':,./<>?" + '"')
        }

        $passwordCharacters = ""
        if($mode -eq "LowerAlpha")
        {
            $passwordCharacters = ($characterSheet.LowerAlpha)
        }
        elseif($mode -eq "UpperAlpha")
        {
            $passwordCharacters = ($characterSheet.UpperAlpha)
        }
        elseif($mode -eq "Numeric")
        {
            $passwordCharacters = ($characterSheet.Numeric)
        }
        elseif($mode -eq "LowerAlphaNumeric")
        {
            $passwordCharacters = ($characterSheet.LowerAlpha + $characterSheet.Numeric)
        }
        elseif($mode -eq "UpperAlphaNumeric")
        {
            $passwordCharacters = ($characterSheet.UpperAlpha + $characterSheet.Numeric)
        }
        elseif($mode -eq "AlphaNumeric")
        {
            $passwordCharacters = ($characterSheet.LowerAlpha + $characterSheet.UpperAlpha + $characterSheet.Numeric)
        }
        elseif($mode -eq "Special")
        {
            $passwordCharacters = ($characterSheet.Special)
        }
        elseif($mode -eq "AllChars")
        {
            $passwordCharacters = ($characterSheet.LowerAlpha + $characterSheet.UpperAlpha + $characterSheet.Numeric + $characterSheet.Special)
        }
    
        $passwordCharacters = $passwordCharacters.ToCharArray()
        $newPasswordString = ""
        1..$PasswordLength | % {
            $newPasswordString = $newPasswordString + $passwordCharacters[(Get-Random -Minimum 0 -Maximum ($passwordCharacters.Count -1))]
        }
    }
    else
    {
        Write-Host "Length must be greater than 0" -ForegroundColor Red
    }

    $newPasswordString
}