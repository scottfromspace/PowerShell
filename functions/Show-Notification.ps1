function Show-Notification {
    param (
        [Parameter(Mandatory=$true)]
        [string]$TipTitle,
        [Parameter(Mandatory=$true)]
        [string]$TipText,
        [Parameter(Mandatory=$true)]
        [ValidateSet("None", "Info", "Warning", "Error")]
        [string]$TipIcon,
        [Parameter(Mandatory=$true)]
        [int]$VisibleTime
    )
    Add-Type -AssemblyName System.Windows.Forms
    $global:BalloonMessage = New-Object System.Windows.Forms.NotifyIcon
    $BalloonMessage.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon((Get-Process -id $pid).Path)
    $BalloonMessage.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::$TipIcon
    $BalloonMessage.BalloonTipTitle = $TipTitle
    $BalloonMessage.BalloonTipText = $TipText
    $BalloonMessage.Visible = $true
    $BalloonMessage.ShowBalloonTip($VisibleTime)
}