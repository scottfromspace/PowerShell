#System name
write-host "Device Name:" -ForegroundColor Yellow
$env:COMPUTERNAME

#device model
write-host "`nDevice Model:" -ForegroundColor Yellow
(Get-WmiObject -Class Win32_ComputerSystem).Model

#OS
write-host "`nOS Version:" -ForegroundColor Yellow
$var = Get-WmiObject -Class Win32_OperatingSystem
$var.Caption
$var.Version
$var.ServicePackMajorVersion
$var.BuildNumber

#User accounts
write-host "`nUser Accounts:" -ForegroundColor Yellow
Get-WmiObject -Class Win32_UserAccount | Select -expand Name

#mobo
write-host "`nMotherboard:" -ForegroundColor Yellow
$var = Get-WmiObject -Class Win32_BaseBoard
$var.Manufacturer
$var.Product
$var.SerialNumber
$var.Version

#cpu
write-host "`nCPU:" -ForegroundColor Yellow
$var = Get-WmiObject -Class Win32_Processor
$var.Name
$var.Manufacturer
$var.NumberOfCores
$var.NumberOfLogicalProcessors
$var.MaxClockSpeed

#installed ram
write-host "`nRAM:" -ForegroundColor Yellow
(Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory

#gpu
write-host "`n:" -ForegroundColor Yellow

#storage
write-host "`n:" -ForegroundColor Yellow

#network adapters
write-host "`n:" -ForegroundColor Yellow
