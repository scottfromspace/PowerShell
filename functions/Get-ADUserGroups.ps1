#Serpenz Software, https://www.serpenz.co.nz/

$user = Read-Host "Enter user 1's username"

$userGroups = Get-ADPrincipalGroupMembership $user1 | Select-Object -ExpandProperty Name

$userGroups = $userGroups | Sort-Object

clear

Write-Host "$user's AD groups:"
$userGroups | ForEach-Object {
    Write-Host $_ -ForegroundColor Yellow
}

Read-Host "Press ENTER key to EXIT"
