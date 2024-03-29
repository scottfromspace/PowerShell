function Get-MyGitHubPSFunctions{
    param(
        [Parameter(Mandatory=$true)]
        [string]$Token
    )

    # Set the repository owner and name
    $owner = "scottfromspace"
    $repo = "powershell"

    # Set the GitHub API endpoint for repository contents
    $uri = "https://api.github.com/repos/$owner/$repo/contents/functions/"

    # Make an authenticated GET request to the GitHub API
    $response = Invoke-RestMethod -Uri $uri -Method Get -Headers @{Authorization = "token $token"}

    # Iterate through the response to extract folder and file names
    foreach ($item in $response)
    {
        if($item.type -eq "dir")
        {
            Write-Output "$($item.name)"
        }
        elseif($item.type -eq "file")
        {
            Write-Output "$($item.name)"

            # Set the GitHub API endpoint for raw file content
            $uri = ("https://api.github.com/repos/$owner/$repo/contents/functions/" + $item.name)

            # Make an authenticated GET request to the GitHub API to get the raw content URL
            $response = Invoke-RestMethod -Uri $uri -Method Get -Headers @{Authorization = "token $token"}

            # Download the file using the raw content URL
            Invoke-WebRequest -Uri $response.download_url -OutFile (".\" + $item.name)
        }
    }
}

# Usage
# Get-MyGitHubPSFunctions -Token "MyGitHubAPIAccessToken"