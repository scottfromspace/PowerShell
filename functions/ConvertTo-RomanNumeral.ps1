function ConvertTo-RomanNumeral{
    param(
        [int]$number
    )

    if($number -lt 1 -or $number -gt 3999)
    {
        Write-Host "Number out of range. This function can only convert numbers between 1 and 3999." -ForegroundColor Yellow
        return
    }

    $romanNumerals = @(
        1000, "M",
        900, "CM",
        500, "D",
        400, "CD",
        100, "C",
        90, "XC",
        50, "L",
        40, "XL",
        10, "X",
        9, "IX",
        5, "V",
        4, "IV",
        1, "I"
    )

    $result = ""

    for($i = 0; $i -lt $romanNumerals.Length; $i += 2)
    {
        $value = $romanNumerals[$i]
        $symbol = $romanNumerals[$i + 1]

        while($number -ge $value)
        {
            $result += $symbol
            $number -= $value
        }
    }

    return $result
}