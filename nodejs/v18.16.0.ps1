$command = $MyInvocation.MyCommand.Name

$version = $command.Substring(1, $command.Length - 5)

. .\setup.ps1

init($version);

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
