if([bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544"))
{
    Lock-BitLocker -MountPoint (Get-Item -Path (Split-Path -Parent $MyInvocation.MyCommand.Path) | Select-Object -ExpandProperty Root).FullName -ForceDismount
}
else
{
    $commandString = ('Lock-BitLocker -MountPoint ') + (Get-Item -Path (Split-Path -Parent $MyInvocation.MyCommand.Path) | Select-Object -ExpandProperty Root).FullName + ' -ForceDismount'
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command $commandString" -Verb RunAs
}

# To be run on an UNLOCKED BitLocker encrypted drive
# Will check if it has required elevated permissions (and if not, prompt for them)
# Will force dismount and LOCK the BitLocker encrypted drive
