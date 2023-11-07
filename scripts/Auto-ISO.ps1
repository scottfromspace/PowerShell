$pisodir = "" #PowerISO (piso.exe) location
$dvdroot = "" #Drive letter for dvd drive (e.g. "D:\")
$outpath = "" #Folder to ouput .iso file to

cls
cd $pisodir

do {
    
    $escape = $false
    do {
        cls
        write-host "`nSearching for DVD media..."
        $name = get-volume | Where-Object DriveLetter -like N | Select-Object -expand filesystemlabel
        if ($name -eq "")
        {
            write-host "No DVD found. Will search again." -ForegroundColor Red
            timeout /t 5
        }
        else
        {
            write-host "Found media: $name" -ForegroundColor Yellow
            start-sleep 1
            $escape = $true
        }

    }
    while ($escape -eq $false)

    $name = $name -replace " ","_"; $name = $name + ".iso"
    $name = $outpath + $name

    .\piso.exe make-image $dvdroot -o $name

    write-host "`nEjecting media" -ForegroundColor yellow
    $drives = Get-WmiObject Win32_Volume -Filter "DriveType=5"
    $drives | ForEach-Object {
        (New-Object -ComObject Shell.Application).Namespace(17).ParseName($_.Name).InvokeVerb("Eject")
    }

    start-sleep 10

}
while ($true)
