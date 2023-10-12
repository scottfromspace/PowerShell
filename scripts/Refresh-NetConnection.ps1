ipconfig /release
ipconfig /renew 
ipconfig /flushdns
if(([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
	$DefaultRoute = (Get-NetRoute | Where-Object { $_.DestinationPrefix -eq '0.0.0.0/0' -and $_.NextHop -ne '::' })[0]
	$DefaultAdapter = Get-NetAdapter | Where-Object { $_.ifIndex -eq $DefaultRoute.InterfaceIndex }
	if ($DefaultAdapter) {
		Disable-NetAdapter -Name "$($DefaultAdapter.Name)" -Confirm:$false
		Start-Sleep -Seconds 1
		Enable-NetAdapter -Name "$($DefaultAdapter.Name)"
	} else {
		Write-Host "Unable to determine the default network adapter."
	}
}
