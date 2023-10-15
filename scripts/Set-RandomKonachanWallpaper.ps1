# fetch initial webdata
$web = Invoke-WebRequest "https://konachan.com/post"

# determine total page count
$pagecount = $web.links | Where-Object -Property "href" -Like "/post?page=*"
$pagecount = $pagecount | Select-Object -Expand "outertext" | ForEach-Object {$_ -as [int]}
$pagecount = ($pagecount | Sort-Object)[-1]

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
Invoke-WebRequest $imagefile -OutFile $imagefile.Split("/")[-1].replace("%20"," ")



# not working in powershell 7 because it doesn't find the outertext property for some reason
# might need to do something like this 
# ($web.links | Where-Object -Property "href" -Like "/post?page=*").outerhtml.split(">")

#to do
#count user monitors
#set downloaded image[s] as user wallpaper
#let user set safety level (safe, questionable, explicit)
#maybe let user set some tags?