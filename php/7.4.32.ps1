$command = $MyInvocation.MyCommand.Name

$version = $command.Substring(0, $command.Length - 4)

. .\setup-vc15.ps1

init($version);

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
