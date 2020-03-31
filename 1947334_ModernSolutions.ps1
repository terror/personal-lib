function KillThatProcess([string]$n) {
$process = Get-Process $n
$numInstances = (Get-Process $n -ErrorAction 0).Count
Write-Host "There are '$numInstances' processes with the name '$n', proceed? Y/N"
$input = Read-Host

if($input -eq "y" -Or $input -eq "Y") {
$process | Stop-Process
Write-Host "Process successfully stopped" -ForegroundColor DarkGreen -BackgroundColor white
} else {
Write-Host "Operation Cancelled" -ForegroundColor DarkRed -BackgroundColor white
}
}

# sets parameter path to the current location as default
function Bamboozle($path=$PSScriptRoot) {
$randomLetter  = -join ((65..90) + (97..122) | Get-Random -Count 1 | % {[char]$_})
$message = "the quick brown fox jumps over the lazy dog"
# $path = "C:\Users\Liam\Desktop\testfolder"

foreach($letter in $message.ToCharArray()) {
if($randomLetter.ToLower() -eq $letter) {
$message = $message.replace($letter, $letter.ToString().ToUpper())
$letterMatch = $letter
}
}
Write-Host $message -ForegroundColor DarkMagenta -BackgroundColor White
Get-ChildItem -Path $path -Recurse -Filter "*$letterMatch*" | Remove-Item -WhatIf
}