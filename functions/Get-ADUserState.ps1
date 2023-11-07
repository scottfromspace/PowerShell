function Get-ADUserState {
    param(
        [Parameter(Mandatory=$true)]
        [string]$user
    )

    $NetUserOutput = net user $user /domain

    # Check if the user exists
    if ($NetUserOutput -match "The user name could not be found")
    {
        Write-Host "User not found."
    }
    else
    {

        # Retrieve the user's first name and last name from Active Directory
        $userID = Get-ADUser -Identity $user
        Write-Host ("User: " + $user + ", " + $userID.GivenName + " " + $userID.Surname)
        Write-Host ("Email: " + $userID.UserPrincipalName + "`n")

        # Extract password expiration information
        $PasswordExpiryLine = $NetUserOutput | Select-String "Password expires"
        $PasswordExpiryDate = ($PasswordExpiryLine -split "  ")[-1]

        # Convert the string to a DateTime object
        $PasswordExpiryDateTime = Get-Date $PasswordExpiryDate

        # Calculate the time remaining until expiration
        $TimeRemaining = $PasswordExpiryDateTime - (Get-Date)

        # Check if the password has already expired
        if($TimeRemaining.TotalSeconds -le 0)
        {
            Write-Host "Password for user $user has already expired." -ForegroundColor Red
        }
        else
        {
            Write-Host "Password will expire on " -NoNewline
            Write-host $PasswordExpiryDateTime.ToString("MMMM d yyyy") -NoNewline -ForegroundColor Yellow
            Write-Host ", at " -NoNewline
            Write-host $PasswordExpiryDateTime.ToString("h:mm tt") -ForegroundColor Yellow
            Write-Host "Time remaining until expiration: " -NoNewline
            Write-host "$($TimeRemaining.Days) days" -NoNewline -ForegroundColor Yellow
            Write-Host ", " -NoNewline
            Write-Host "$($TimeRemaining.Hours) hours" -NoNewline -ForegroundColor Yellow
            Write-Host ", " -NoNewline
            Write-Host "$($TimeRemaining.Minutes) minutes" -NoNewline -ForegroundColor Yellow
            Write-Host ", & " -NoNewline
            Write-Host "$($TimeRemaining.Seconds) seconds " -NoNewline -ForegroundColor Yellow
            Write-Host "from now.`n"
        }

        # Check if the account is enabled, disabled, or locked
        $AccountStatusLine = $NetUserOutput | Select-String "Account active"
        if($AccountStatusLine -match "Yes")
        {
            Write-Host "Account is " -NoNewline
            Write-Host "active.`n" -ForegroundColor Cyan
        }
        elseif($AccountStatusLine -match "No")
        {
            Write-Host "Account is " -NoNewline
            Write-Host "disabled.`n" -ForegroundColor Red
        }
        elseif($AccountStatusLine -match "Locked")
        {
            Write-Host "Account is " -NoNewline
            Write-Host "locked.`n" -ForegroundColor Red
        }
        else
        {
            Write-Host "Account status " -NoNewline
            Write-Host "unknown.`n" -ForegroundColor Yellow
        }
    }
}
