function Get-ADUserGroups {
    param(
        [Parameter(Mandatory=$true)]
        [string]$user
    )

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
}
