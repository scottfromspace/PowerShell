$PSVersionTable.PSVersion.Major

function Set-RandomKonachanWallpaper {
    param(
        #Konachan settings
        [ValidateSet("Safe", "Questionable", "Explicit", "SafeAndQuestionable", "QuestionableAndExplicit", "All")]
        [string]$Rating,
        [ValidateSet("Score", "Favorited", "WidescreenFirst", "WidescreenLast")]
        [string]$Order,
        [ValidateSet("Larger", "Exact", "Smaller")]
        [string]$SizeMode,
        [int]$Width,
        [int]$Height,
        [array]$Tags,

        #Wallpaper settings
        [Parameter(Mandatory=$true)]
        [ValidateSet("Tile", "Center", "Stretch", "Fit", "Fill", "Span")]
        [string]$Style,
        [Parameter(Mandatory=$true)]
        [bool]$UseAllMonitors,
        [string]$SavePath
    )

    # get count of user's monitors
    [void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    $monitorCount = [System.Windows.Forms.Screen]::AllScreens.Length

    # fetch initial webdata
    $web = Invoke-WebRequest "https://konachan.com/post"

    # determine total page count
    $pagecount = $web.links | Where-Object -Property "href" -Like "/post?page=*"
    $pagecount = $pagecount | Select-Object -Expand "outertext" | ForEach-Object {$_ -as [int]}
    $pagecount = ($pagecount | Sort-Object)[-1]

    # loop for each monitor
    for ($i = 0; $i -lt $monitorCount; $i++) {

        $jobScript = {
            param(
                
            )
        }

        # fetch webdata from a random page
        $web = "https://konachan.com/post?page=" + (Get-Random -Minimum 1 -Maximum $pagecount).ToString()
        $web = Invoke-WebRequest $web

        # identify wallpaper links on the page
        $wallpapers = $web.links | Where-Object -Property "innerhtml" -like ('<IMG title="Rating:' + "*")

        # get a random wallpaper from the selection
        $web = Invoke-WebRequest ("https://konachan.com/" + $wallpapers[(Get-Random -Minimum 0 -Maximum $wallpapers.Count)].href)

        # get link for high-res version of the wallpaper
        if(($web.Links | Where-Object -Property "outerhtml" -like "*original-file-unchanged*" | Select -Expand href).gettype().Name -eq "String")
        {
            $imagefile = ($web.Links | Where-Object -Property "outerhtml" -like "*original-file-unchanged*" | Select -Expand href)
        }
        else
        {
            $imagefile = ($web.Links | Where-Object -Property "outerhtml" -like "*original-file-unchanged*" | Select -Expand href)[-1]
        }

        # download and save the image
        Invoke-WebRequest $imagefile -OutFile ($env:USERPROFILE + "\" + $imagefile.Split("/")[-1].replace("%20"," "))

        # set downloaded image as wallpaper for monitor
        [System.Windows.Forms.SystemParametersInfo]::new(0x0014, 0, ($env:USERPROFILE + "\" + $imagefile.Split("/")[-1].replace("%20"," ")), 0x0001)
    }
}

Set-RandomKonachanWallpaper -Rating All -SizeMode Larger -Width 2560 -Height 1440 -Style Fill -UseAllMonitors $true