$command = $MyInvocation.MyCommand.Name

$version = $command.Substring(1, $command.Length - 5)

. .\setup.ps1

init($version);

Write-Host "‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B" -NoNewLine
[Console]::ReadKey() | Out-Null
