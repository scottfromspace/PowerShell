function Clamp-Value {
    param(
        [Parameter(Mandatory=$true)]
        [float]$Value,
        [Parameter(Mandatory=$true)]
        [float]$Min = 0,
        [Parameter(Mandatory=$true)]
        [float]$Max = 100,
        [switch]$Int
    )

    if($Value -lt $Min){$Value = $Min}
    elseif($Value -gt $Max){$Value = $Max}

    if($Int){[Int]$Value}
    else{$Value}
}