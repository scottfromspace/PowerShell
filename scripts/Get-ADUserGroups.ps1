#Serpenz Software, https://www.serpenz.co.nz/

$user = Read-Host "Enter user's username"

$userGroups = Get-ADPrincipalGroupMembership $user | Select-Object -ExpandProperty Name

$userGroups = $userGroups | Sort-Object

$highlightedGroups = @("Group1", "Group2", "Group3")  # Add your group names here

clear

Write-Host "$user's AD groups:"
$userGroups | ForEach-Object {
    $groupName = $_
    if ($highlightedGroups -contains $groupName) {
        Write-Host $groupName -ForegroundColor Yellow
    } else {
        Write-Host $groupName
    }
}

Read-Host "Press ENTER key to EXIT"
