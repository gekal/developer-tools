$command = $MyInvocation.MyCommand.Name

$version = $command.Substring(0, $command.Length - 4)

. .\setup-vc15.ps1

init($version);

Write-Host "‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B" -NoNewLine
[Console]::ReadKey() | Out-Null
