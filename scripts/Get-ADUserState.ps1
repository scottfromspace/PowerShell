# Get the username from the user
$Username = Read-Host "Enter the username"

# Run the "net user" command to retrieve password information
$NetUserOutput = net user $Username

# Check if the user exists
if ($NetUserOutput -match "The user name could not be found") {
    Write-Host "User not found."
} else {
    # Extract password expiration information
    $PasswordExpiryLine = $NetUserOutput | Select-String "Password expires"
    $PasswordExpiryDate = ($PasswordExpiryLine -split "  ")[-1]

    # Convert the string to a DateTime object
    $PasswordExpiryDateTime = Get-Date $PasswordExpiryDate

    # Calculate the time remaining until expiration
    $TimeRemaining = $PasswordExpiryDateTime - (Get-Date)

    # Check if the password has already expired
    if ($TimeRemaining.TotalSeconds -le 0) {
        Write-Host "Password for user $Username has already expired."
    } else {
        Write-Host "Password for user $Username will expire on $PasswordExpiryDateTime."
        Write-Host "Time remaining until expiration: $($TimeRemaining.Days) days, $($TimeRemaining.Hours) hours, $($TimeRemaining.Minutes) minutes, $($TimeRemaining.Seconds) seconds."
    }

    # Check if the account is enabled or disabled
    $AccountStatusLine = $NetUserOutput | Select-String "Account active"
    if ($AccountStatusLine -match "Yes") {
        Write-Host "Account for user $Username is enabled."
    } else {
        Write-Host "Account for user $Username is disabled."
    }
}