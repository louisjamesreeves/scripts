﻿Function Invoke-Foo
{
    Param
    (
        [parameter(Mandatory=$true)]
        [ValidateSet(“Tom”,”Dick”,”Jane”)]
        [String]
        $Name
    ,
        [ValidateRange(21,65)]
        [Int]
        $Age
    ,
        [ValidateScript({Test-Path $_ -PathType ‘Container’})]
        [string]
        $Path
    )
    Process
    {
        Write-Host “Hello $Name.  $Age is a good age.  The path $Path is good too."
    }
}


Clear-Host

# Bad name...
"Bad Name..."
Invoke-Foo "Bryan" 18 "C:\somedir"

# Bad age...
"`r`nBad Age..."
Invoke-Foo "Tom" 18 "C:\somedir"

# Path does not exist...
"`r`nBad path..."
Invoke-Foo "Tom" 25 "C:\somedir"

# All good...
"`r`nGood call..."
Invoke-Foo "Tom" 25 "C:\users\Bryan"