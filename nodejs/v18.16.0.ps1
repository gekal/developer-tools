$command = $MyInvocation.MyCommand.Name

$version = $command.Substring(1, $command.Length - 5)

. .\setup.ps1

init($version);

Write-Host "�����L�[�������Ă��������B" -NoNewLine
[Console]::ReadKey() | Out-Null
