#Serpenz Software, https://www.serpenz.co.nz/

function Compare-ADUsers {
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
        $userNames = Get-ADUser -Identity $user -Properties GivenName, Surname
        Write-Host ("User: " + $user + ", " + $User.GivenName + " " + $User.Surname)

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
            Write-Host "Password will expire " -NoNewline
            Write-host $PasswordExpiryDateTime.ToString("dd/MM/yyyy, 'at' HH:mm:ss") -ForegroundColor Yellow
            Write-Host "Time remaining until expiration: "
            Write-host "$($TimeRemaining.Days) days, $($TimeRemaining.Hours) hours, $($TimeRemaining.Minutes) minutes, $($TimeRemaining.Seconds) seconds." -ForegroundColor Yellow
        }

        # Check if the account is unlocked or locked
        $AccountStatusLine = $NetUserOutput | Select-String "Account currently locked"
        if($AccountStatusLine -match "Yes")
        {
            Write-Host "Account is " -NoNewline
            Write-Host "locked." -ForegroundColor Red
        }
        else
        {
            Write-Host "Account is " -NoNewline
            Write-Host "not locked." -ForegroundColor Cyan
        }

        # Check if the account is enabled or disabled
        $AccountStatusLine = $NetUserOutput | Select-String "Account active"
        if($AccountStatusLine -match "Yes")
        {
            Write-Host "Account is " -NoNewline
            Write-Host "enabled." -ForegroundColor Cyan
        }
        else
        {
            Write-Host "Account is " -NoNewline
            Write-Host "disabled." -ForegroundColor Red
        }
    }
}
