#Serpenz Software, https://www.serpenz.co.nz/

$array = @(gci *.bmp -name)
$managed = $array.length -1
$target = 0
$root = (Get-Item -Path ".\").FullName
$ex = $root + "\"

DO
{
$concat = $ex + $array[$target]
[Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms");
$i = new-object System.Drawing.Bitmap($concat); 
$i; 
$cutup = $concat.Trim(".bmp")
$jpeg = $cutup + ".jpg"
$i.Save("$jpeg","jpeg");
##############################
$target = $target +1
} While ($target -le $managed)

#end
echo $ex > ([Environment]::GetFolderPath("Desktop")+"\path.txt")
invoke-expression 'cmd /c start powershell -Command { $firstLine = Get-Content -Path ([Environment]::GetFolderPath("Desktop")+"\path.txt") -TotalCount 1; cd $firstline; Start-Sleep -s 1; del *.bmp; del ([Environment]::GetFolderPath("Desktop")+"\path.txt") }'
