function Compare-ADUsers {
    param(
        [Parameter(Mandatory=$true)]
        [string]$user1,
        [Parameter(Mandatory=$true)]
        [string]$user2
    )

    $user1Groups = Get-ADPrincipalGroupMembership $user1 | Select-Object -ExpandProperty Name
    $user2Groups = Get-ADPrincipalGroupMembership $user2 | Select-Object -ExpandProperty Name

    $uniqueUser1Groups = $user1Groups | Where-Object {
        $_ -notin $user2Groups
    } | Sort-Object

    $uniqueUser2Groups = $user2Groups | Where-Object {
        $_ -notin $user1Groups
    } | Sort-Object

    $commonGroups = $user1Groups | Where-Object {
        $_ -in $user2Groups
    } | Sort-Object

    clear

    Write-Host "$user1's unique AD groups:"
    $uniqueUser1Groups | ForEach-Object {
        Write-Host $_ -ForegroundColor Yellow
    }

    Write-Host "`n$user2's unique AD groups:"
    $uniqueUser2Groups | ForEach-Object {
        Write-Host $_ -ForegroundColor Cyan
    }

    Write-Host "`nAD groups shared by both users:"
    $commonGroups | ForEach-Object {
        Write-Host $_ -ForegroundColor Green
    }
}