#Serpenz Software, https://www.serpenz.co.nz/

$user = Read-Host "Enter user's username"

$userGroups = Get-ADPrincipalGroupMembership $user | Select-Object -ExpandProperty Name

$userGroups = $userGroups | Sort-Object

$commonGroups = @("Group1", "Group2")  # Add your group names here

clear

Write-Host "$user's AD groups:"
$userGroups | ForEach-Object {
    if($commonGroups -contains $_)
    {
        Write-Host $_ -ForegroundColor Cyan
    }
    else
    {
        Write-Host $_
    }
}

Write-Host "`n$user's missing common AD groups:"
$commonGroups | ForEach-Object {
    if($userGroups -notcontains $_)
    {
        Write-Host $_ -ForegroundColor Yellow
    }
}

Read-Host "`nPress ENTER key to EXIT"
